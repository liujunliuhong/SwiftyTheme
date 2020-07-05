//
//  UIColor+SwiftyTheme.m
//  SwiftyTheme
//
//  Created by apple on 2020/7/2.
//  Copyright © 2020 yinhe. All rights reserved.
//

#import "UIColor+SwiftyTheme.h"
#import "SwiftyThemeDynamicColor.h"
#import "SwiftyThemeManager.h"
#import "SwiftyThemeColorTool.h"
#import "UIColor+SwiftyThemeConvert.h"
@implementation SwiftyThemeDynamicColor
+ (UIColor *)_colorWithKey:(NSString *)colorKey{
    if (!colorKey) {
        return nil;
    }
    return [self _colorWithDynamicProvider:^UIColor * _Nullable{
        NSLog(@"😁");
        if ([SwiftyThemeManager sharedInstance].currentTagValueInfo && [[SwiftyThemeManager sharedInstance].currentTagValueInfo.allKeys containsObject:colorKey]) {
            NSString *value = [SwiftyThemeManager sharedInstance].currentTagValueInfo[colorKey];
            UIColor *color = [UIColor st_convert_colorWithString:value];
            NSLog(@"😁😁:%@", color);
            return color;
        } else {
            return nil;
        }
    }];
}
+ (UIColor *)_colorWithDynamicProvider:(UIColor * _Nullable (^)(void))dynamicProvider{
    return (SwiftyThemeDynamicColor *)[[SwiftyThemeDynamicColorProxy alloc] initWithDynamicProvider:dynamicProvider];
}



+ (CGColorRef)_cgColorWithKey:(NSString *)colorKey{
    if (!colorKey) {
        return nil;
    }
    if ([SwiftyThemeManager sharedInstance].currentTagValueInfo && [[SwiftyThemeManager sharedInstance].currentTagValueInfo.allKeys containsObject:colorKey]) {
        NSString *value = [SwiftyThemeManager sharedInstance].currentTagValueInfo[colorKey];
        UIColor *color = [UIColor st_convert_colorWithString:value];
        return color.CGColor;
    } else {
        return nil;
    }
}
@end


@implementation UIColor (SwiftyTheme)

+ (UIColor *)st_colorWithKey:(NSString *)colorKey{
    if (!colorKey) {
        return nil;
    }
    return [SwiftyThemeDynamicColor _colorWithKey:colorKey];
}
+ (UIColor *)st_colorWithDynamicProvider:(UIColor * _Nullable (^)(void))dynamicProvider{
    return [SwiftyThemeDynamicColor _colorWithDynamicProvider:dynamicProvider];
}
@end
