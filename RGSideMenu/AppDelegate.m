//
//  AppDelegate.m
//  RGSideMenu
//
//  Created by Ran Greenberg on 4/10/15.
//  Copyright (c) 2015 RG DEVELOPMENT. All rights reserved.
//

#import "AppDelegate.h"
#import "RGSideMenuRoot.h"
#import "ViewController.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ViewController *vc = [sb instantiateViewControllerWithIdentifier:@"ViewController"];
    UIViewController *smvc = [sb instantiateViewControllerWithIdentifier:@"SideMenuVC"];
    smvc.view.frame = CGRectMake(0, 0, 200, smvc.view.frame.size.height);
    RGSideMenuRoot *sideMenuRoot = [[RGSideMenuRoot alloc] initWithRootViewController:vc];
    sideMenuRoot.sideMenu = smvc;
    
    
    self.window.rootViewController = sideMenuRoot;
    [self.window makeKeyAndVisible];
    
    
    return YES;
}



@end
