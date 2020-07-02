//
//  SwiftyThemeManager.m
//  SwiftyTheme
//
//  Created by apple on 2020/7/2.
//  Copyright © 2020 yinhe. All rights reserved.
//

#import "SwiftyThemeManager.h"
#import "UIView+SwiftyTheme.h"


static void (^_themeChangeHandler)(BOOL) = nil;

@interface SwiftyThemeManager()

@end

@implementation SwiftyThemeManager

#pragma mark Public
+ (void)registerWithApplication:(UIApplication *)application syncImmediately:(BOOL)syncImmediately animated:(BOOL)animated{
    __weak UIApplication *weakApp = application;
    __weak typeof(self) weakSelf = self;
    
    [self commonSetup];
    
    _themeChangeHandler = ^(BOOL animated){
        __strong UIApplication *strongApp = weakApp;
        if (!strongApp) {
            return ;
        }
        [weakSelf updateUIWithViews:strongApp.windows viewControllers:nil animated:animated];
    };
    
    if (syncImmediately) {
        [self syncImmediatelyAnimated:animated];
    }
}

+ (void)setThemeTag:(NSString *)themeTag animated:(BOOL)animated{
    [self syncImmediatelyAnimated:animated];
}

#pragma mark Private
+ (void)syncImmediatelyAnimated:(BOOL)animated{
    if (_themeChangeHandler) {
        _themeChangeHandler(animated);
    }
}

+ (void)commonSetup{
    [UIView st_swizzleWillMoveToWindow];
    [UIView st_swizzleSetBackgroundColor];
    [UIView st_swizzleSetTintColor];
}

+ (void)updateUIWithViews:(nullable NSArray<UIView *> *)views viewControllers:(nullable NSArray<UIViewController *> *)viewControllers animated:(BOOL)animated{
    
    [views enumerateObjectsUsingBlock:^(UIView * _Nonnull view, NSUInteger idx, BOOL * _Nonnull stop) {
        [view stThemeDidChange];
    }];
    [viewControllers enumerateObjectsUsingBlock:^(UIViewController * _Nonnull vc, NSUInteger idx, BOOL * _Nonnull stop) {
        
    }];
}

@end
