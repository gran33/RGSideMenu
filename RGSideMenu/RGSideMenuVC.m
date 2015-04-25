//
//  RGSideMenuVC.m
//  RGSideMenu
//
//  Created by Ran Greenberg on 4/25/15.
//  Copyright (c) 2015 RG DEVELOPMENT. All rights reserved.
//

#import "RGSideMenuVC.h"

@interface RGSideMenuVC ()

@end

@implementation RGSideMenuVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.frame = CGRectMake(0, 0, 200, self.view.frame.size.height);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
