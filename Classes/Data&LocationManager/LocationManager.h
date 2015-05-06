//
//  LocationManager.h
//  FindPKU
//
//  Created by Roy Sun on 15/4/23.
//  Copyright (c) 2015年 Roy Sun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import "PKURegion.h"
#import "AppDelegate.h"

@interface LocationManager : NSObject <CLLocationManagerDelegate>

@property (strong, nonatomic) CLLocation *location;
@property (strong, nonatomic) CLLocationManager *locationManager;
@property (nonatomic) BOOL hasLocation;
@property (nonatomic, strong) NSError *locationError;
@property (strong, nonatomic) CLGeocoder *geocoder;

+(LocationManager *) sharedLocationManager;
-(void)startLocationService;
-(void)updateRegions;
-(void)stopMonitorAllRegions;

@end
