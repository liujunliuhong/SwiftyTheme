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

    [UIView st_swizzleWithCls:self originSelectorNames:originSelectorNames replaceSelectorNames:replaceSelectorNames];
}
+ (void)st_swizzleWithCls:(Class)cls originSelectorNames:(NSArray<NSString *> *)originSelectorNames replaceSelectorNames:(NSArray<NSString *> *)replaceSelectorNames{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (originSelectorNames.count != replaceSelectorNames.count) {
            return;
        }

        for (int i = 0; i < originSelectorNames.count; i ++) {
            SEL originSelector = NSSelectorFromString(originSelectorNames[i]);
            SEL replaceSelector = NSSelectorFromString(replaceSelectorNames[i]);

            Method originMethod = class_getInstanceMethod(cls, originSelector);
            Method replaceMethod = class_getInstanceMethod(cls, replaceSelector);

            if (!originMethod || !replaceMethod) {
                continue;
            }

             BOOL isAddedMethod = class_addMethod(cls, originSelector, method_getImplementation(replaceMethod), method_getTypeEncoding(replaceMethod));

            if (isAddedMethod) {
                class_replaceMethod(cls, replaceSelector, method_getImplementation(originMethod), method_getTypeEncoding(originMethod));
            } else {
                method_exchangeImplementations(originMethod, replaceMethod);
            }
        }
    });
}

- (void)st_willMoveToWindow:(UIWindow *)window{
    [self st_willMoveToWindow:window];
    if (window) {
        [self st_updateDynamicColors];
        [self st_updateDynamicImages];
        [self stThemeDidChange];
    }
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
//    [self setNeedsLayout];
//    [self setNeedsDisplay];
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
