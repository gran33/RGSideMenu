# RGSideMenu
Side Menu for iOS written in Objective-C

![Alt text](/GIFs/leftAnimation.gif?raw=true "" =300x300)
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

#License

The MIT License (MIT)

Copyright (c) <year> <copyright holders>

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.


