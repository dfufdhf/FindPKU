//
//  DataManager.h
//  FindPKU
//
//  Created by Roy Sun on 15/5/4.
//  Copyright (c) 2015年 Roy Sun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AppDelegate.h"
#import "PKURegion.h"

@interface DataManager : NSObject

@property(nonatomic,strong) NSManagedObjectContext *managedOC;
@property(nonatomic,strong) NSMutableArray *regions;

+(DataManager *)sharedDataManager;

-(void)setupData;

-(PKURegion *)addPKURegion:(NSString*)name
         regionInfo:(NSString*)info
       regionRadius:(NSNumber*)radius
           latitude:(NSNumber*)lal
          longitude:(NSNumber*)lon
        isMonitored:(NSNumber*)isMon
        isDisplayed:(NSNumber*)isDis
          isEntered:(NSNumber*)isEnt
        isGoingNext:(NSNumber*)isGN;

@end
