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
              latitude:@39.988401
             longitude:@116.310172
           isMonitored:NO
           isDisplayed:NO
             isEntered:NO
           isGoingNext:NO];
    
    [self addPKURegion:@"34B楼"
            regionInfo:@"34B号学生宿舍楼"
          regionRadius:@30
              latitude:@39.987062
             longitude:@116.310242
           isMonitored:NO
           isDisplayed:NO
             isEntered:NO
           isGoingNext:NO];
    
    [self addPKURegion:@"五四运动场"
            regionInfo:@"五四运动场，篮球场，排球场，足球场都有哦~"
          regionRadius:@120
              latitude:@39.987599
             longitude:@116.313606
           isMonitored:NO
           isDisplayed:NO
             isEntered:NO
           isGoingNext:NO];
    
    [self addPKURegion:@"遥感楼"
            regionInfo:@"遥感与地理信息系统专业的大本营！"
          regionRadius:@20
              latitude:@39.993147
             longitude:@116.312428
           isMonitored:NO
           isDisplayed:NO
             isEntered:NO
           isGoingNext:NO];
    
    [self addPKURegion:@"地学楼"
            regionInfo:@"地小空和城小环的家~"
          regionRadius:@50
              latitude:@39.991720
             longitude:@116.314553
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
