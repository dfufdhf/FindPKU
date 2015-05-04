//
//  PKURegion.m
//  FindPKU
//
//  Created by Roy Sun on 15/5/4.
//  Copyright (c) 2015年 Roy Sun. All rights reserved.
//

#import "PKURegion.h"


@implementation PKURegion

@dynamic isMonitored;
@dynamic isDisplayed;
@dynamic isEntered;
@dynamic isGoingNext;
@dynamic latitude;
@dynamic longitude;
@dynamic regionInfo;
@dynamic regionName;
@dynamic regionRadius;

-(CLLocationCoordinate2D) coordinate
{
    return CLLocationCoordinate2DMake([[self latitude] doubleValue], [[self longitude] doubleValue]);
}

@end
