//
//  PKURegion.h
//  FindPKU
//
//  Created by Roy Sun on 15/5/4.
//  Copyright (c) 2015年 Roy Sun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import <MapKit/MapKit.h>


@interface PKURegion : NSManagedObject<MKAnnotation>

@property (nonatomic, retain) NSNumber * isMonitored;
@property (nonatomic, retain) NSNumber * isDisplayed;
@property (nonatomic, retain) NSNumber * isEntered;
@property (nonatomic, retain) NSNumber * isGoingNext;
@property (nonatomic, retain) NSNumber * latitude;
@property (nonatomic, retain) NSNumber * longitude;
@property (nonatomic, retain) NSString * regionInfo;
@property (nonatomic, retain) NSString * regionName;
@property (nonatomic, retain) NSNumber * regionRadius;

-(CLLocationCoordinate2D) coordinate;

@end
