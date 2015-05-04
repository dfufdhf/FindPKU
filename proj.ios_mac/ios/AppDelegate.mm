//
//  AppDelegate.m
//  FindPKU
//
//  Created by Roy Sun on 15/4/20.
//  Copyright (c) 2015年 Roy Sun. All rights reserved.
//


#import "AppDelegate.h"
#import "cocos2d.h"
#import "MainViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    ///1.Cocos2d-x Part
    
    /*cocos2d::Application *app = cocos2d::Application::getInstance();
     app->initGLContextAttrs();
     cocos2d::GLViewImpl::convertAttrs();
     
     // Override point for customization after application launch.
     
     // Add the view controller's view to the window and display.
     window = [[UIWindow alloc] initWithFrame: [[UIScreen mainScreen] bounds]];
     
     // Init the CCEAGLView
     CCEAGLView *eaglView = [CCEAGLView viewWithFrame: [window bounds]
     pixelFormat: (NSString*)cocos2d::GLViewImpl::_pixelFormat
     depthFormat: cocos2d::GLViewImpl::_depthFormat
     preserveBackbuffer: NO
     sharegroup: nil
     multiSampling: NO
     numberOfSamples: 0 ];
     
     // Use RootViewController manage CCEAGLView
     _viewController = [[RootViewController alloc] initWithNibName:nil bundle:nil];
     _viewController.wantsFullScreenLayout = YES;
     _viewController.view = eaglView;
     
     // Set RootViewController to window
     if ( [[UIDevice currentDevice].systemVersion floatValue] < 6.0)
     {
     // warning: addSubView doesn't work on iOS6
     [window addSubview: _viewController.view];
     }
     else
     {
     // use this method on ios6
     [window setRootViewController:_viewController];
     }
     
     [window makeKeyAndVisible];
     
     [[UIApplication sharedApplication] setStatusBarHidden:true];
     
     // IMPORTANT: Setting the GLView should be done after creating the RootViewController
     cocos2d::GLView *glview = cocos2d::GLViewImpl::createWithEAGLView(eaglView);
     cocos2d::Director::getInstance()->setOpenGLView(glview);
     
     app->run();
     */
    
    ///2.Cocoa Part
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    MainViewController *_mainViewController = [MainViewController alloc];
    
    UINavigationController * navigationController = [UINavigationController alloc];
    (void)[navigationController initWithRootViewController:_mainViewController];
    [navigationController.navigationBar setHidden:YES];
    [self.window setRootViewController:navigationController];
    
    [self.window makeKeyAndVisible];
    
    
    ///3.core data test
    /*NSManagedObjectContext *context = [self managedObjectContext];
    NSManagedObject *pkuregion = [NSEntityDescription insertNewObjectForEntityForName:@"PKURegion" inManagedObjectContext:context];
    [pkuregion setValue:@39.3 forKey:@"longitude"];
    [pkuregion setValue:@116.3 forKey:@"latitude"];
    
    NSError *error;
    if(![context save:&error])
        NSLog(@"Error!!!!");
    */
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
    //We don't need to call this method any more. It will interupt user defined game pause&resume logic
    /* cocos2d::Director::getInstance()->pause(); */
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
    //We don't need to call this method any more. It will interupt user defined game pause&resume logic
    /* cocos2d::Director::getInstance()->resume(); */
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
     If your application supports background execution, called instead of applicationWillTerminate: when the user quits.
     */
    //cocos2d::Application::getInstance()->applicationDidEnterBackground();
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    /*
     Called as part of  transition from the background to the inactive state: here you can undo many of the changes made on entering the background.
     */
    //cocos2d::Application::getInstance()->applicationWillEnterForeground();
}

- (void)applicationWillTerminate:(UIApplication *)application {
    /*
     Called when the application is about to terminate.
     See also applicationDidEnterBackground:.
     */
    [self saveContext];
}


#pragma mark - Core Data stack

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

- (NSURL *)applicationDocumentsDirectory {
    // The directory the application uses to store the Core Data store file. This code uses a directory named "cn.edu.pku.eecs.app.FindPKU" in the application's documents directory.
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

- (NSManagedObjectModel *)managedObjectModel {
    // The managed object model for the application. It is a fatal error for the application not to be able to find and load its model.
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"FindPKU" withExtension:@"momd"];
    
    NSLog(@"%@",modelURL);
    
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
    // The persistent store coordinator for the application. This implementation creates and return a coordinator, having added the store for the application to it.
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    // Create the coordinator and store
    
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"FindPKU.sqlite"];
    
    NSLog(@"%@",storeURL);
    
    NSError *error = nil;
    
    BOOL dataFileAlreadyExists =
    [[NSFileManager defaultManager] fileExistsAtPath:[storeURL path]];
    
    ///以后可以启用这段代码，直接从导入一个用户数据库！！！在NSBundle位置建立一个存有数据的数据库，然后以下代码会在用户第一次启用本程序时将已有的sqlite文件复制到coredata位置下！！
    /*if (!dataFileAlreadyExists) {
        NSString *bundleStore = [[NSBundle mainBundle] pathForResource:@"FindPKU" ofType:@"sqlite"];
        
        [[NSFileManager defaultManager] copyItemAtPath:bundleStore toPath:[storeURL path] error:&error];
        
        if (error) {
            NSLog(@"Error copying baked database: %@", error);
        }
    }*/
    
    NSString *failureReason = @"There was an error creating or loading the application's saved data.";
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        // Report any error we got.
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        dict[NSLocalizedDescriptionKey] = @"Failed to initialize the application's saved data";
        dict[NSLocalizedFailureReasonErrorKey] = failureReason;
        dict[NSUnderlyingErrorKey] = error;
        error = [NSError errorWithDomain:@"YOUR_ERROR_DOMAIN" code:9999 userInfo:dict];
        // Replace this with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    return _persistentStoreCoordinator;
}


- (NSManagedObjectContext *)managedObjectContext {
    // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.)
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (!coordinator) {
        return nil;
    }
    _managedObjectContext = [[NSManagedObjectContext alloc] init];
    [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    return _managedObjectContext;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        NSError *error = nil;
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}



#pragma mark Memory management

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    /*
     Free up as much memory as possible by purging cached data objects that can be recreated (or reloaded from disk) later.
     */
}

- (void)dealloc {
    [_window release];
    [super dealloc];
}


@end