//
//  ViewController.h
//  FindPKU
//
//  Created by Roy Sun on 15/4/20.
//  Copyright (c) 2015年 Roy Sun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ABCIntroView.h"
#import "MapViewController.h"

@interface MainViewController : UIViewController<ABCIntroViewDelegate>

@property (strong, nonatomic) ABCIntroView *introView;
@property (strong, nonatomic) LocationManager *locationManager;

-(IBAction)onDoneButtonPressed;

@end
