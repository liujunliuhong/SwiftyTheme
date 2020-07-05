//
//  SwiftyThemeManager.h
//  SwiftyTheme
//
//  Created by apple on 2020/7/2.
//  Copyright © 2020 yinhe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SwiftyThemeManager : NSObject

@property (nonatomic, strong, readonly) NSMutableDictionary<NSString *, NSString *> *currentThemeInfo;
@property (nonatomic, strong, readonly, nullable) NSDictionary<NSString *, NSString *> *currentTagValueInfo;
@property (nonatomic, copy, readonly) NSString *currentThemeTag;

+ (SwiftyThemeManager *)sharedInstance;
- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)new NS_UNAVAILABLE;

- (void)addThemeConfigurationWithBundlePath:(nullable NSString *)bundlePath sandBoxRelativePath:(nullable NSString *)sandBoxRelativePath themeTag:(NSString *)themeTag;

- (void)registerWithApplication:(UIApplication *)application syncImmediately:(BOOL)syncImmediately animated:(BOOL)animated;

- (void)setThemeTag:(NSString *)themeTag animated:(BOOL)animated;

@end

NS_ASSUME_NONNULL_END
