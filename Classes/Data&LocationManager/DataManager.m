//
//  DataManager.m
//  FindPKU
//
//  Created by Roy Sun on 15/5/4.
//  Copyright (c) 2015年 Roy Sun. All rights reserved.
//

#import "DataManager.h"

@implementation DataManager

static DataManager *_sharedDataManager;

+(DataManager *)sharedDataManager
{
    static dispatch_once_t once;
    dispatch_once(&once,^{
        _sharedDataManager = [[DataManager alloc] init];
    });
    return _sharedDataManager;
}

-(id)init
{
    self = [super init];
    if (self) {
        _managedOC = ((AppDelegate *)[[UIApplication sharedApplication] delegate]).managedObjectContext;
        _regions = [[NSMutableArray alloc] init];
    }
    return self;
}


-(void)setupData
{
    [self addPKURegion:@"28楼"
            regionInfo:@"28号学生宿舍楼"
          regionRadius:@50
              latitude:@39.98848242
             longitude:@116.31032104
           isMonitored:NO
           isDisplayed:NO
             isEntered:NO
           isGoingNext:NO];
    
    [self addPKURegion:@"34B楼"
            regionInfo:@"34B号学生宿舍楼"
          regionRadius:@30
              latitude:@39.9871016328
             longitude:@116.3101941705
           isMonitored:NO
           isDisplayed:NO
             isEntered:NO
           isGoingNext:NO];
}

-(PKURegion *)addPKURegion:(NSString *)name
         regionInfo:(NSString *)info
       regionRadius:(NSNumber *)radius
           latitude:(NSNumber *)lal
          longitude:(NSNumber *)lon
        isMonitored:(NSNumber *)isMon
        isDisplayed:(NSNumber *)isDis
          isEntered:(NSNumber *)isEnt
        isGoingNext:(NSNumber *)isGN
{
    PKURegion *region = [NSEntityDescription insertNewObjectForEntityForName:@"PKURegion" inManagedObjectContext:_managedOC];
    
    region.regionName = name;
    region.regionInfo = info;
    region.regionRadius = radius;
    region.latitude = lal;
    region.longitude = lon;
    region.isMonitored = isMon;
    region.isDisplayed = isDis;
    region.isEntered = isEnt;
    region.isGoingNext = isGN;
    
    [self.regions addObject:region];
    
    return region;
}


@end
