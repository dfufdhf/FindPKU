//
//  LocationManager.m
//  FindPKU
//
//  Created by Roy Sun on 15/4/23.
//  Copyright (c) 2015年 Roy Sun. All rights reserved.
//

#import "LocationManager.h"

static LocationManager *_sharedLocationManager;

@implementation LocationManager

+(LocationManager *)sharedLocationManager
{
    static dispatch_once_t once;
    dispatch_once(&once,^{
        _sharedLocationManager = [[LocationManager alloc] init];
    });
    return _sharedLocationManager;
}

-(id)init
{
    self = [super init];
    if (self) {
        self.locationManager = [[CLLocationManager alloc] init];
        [self.locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
        [self.locationManager setDistanceFilter:50.0f];
        [self.locationManager setDelegate:self];
        [self.locationManager requestAlwaysAuthorization];
        //[self setGeocoder:[[CLGeocoder alloc] init]];
    }
    return self;
}

-(void)startLocationService
{
    [self.locationManager startUpdatingLocation];
    [self.locationManager startUpdatingHeading];
}

-(void)updateRegions
{
    NSManagedObjectContext *managedOC = ((AppDelegate *)[[UIApplication sharedApplication] delegate]).managedObjectContext;
    NSError *error = nil;
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"PKURegion"];
    NSArray *regions = [managedOC executeFetchRequest:request error:&error];
    for(PKURegion *pkuregion in regions)
    {
        NSString *regionID = [[[pkuregion objectID] URIRepresentation] absoluteString];
        CLLocationDistance monitorRadius = [pkuregion.regionRadius floatValue];
        CLCircularRegion *region = [[CLCircularRegion alloc] initWithCenter:[pkuregion coordinate] radius:monitorRadius identifier:regionID];
        [[self locationManager] startMonitoringForRegion:region];
        pkuregion.isMonitored = @YES;
    }
}


#pragma mark - CLLocationManagerDelegate methods

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    CLLocation *lastLocation = [locations lastObject];
    if(lastLocation.horizontalAccuracy < 0)
    {
        return;
    }
    
    [self setLocation:lastLocation];
    [self setHasLocation:YES];
    [self setLocationError:nil];
    
    CLLocationCoordinate2D coord = lastLocation.coordinate;
    NSLog(@"Location lat/long: %f,%f",coord.latitude, coord.longitude);
    
    /*CLLocationAccuracy horizontalAccuracy =
    lastLocation.horizontalAccuracy;
    
    NSLog(@"Horizontal accuracy: %f meters",horizontalAccuracy);
    
    CLLocationDistance altitude = lastLocation.altitude;
    NSLog(@"Location altitude: %f meters",altitude);
    
    CLLocationAccuracy verticalAccuracy =
    lastLocation.verticalAccuracy;
    
    NSLog(@"Vertical accuracy: %f meters",verticalAccuracy);
    
    NSDate *timestamp = lastLocation.timestamp;
    NSLog(@"Timestamp: %@",timestamp);
    
    CLLocationSpeed speed = lastLocation.speed;
    NSLog(@"Speed: %f meters per second",speed);
    
    CLLocationDirection direction = lastLocation.course;
    NSLog(@"Course: %f degrees from true north",direction);*/
    
}

- (void)locationManager:(CLLocationManager *)manager
didChangeAuthorizationStatus:(CLAuthorizationStatus)status
{
    if (status == kCLAuthorizationStatusDenied)
    {
        // Location services are disabled on the device.
        [self.locationManager stopUpdatingLocation];
        
        NSString *errorMessage =
        @"Location Services Permission Denied for this app.  Visit Settings.app to allow.";
        
        NSDictionary *errorInfo =
        @{NSLocalizedDescriptionKey : errorMessage};
        
        NSError *deniedError =
        [NSError errorWithDomain:@"ICFLocationErrorDomain"
                            code:1
                        userInfo:errorInfo];
        
        [self setLocationError:deniedError];
        //[self getLocationWithCompletionBlock:nil];
    }
    if (status == kCLAuthorizationStatusAuthorizedAlways)
    {
        // Location services have just been authorized on the device, start updating now.
        [self.locationManager startUpdatingLocation];
        [self setLocationError:nil];
    }
}



@end
