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
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if (![defaults objectForKey:@"intro_screen_viewed"]) {
        self.introView = [[ABCIntroView alloc] initWithFrame:self.view.frame];
        self.introView.delegate = self;
        self.introView.backgroundColor = [UIColor greenColor];
        [self.view addSubview:self.introView];
    }
}

#pragma mark - ABCIntroViewDelegate Methods

-(IBAction)onDoneButtonPressed{
    
//    Uncomment so that the IntroView does not show after the user clicks "DONE"
//    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//    [defaults setObject:@"YES"forKey:@"intro_screen_viewed"];
//    [defaults synchronize];
    
    [UIView animateWithDuration:1.0 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.introView.alpha = 0;
    } completion:^(BOOL finished) {
        [self.introView removeFromSuperview];
    }];
}



@end