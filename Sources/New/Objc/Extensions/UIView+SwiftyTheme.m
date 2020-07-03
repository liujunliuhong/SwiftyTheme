//
//  UIView+SwiftyTheme.m
//  SwiftyTheme
//
//  Created by apple on 2020/7/2.
//  Copyright © 2020 yinhe. All rights reserved.
//

#import "UIView+SwiftyTheme.h"
#import <objc/message.h>
#import "SwiftyThemeSwizzle.h"
#import "UIColor+SwiftyTheme.h"
#import "CALayer+SwiftyTheme.h"

const char st_background_color_key;
const char st_tint_color_key;

@interface UIView ()
@property (nonatomic, strong) UIColor *stDynamicBackgroundColor;
@property (nonatomic, strong) UIColor *stDynamicTintColor;
@end


@implementation UIView (SwiftyTheme)
#pragma mark Swizzle
+ (void)load{
    NSArray<NSString *> *originSelectorNames = @[@"willMoveToWindow:",
                                                 @"setBackgroundColor:",
                                                 @"setTintColor:"];

    NSArray<NSString *> *replaceSelectorNames = @[@"st_willMoveToWindow:",
                                                  @"st_setBackgroundColor:",
                                                  @"st_setTintColor:"];

    [SwiftyThemeSwizzle st_swizzleWithCls:self originSelectorNames:originSelectorNames replaceSelectorNames:replaceSelectorNames];
}


- (void)st_willMoveToWindow:(UIWindow *)window{
    [self st_willMoveToWindow:window];
    if (window) {
        [self st_updateDynamicColors];
        [self st_updateDynamicImages];
    }
    [self.layer stThemeDidChange];
}
- (void)st_setBackgroundColor:(UIColor *)color{
    if ([color isKindOfClass:[SwiftyThemeDynamicColor class]]) {
        self.stDynamicBackgroundColor = (SwiftyThemeDynamicColor *)color;
    } else {
        self.stDynamicBackgroundColor = nil;
    }
    [self st_setBackgroundColor:color];
}

- (void)st_setTintColor:(UIColor *)color{
    if ([color isKindOfClass:[SwiftyThemeDynamicColor class]]) {
        self.stDynamicTintColor = (SwiftyThemeDynamicColor *)color;
    } else {
        self.stDynamicTintColor = nil;
    }
    [self st_setTintColor:color];
}

#pragma mark SwitfyThemeEnvironment
- (void)stThemeDidChange{
    [self.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj stThemeDidChange];
    }];
    [self setNeedsLayout];
    [self setNeedsDisplay];
    [self st_updateDynamicColors];
    [self st_updateDynamicImages];
}

#pragma mark Setter/Getter
- (void)setStDynamicBackgroundColor:(UIColor *)stDynamicBackgroundColor{
    objc_setAssociatedObject(self, &st_background_color_key, stDynamicBackgroundColor, OBJC_ASSOCIATION_COPY_NONATOMIC);
}
- (UIColor *)stDynamicBackgroundColor{
    return objc_getAssociatedObject(self, &st_background_color_key);
}
- (void)setStDynamicTintColor:(UIColor *)stDynamicTintColor{
    objc_setAssociatedObject(self, &st_tint_color_key, stDynamicTintColor, OBJC_ASSOCIATION_COPY_NONATOMIC);
}
- (UIColor *)stDynamicTintColor{
    return objc_getAssociatedObject(self, &st_tint_color_key);
}

#pragma mark Public
- (void)st_updateDynamicColors{
    UIColor *backgroundColor = self.stDynamicBackgroundColor;
    if (backgroundColor) {
        [self setBackgroundColor:backgroundColor];
    }
    UIColor *tintColor = self.stDynamicTintColor;
    if (tintColor) {
        [self setTintColor:tintColor];
    }
}
- (void)st_updateDynamicImages{}
@end
