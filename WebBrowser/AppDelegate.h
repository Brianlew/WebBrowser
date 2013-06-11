//
//  AppDelegate.h
//  WebBrowser
//
//  Created by Brian Lewis on 5/6/13.
//  Copyright (c) 2013 Brian Lewis. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) ViewController *viewController;

-(NSString *)defaultUrl;

@end
