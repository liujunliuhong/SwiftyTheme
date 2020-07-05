//
//  SwiftyThemeManager.m
//  SwiftyTheme
//
//  Created by apple on 2020/7/2.
//  Copyright © 2020 yinhe. All rights reserved.
//

#import "SwiftyThemeManager.h"
#import "UIView+SwiftyTheme.h"
#import "CALayer+SwiftyTheme.h"

static void (^_themeChangeHandler)(BOOL) = nil;

@interface SwiftyThemeManager()
@property (nonatomic, copy) NSString *documentpatch;
@property (nonatomic, strong) NSMutableDictionary<NSString *, NSString *> *currentThemeInfo;
@property (nonatomic, strong) NSDictionary<NSString *, NSString *> *currentTagValueInfo;
@property (nonatomic, copy) NSString *currentThemeTag;
@end

@implementation SwiftyThemeManager

+ (SwiftyThemeManager *)sharedInstance{
    static SwiftyThemeManager *mgr = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        mgr = [[self alloc] init];
    });
    return mgr;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.documentpatch = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).lastObject;
        self.currentThemeInfo = [NSMutableDictionary dictionary];
    }
    return self;
}

- (void)addThemeConfigurationWithBundlePath:(NSString *)bundlePath sandBoxRelativePath:(NSString *)sandBoxRelativePath themeTag:(NSString *)themeTag{
    if ([self.currentThemeInfo.allKeys containsObject:themeTag]) {
        NSLog(@"😁😁😁😁😁😁😁😁😁😁😁😁😁😁😁😁");
        return;
    }
    if (bundlePath) {
        [self.currentThemeInfo setObject:bundlePath forKey:themeTag];
    }
    if (sandBoxRelativePath && self.documentpatch) {
        NSString *fullPath = [self.documentpatch stringByAppendingPathComponent:sandBoxRelativePath];
        [self.currentThemeInfo setObject:fullPath forKey:themeTag];
    }
}


#pragma mark Public
- (void)registerWithApplication:(UIApplication *)application syncImmediately:(BOOL)syncImmediately animated:(BOOL)animated{
    __weak UIApplication *weakApp = application;
    __weak typeof(self) weakSelf = self;
    
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

- (void)setThemeTag:(NSString *)themeTag animated:(BOOL)animated{
    if (![self.currentThemeInfo.allKeys containsObject:themeTag]) {
        NSLog(@"😁😁😁😁😁😁😁😁😁😁😁😁😁😁😁😁");
        return;
    }
    NSString *path = self.currentThemeInfo[themeTag];
    NSDictionary<NSString *, NSString *> *tagValueInfo = [[NSDictionary<NSString *, NSString *> alloc] initWithContentsOfURL:[NSURL fileURLWithPath:path]];
    if (!tagValueInfo) {
        NSLog(@"😁😁😁😁😁😁😁😁😁😁😁😁😁😁😁😁");
        return;
    }
    self.currentThemeTag = themeTag;
    self.currentTagValueInfo = tagValueInfo;
    //
    [self syncImmediatelyAnimated:animated];
}

#pragma mark Private
- (void)syncImmediatelyAnimated:(BOOL)animated{
    if (_themeChangeHandler) {
        _themeChangeHandler(animated);
    }
}



- (void)updateUIWithViews:(nullable NSArray<UIView *> *)views viewControllers:(nullable NSArray<UIViewController *> *)viewControllers animated:(BOOL)animated{
    
    [views enumerateObjectsUsingBlock:^(UIView * _Nonnull view, NSUInteger idx, BOOL * _Nonnull stop) {
        [view.layer stThemeDidChange];
        [view stThemeDidChange];
    }];
    [viewControllers enumerateObjectsUsingBlock:^(UIViewController * _Nonnull vc, NSUInteger idx, BOOL * _Nonnull stop) {
        
    }];
}

@end
