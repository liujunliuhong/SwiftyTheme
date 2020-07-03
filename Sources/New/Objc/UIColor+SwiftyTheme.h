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
+ (UIColor *)_colorWithKey:(NSString *)colorKey;
+ (UIColor *)_colorWithDynamicProvider:(UIColor * (^)(void))dynamicProvider;

+ (CGColorRef)_cgColorWithKey:(NSString *)colorKey;
@end

@interface UIColor (SwiftyTheme)
+ (nullable UIColor *)st_colorWithKey:(NSString *)colorKey;
+ (nullable UIColor *)st_colorWithDynamicProvider:(UIColor * (^)(void))dynamicProvider;
@end

NS_ASSUME_NONNULL_END
