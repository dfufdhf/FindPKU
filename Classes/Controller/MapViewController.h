//
//  MapViewController.h
//  FindPKU
//
//  Created by Roy Sun on 15/4/20.
//  Copyright (c) 2015年 Roy Sun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "MapView.h"
#import "LocationManager.h"

@interface MapViewController : UIViewController<MapViewDelegate,MKMapViewDelegate>

@property (strong, nonatomic) MapView *mapView;
@property (strong, nonatomic) LocationManager *locationManager;


@end
