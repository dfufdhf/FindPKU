//
//  MapViewController.h
//  FindPKU
//
//  Created by Roy Sun on 15/4/20.
//  Copyright (c) 2015年 Roy Sun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@protocol MapViewControllerDelegate



@end


@interface MapViewController : UIViewController

@property id<MapViewControllerDelegate> delegate;

@end
