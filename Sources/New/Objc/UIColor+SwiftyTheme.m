//
//  UIColor+SwiftyTheme.m
//  SwiftyTheme
//
//  Created by apple on 2020/7/2.
//  Copyright © 2020 yinhe. All rights reserved.
//

#import "UIColor+SwiftyTheme.h"
#import "SwiftyThemeDynamicColor.h"

@implementation UIColor (SwiftyTheme)

+ (UIColor *)st_colorWithKey:(NSString *)colorKey{
    return [SwiftyThemeDynamicColor colorWithKey:colorKey];
}

@end
