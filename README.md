# RGSideMenu
Side Menu for iOS written in Objective-C

![Alt text](/GIFs/leftAnimation.gif?raw=true ""){ height: 200px; }
![Alt text](/GIFs/rightAnimation.gif?raw=true "")


How to install with Storyboard (storyboard file name is "Main"):

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
To change ```Storyboard``` name see this ```macro``` loacted in the ```.pch``` file:
```objective-c
#define STORYBOARD      ([UIStoryboard storyboardWithName:@"Main" bundle:nil])
```


