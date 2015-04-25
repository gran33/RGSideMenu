# RGSideMenu
Side Menu for iOS written in Objective-C
```objective-c
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    // the visible UIViewController
    ViewController *vc = [STORYBOARD instantiateViewControllerWithIdentifier:@"ViewController"];
    
    self.sideMenuRoot = (RGSideMenuRoot*)self.window.rootViewController;
    self.sideMenuRoot.sideMenuDirection = RGSideMenuDirectionRight;
    [self.sideMenuRoot setRootVC:vc];
    self.sideMenuRoot.animationDuration = 0.2;
    
    return YES;
}
```
