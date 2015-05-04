//
//  MapView.m
//  FindPKU
//
//  Created by Roy Sun on 15/4/26.
//  Copyright (c) 2015年 Roy Sun. All rights reserved.
//

#import "MapView.h"

@implementation MapView

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self){
        _mapView = [[MKMapView alloc] initWithFrame:frame];
        _mapView.showsUserLocation = YES;
        _mapView.mapType = MKMapTypeStandard;
        _mapView.zoomEnabled = YES;
        [_mapView setShowsBuildings:YES];
        [self addSubview:_mapView];
        _mapView.userTrackingMode = MKUserTrackingModeFollow;
        
        //_trackingModeButton =[[UIButton alloc] initWithFrame:CGRectMake(10, 10, 10, 10)];
        //CGRect temp = CGRectMake(frame.size.height * 0.7, frame.size.width * 0.7, frame.size.width * 0.1, frame.size.height * 0.1);
        
        _trackingModeButton = [[UIButton alloc] initWithFrame:CGRectMake(self.frame.size.width*.1, self.frame.size.height*.85, self.frame.size.width*.8, 60)];
        [_trackingModeButton setTintColor:[UIColor whiteColor]];
        [_trackingModeButton setTitle:@"Let's Go!" forState:UIControlStateNormal];
        [_trackingModeButton.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Thin" size:18.0]];
        _trackingModeButton.backgroundColor = [UIColor colorWithRed:0.153 green:0.533 blue:0.796 alpha:1.000];
        _trackingModeButton.layer.borderColor = [UIColor colorWithRed:0.153 green:0.533 blue:0.796 alpha:1.000].CGColor;
        [_trackingModeButton addTarget:self action:@selector(TrackingModeButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
        _trackingModeButton.layer.borderWidth =.5;
        _trackingModeButton.layer.cornerRadius = 15;
        [self addSubview:_trackingModeButton];
    }
    return self;
}

-(void) setRegion:(MKCoordinateRegion)region animated:(BOOL)animated
{
    region = [_mapView regionThatFits:region];
    [_mapView setRegion:region animated:animated];
}


- (void)TrackingModeButtonPressed:(id)sender
{
    [self.MVdelegate onTrackingModeButtonPressed];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
