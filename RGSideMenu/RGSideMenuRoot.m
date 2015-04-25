//
//  RGSideMenuRoot.m
//  RGSideMenu
//
//  Created by Ran Greenberg on 4/10/15.
//  Copyright (c) 2015 RG DEVELOPMENT. All rights reserved.
//

#import "RGSideMenuRoot.h"

#ifdef __llvm__
#pragma GCC diagnostic ignored "-Wdangling-else"
#endif

@interface RGSideMenuRoot ()

@property (nonatomic) bool isSideMenuOpen;

@end

@implementation RGSideMenuRoot


-(float)animationDuration {
    
    if (_animationDuration == 0)
        return 0.3;
    return  _animationDuration;
}


//+(instancetype)instance {
//    
//    static RGSideMenuRoot *sharedInstance = nil;
//    static dispatch_once_t onceToken;
//    
//    dispatch_once(&onceToken, ^{
//        sharedInstance = [[RGSideMenuRoot alloc] init];
//        
//    });
//    
//    return sharedInstance;
//    
//}


-(void)setRootVC:(UIViewController*)viewController {
    self.navigationController = [[RGNavigationController alloc] initWithRootViewController:viewController];
}




- (void)viewDidLoad {
    rglogdbg_func
    [super viewDidLoad];
    
    UIViewController *sideMenuVC = [STORYBOARD instantiateViewControllerWithIdentifier:@"SideMenuVC"];
    sideMenuVC.view.frame = CGRectMake(0, 0, 200, sideMenuVC.view.frame.size.height);
    self.sideMenu = sideMenuVC;

    self.isSideMenuOpen = false;
    
    float dx = 0;
    
    switch (self.sideMenuDirection) {
        case RGSideMenuDirectionLeft:
        {
            dx = -self.sideMenu.view.frame.size.width;
            break;
        }
            
        case RGSideMenuDirectionRight:
        {
            dx = self.view.frame.size.width;
            break;
        }
    }
    
    self.sideMenu.view.frame = CGRectOffset(self.sideMenu.view.frame, dx, 0);
    [self.view addSubview:self.sideMenu.view];
    
    [self.view addSubview:self.navigationController.view];
    
}

-(void)toggleSideMenu {
    
    int newSideMenuPosition = 0;
    int newTopVCPosition = 0;
    
    // should open
    if (!self.isSideMenuOpen) {
        newSideMenuPosition = self.sideMenu.view.frame.size.width;
        newTopVCPosition = self.sideMenu.view.frame.size.width;
        
        [[NSNotificationCenter defaultCenter] postNotificationName:RGSideMenuWillOpenNotify object:nil];
        
    }
    
    // should close
    else if (self.isSideMenuOpen) {
        newSideMenuPosition = -self.sideMenu.view.frame.size.width;
        newTopVCPosition = -self.sideMenu.view.frame.size.width;
        
        [[NSNotificationCenter defaultCenter] postNotificationName:RGSideMenuWillCloseNotify object:nil];
        
    }
    
    newSideMenuPosition = (self.sideMenuDirection == RGSideMenuDirectionLeft) ? newSideMenuPosition : -1 * newSideMenuPosition;
    newTopVCPosition = (self.sideMenuDirection == RGSideMenuDirectionLeft) ? newTopVCPosition : -1 * newTopVCPosition;
    
    
    [UIView animateWithDuration:self.animationDuration animations:^{
        
        self.sideMenu.view.frame = CGRectOffset(self.sideMenu.view.frame, newSideMenuPosition, 0);
        self.navigationController.topViewController.view.frame = CGRectOffset(self.navigationController.topViewController.view.frame, newTopVCPosition, 0);
        
    } completion:^(BOOL finished) {
        if (finished)
            self.isSideMenuOpen = !self.isSideMenuOpen;
            if (self.sideMenu.view.frame.origin.x == 0) {
                [[NSNotificationCenter defaultCenter] postNotificationName:RGSideMenuDidOpenNotify object:nil];
            }
        
            else if (self.sideMenu.view.frame.origin.x < 0) {
                [[NSNotificationCenter defaultCenter] postNotificationName:RGSideMenuDidCloseNotify object:nil];
                
            }
    }];
}

































@end
