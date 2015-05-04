//
//  ViewController.m
//  FindPKU
//
//  Created by Roy Sun on 15/4/20.
//  Copyright (c) 2015年 Roy Sun. All rights reserved.
//

#import "MainViewController.h"

@implementation MainViewController

-(void)viewDidLoad {
    [super viewDidLoad];
    
    /*
     self.introView = [[ABCIntroView alloc] initWithFrame:self.view.frame];
    self.introView.delegate = self;
    self.introView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:self.introView];
     */
    
    _locationManager = [LocationManager sharedLocationManager];
    [_locationManager startLocationService];
}

-(void)viewWillAppear:(BOOL)animated
{
    //这里有问题，需要仔细推敲一下，不知道为什么返回时候是黑屏的，
    //if(self.introView == nil)
    //{
        self.introView = [[ABCIntroView alloc] initWithFrame:self.view.frame];
        self.introView.delegate = self;
        self.introView.backgroundColor = [UIColor greenColor];
        [self.view addSubview:self.introView];
    //}
    //[self.view bringSubviewToFront:self.introView];
    
    //set white color for status bar
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    [self setNeedsStatusBarAppearanceUpdate];
}

#pragma mark - ABCIntroViewDelegate Methods

-(IBAction)onDoneButtonPressed
{
    MapViewController *_mapViewController = [[MapViewController alloc] init];
    [UIView animateWithDuration:1.0 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.introView.alpha = 0;
    } completion:^(BOOL finished) {
        [self.navigationController pushViewController:_mapViewController animated:YES];
    }];
}



@end