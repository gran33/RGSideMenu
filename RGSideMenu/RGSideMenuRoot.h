//
//  RGSideMenuRoot.h
//  RGSideMenu
//
//  Created by Ran Greenberg on 4/10/15.
//  Copyright (c) 2015 RG DEVELOPMENT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RGNavigationController.h"
//#import "RGSideMenu.h"


#define RGSideMenuWillOpenNotify          @"RGSideMenuWillOpen"
#define RGSideMenuDidOpenNotify           @"RGSideMenuDidOpen"
#define RGSideMenuWillCloseNotify         @"RGSideMenuWillColse"
#define RGSideMenuDidCloseNotify          @"RGSideMenuDidClose"

typedef NS_OPTIONS(NSUInteger, RGSideMenuDirection) {
    RGSideMenuDirectionNone         = 0,
    RGSideMenuDirectionLeft         = 1 << 0,
    RGSideMenuDirectionRight        = 1 << 1
};


@interface RGSideMenuRoot : UIViewController

@property (nonatomic, strong) RGNavigationController *navigationController;
@property (nonatomic, strong) UIViewController *sideMenu;
@property (nonatomic) float animationDuration;

@property (nonatomic) RGSideMenuDirection sideMenuDirection;


//+(RGSideMenuRoot*)instance;

-(id) initWithRootViewController:(UIViewController*)vc sideMenuDirection:(RGSideMenuDirection)direction;
-(void)setRootVC:(UIViewController*)viewController;
-(void)toggleSideMenu;


@end
