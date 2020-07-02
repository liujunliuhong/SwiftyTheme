//
//  UIView+SwiftyTheme.h
//  SwiftyTheme
//
//  Created by apple on 2020/7/2.
//  Copyright © 2020 yinhe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SwitfyThemeEnvironment.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIView (SwiftyTheme) <SwitfyThemeEnvironment>
+ (void)st_swizzleWillMoveToWindow;
+ (void)st_swizzleSetBackgroundColor;
+ (void)st_swizzleSetTintColor;

- (void)st_updateDynamicColors;
- (void)st_updateDynamicImages NS_REQUIRES_SUPER;
@end

NS_ASSUME_NONNULL_END
