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
    [self.view addSubview:_mapView];
    
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
    [self.navigationController setNeedsStatusBarAppearanceUpdate];
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
