//
//  UIColor+SwiftyTheme.m
//  SwiftyTheme
//
//  Created by apple on 2020/7/2.
//  Copyright © 2020 yinhe. All rights reserved.
//

#import "UIColor+SwiftyTheme.h"
#import "SwiftyThemeDynamicColor.h"

@implementation SwiftyThemeDynamicColor
+ (UIColor *)_colorWithKey:(NSString *)colorKey{
    return [self _colorWithDynamicProvider:^UIColor * _Nonnull{
        int index = arc4random() % 2;
        if (index == 0) {
            return [UIColor redColor]; // ...?????
        } else {
            return [UIColor orangeColor]; // ...?????
        }
    }];
}
+ (UIColor *)_colorWithDynamicProvider:(UIColor * _Nonnull (^)(void))dynamicProvider{
    return (SwiftyThemeDynamicColor *)[[SwiftyThemeDynamicColorProxy alloc] initWithDynamicProvider:dynamicProvider];
}


+ (CGColorRef)_cgColorWithKey:(NSString *)colorKey{
    NSLog(@"😆😆😆😆😆😆😆😆😆");
    int index = arc4random() % 2;
    if (index == 0) {
        return [UIColor purpleColor].CGColor; // ...?????
    } else {
        return [UIColor yellowColor].CGColor; // ...?????
    }
}

@end


@implementation UIColor (SwiftyTheme)

+ (UIColor *)st_colorWithKey:(NSString *)colorKey{
    return [SwiftyThemeDynamicColor _colorWithKey:colorKey];
}

+ (UIColor *)st_colorWithDynamicProvider:(UIColor * _Nonnull (^)(void))dynamicProvider{
    return [SwiftyThemeDynamicColor _colorWithDynamicProvider:dynamicProvider];
}
@end
