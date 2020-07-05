//
//  UIColor+SwiftyTheme.h
//  SwiftyTheme
//
//  Created by apple on 2020/7/2.
//  Copyright © 2020 yinhe. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SwiftyThemeDynamicColor : UIColor
+ (nullable UIColor *)_colorWithKey:(nullable NSString *)colorKey;
+ (nullable UIColor *)_colorWithDynamicProvider:(UIColor *_Nullable (^)(void))dynamicProvider;

+ (nullable CGColorRef)_cgColorWithKey:(nullable NSString *)colorKey;
@end

@interface UIColor (SwiftyTheme)
+ (nullable UIColor *)st_colorWithKey:(nullable NSString *)colorKey;
+ (nullable UIColor *)st_colorWithDynamicProvider:(UIColor *_Nullable (^)(void))dynamicProvider;
@end

NS_ASSUME_NONNULL_END
