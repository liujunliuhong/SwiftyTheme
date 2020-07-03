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

+ (SwiftyThemeManager *)sharedInstance;
- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)new NS_UNAVAILABLE;

+ (void)registerWithApplication:(UIApplication *)application syncImmediately:(BOOL)syncImmediately animated:(BOOL)animated;

+ (void)setThemeTag:(NSString *)themeTag animated:(BOOL)animated;

@end

NS_ASSUME_NONNULL_END
