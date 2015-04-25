//
//  AppDelegate.m
//  RGSideMenu
//
//  Created by Ran Greenberg on 4/10/15.
//  Copyright (c) 2015 RG DEVELOPMENT. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"


@interface AppDelegate ()



@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    // the visible UIViewController
    ViewController *vc = [STORYBOARD instantiateViewControllerWithIdentifier:@"ViewController"];
    
    self.sideMenuRoot = (RGSideMenuRoot*)self.window.rootViewController;
    self.sideMenuRoot.sideMenuDirection = RGSideMenuDirectionRight;
    
    [self.sideMenuRoot setRootVC:vc];
    self.sideMenuRoot.animationDuration = 0.2;
    
    return YES;
}



@end
