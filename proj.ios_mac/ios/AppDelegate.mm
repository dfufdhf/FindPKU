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
    
    //set white color for status bar
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    [self.window.rootViewController setNeedsStatusBarAppearanceUpdate];
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
}


#pragma mark -
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