//
//  ViewController.m
//  RGSideMenu
//
//  Created by Ran Greenberg on 4/10/15.
//  Copyright (c) 2015 RG DEVELOPMENT. All rights reserved.
//

#import "ViewController.h"
#import "RGSideMenuRoot.h"

@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIBarButtonItem *flipButton = [[UIBarButtonItem alloc]
                                   initWithTitle:@"SM"
                                   style:UIBarButtonItemStyleDone
                                   target:self
                                   action:@selector(toggleSM)];
    self.navigationItem.leftBarButtonItem = flipButton;
    
    self.numLabel.text = [NSString stringWithFormat:@"#%zd", [[self.navigationController viewControllers] count]];
    
}



-(void)toggleSM {
    
    [[RGSideMenuRoot instance] toggleSideMenu];

}

- (IBAction)addVCPressed:(id)sender {
    
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ViewController *vc = [sb instantiateViewControllerWithIdentifier:@"ViewController"];
    
    
    [self.navigationController pushViewController:vc animated:YES];
    
    
}




@end
