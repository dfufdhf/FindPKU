//
//  MapViewController.m
//  FindPKU
//
//  Created by Roy Sun on 15/4/20.
//  Copyright (c) 2015年 Roy Sun. All rights reserved.
//

#import "MapViewController.h"

@interface MapViewController ()

@end

@implementation MapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _locationManager = [LocationManager sharedLocationManager];
    _mapView = [[MapView alloc] initWithFrame:self.view.frame];
    _mapView.MVdelegate = self;
    _mapView.mapView.delegate = self;
    
    /*
    MKCoordinateRegion region;
    region.center.latitude = _locationManager.location.coordinate.latitude;
    region.center.longitude = _locationManager.location.coordinate.longitude;
    region.span.latitudeDelta = 0.001;
    region.span.longitudeDelta = 0.001;
    [_mapView setRegion:region animated:YES];
     */
    
    [self.view addSubview:_mapView];
    [self updateMapAnnotations];
    
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
    [self.navigationController setNeedsStatusBarAppearanceUpdate];
}

-(void)viewDidDisappear:(BOOL)animated
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - MapViewDelegate

-(IBAction)onTrackingModeButtonPressed
{
    _mapView.mapView.userTrackingMode = MKUserTrackingModeFollowWithHeading;
}

-(MKOverlayRenderer*)mapView:(MKMapView *)mapView rendererForOverlay:(id<MKOverlay>)overlay
{
    if([overlay isKindOfClass:[MKCircle class]])
    {
        MKCircleRenderer *circle = [[MKCircleRenderer alloc]initWithOverlay:overlay];
        circle.lineWidth = 2.0;
        //circle.strokeColor = [UIColor blueColor];
        circle.fillColor = [[UIColor redColor]colorWithAlphaComponent:0.1];
        return circle;
    }
    return nil;
}

#pragma mark - MKMapViewDelegate

-(void)mapView:(MKMapView *)mapView regionDidChangeAnimated:(BOOL)animated
{
    //如何调整地图的合适缩放级别
    /*MKCoordinateRegion region;
    region.center = _mapView.mapView.userLocation.coordinate;
    region.span.latitudeDelta = 0.001;
    region.span.longitudeDelta = 0.001;
    [_mapView setRegion:region animated:NO];*/
}

-(void)updateMapAnnotations
{
    [_mapView.mapView removeAnnotations:_mapView.mapView.annotations];
    [_mapView.mapView removeOverlays:_mapView.mapView.overlays];
    
    NSArray *regions = [DataManager sharedDataManager].regions;
    [_mapView.mapView addAnnotations:regions];
    
    for(PKURegion *region in regions)
    {
        MKCircle *circle = [MKCircle circleWithCenterCoordinate:region.coordinate radius:[region.regionRadius doubleValue]];
        [_mapView.mapView addOverlay:circle];
    }
    
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
