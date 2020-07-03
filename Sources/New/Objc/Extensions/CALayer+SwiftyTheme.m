//
//  CALayer+SwiftyTheme.m
//  SwiftyTheme
//
//  Created by apple on 2020/7/3.
//  Copyright © 2020 yinhe. All rights reserved.
//

#import "CALayer+SwiftyTheme.h"
#import <objc/message.h>
#import "UIColor+SwiftyTheme.h"

const char st_layer_background_color_key;
const char st_layer_border_color_key;
const char st_layer_shadow_color_key;

@interface CALayer ()

@end

@implementation CALayer (SwiftyTheme)
#pragma mark SwitfyThemeEnvironment
- (void)stThemeDidChange{
    [self.sublayers enumerateObjectsUsingBlock:^(__kindof CALayer * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj stThemeDidChange];
    }];
    [self setNeedsLayout];
    [self setNeedsDisplay];
    [self st_updateDynamicColors];
}

#pragma mark Setter/Getter
- (void)setSt_backgroundColorKey:(NSString *)st_backgroundColorKey{
    objc_setAssociatedObject(self, &st_layer_background_color_key, st_backgroundColorKey, OBJC_ASSOCIATION_COPY_NONATOMIC);
}
- (NSString *)st_backgroundColorKey{
    return objc_getAssociatedObject(self, &st_layer_background_color_key);
}
- (void)setSt_borderColorKey:(NSString *)st_borderColorKey{
    objc_setAssociatedObject(self, &st_layer_border_color_key, st_borderColorKey, OBJC_ASSOCIATION_COPY_NONATOMIC);
}
- (NSString *)st_borderColorKey{
    return objc_getAssociatedObject(self, &st_layer_border_color_key);
}
- (void)setSt_shadowColorKey:(NSString *)st_shadowColorKey{
    objc_setAssociatedObject(self, &st_layer_shadow_color_key, st_shadowColorKey, OBJC_ASSOCIATION_COPY_NONATOMIC);
}
- (NSString *)st_shadowColorKey{
    return objc_getAssociatedObject(self, &st_layer_shadow_color_key);
}
#pragma mark Public
- (void)st_updateDynamicColors{
    if (self.st_backgroundColorKey) {
        self.backgroundColor = [SwiftyThemeDynamicColor _cgColorWithKey:self.st_backgroundColorKey];
    }
    if (self.st_borderColorKey) {
        self.backgroundColor = [SwiftyThemeDynamicColor _cgColorWithKey:self.st_borderColorKey];
    }
    if (self.st_shadowColorKey) {
        self.backgroundColor = [SwiftyThemeDynamicColor _cgColorWithKey:self.st_shadowColorKey];
    }
}
@end
