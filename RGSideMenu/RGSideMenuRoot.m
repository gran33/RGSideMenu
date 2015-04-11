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

@end

@implementation RGSideMenuRoot


-(float)animationDuration {
    
    if (_animationDuration == 0)
        return 0.3;
    return  _animationDuration;
}


+(instancetype)instance {
    
    static RGSideMenuRoot *sharedInstance = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        sharedInstance = [[RGSideMenuRoot alloc] init];
        
    });
    
    return sharedInstance;
    
}


-(id) initWithRootViewController:(UIViewController*)vc {
    
    self = [RGSideMenuRoot instance];
    
    if (self) {
        
        self.navigationController = [[RGNavigationController alloc] initWithRootViewController:vc];
        
    }
    
    return self;
    
}

- (void)viewDidLoad {
    rglogdbg_func
    [super viewDidLoad];
    
    self.sideMenu.view.frame = CGRectOffset(self.sideMenu.view.frame, -self.sideMenu.view.frame.size.width, 0);
    [self.view addSubview:self.sideMenu.view];
    
    [self.view addSubview:self.navigationController.view];
    
    
    
    
}

-(void)toggleSideMenu {
    
    int newSideMenuPosition = 0;
    int newTopVCPosition = 0;
    
    // should open
    if (self.sideMenu.view.frame.origin.x < 0) {
        newSideMenuPosition = self.sideMenu.view.frame.size.width;
        newTopVCPosition = self.sideMenu.view.frame.size.width;
        
        [[NSNotificationCenter defaultCenter] postNotificationName:RGSideMenuWillOpenNotify object:nil];
        
    }
    
    // should close
    else if (self.sideMenu.view.frame.origin.x == 0) {
        newSideMenuPosition = -self.sideMenu.view.frame.size.width;
        newTopVCPosition = -self.sideMenu.view.frame.size.width;
        
        [[NSNotificationCenter defaultCenter] postNotificationName:RGSideMenuWillCloseNotify object:nil];
        
    }
    
    [UIView animateWithDuration:self.animationDuration animations:^{
        
        self.sideMenu.view.frame = CGRectOffset(self.sideMenu.view.frame, newSideMenuPosition, 0);
        self.navigationController.topViewController.view.frame = CGRectOffset(self.navigationController.topViewController.view.frame, newTopVCPosition, 0);
        
    } completion:^(BOOL finished) {
        if (finished)
            if (self.sideMenu.view.frame.origin.x == 0) {
                [[NSNotificationCenter defaultCenter] postNotificationName:RGSideMenuDidOpenNotify object:nil];
            }
        
            else if (self.sideMenu.view.frame.origin.x < 0) {
                [[NSNotificationCenter defaultCenter] postNotificationName:RGSideMenuDidCloseNotify object:nil];
                
            }
    }];
}

































@end
