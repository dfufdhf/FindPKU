//
//  MapView.h
//  FindPKU
//
//  Created by Roy Sun on 15/4/26.
//  Copyright (c) 2015年 Roy Sun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@protocol MapViewDelegate <NSObject>

@required
-(IBAction)onTrackingModeButtonPressed;

@end

@interface MapView : UIView

@property (strong, nonatomic) MKMapView *mapView;
@property (strong, nonatomic) UIButton *trackingModeButton;
@property (assign, nonatomic) id<MapViewDelegate> MVdelegate;

-(void) setRegion:(MKCoordinateRegion) region animated:(BOOL)animated;

@end
