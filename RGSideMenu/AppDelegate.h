//
//  AppDelegate.h
//  RGSideMenu
//
//  Created by Ran Greenberg on 4/10/15.
//  Copyright (c) 2015 RG DEVELOPMENT. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "RGSideMenuRoot.h"


@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, strong) RGSideMenuRoot *sideMenuRoot;

@end

