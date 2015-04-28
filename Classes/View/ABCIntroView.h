//
//  IntroView.h
//  FindPKU
//
//  Created by Roy Sun on 15/4/20.
//  Copyright (c) 2015年 Roy Sun. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ABCIntroViewDelegate <NSObject>

@required
-(IBAction)onDoneButtonPressed;

@end

@interface ABCIntroView : UIView
@property (nonatomic,assign) id<ABCIntroViewDelegate> delegate;

@end
