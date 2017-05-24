//
//  AppDelegate.m
//  Design
//
//  Created by Темирлан Алпысбаев on 5/22/17.
//  Copyright © 2017 TemirlanAlpysbayev. All rights reserved.
//

#import "AppDelegate.h"
#import "MainViewController.h"
#import "UIColor+SystemColor.h"

@interface AppDelegate () <UINavigationBarDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    UINavigationController *vc = [[UINavigationController alloc] initWithRootViewController:[[MainViewController alloc] initWithNibName:@"MainViewController" bundle:nil]];
    
    [vc.navigationBar setTranslucent:NO];
    [vc.navigationBar setTintColor:[UIColor whiteColor]];
    [vc.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    [vc.navigationBar setBarTintColor:[UIColor designBlue]];
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [self.window setRootViewController:vc];
    [self.window makeKeyAndVisible];
    
    return YES;
}


@end
