//
//  CALayer+SwiftyTheme.h
//  SwiftyTheme
//
//  Created by apple on 2020/7/3.
//  Copyright © 2020 yinhe. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "SwitfyThemeEnvironment.h"

NS_ASSUME_NONNULL_BEGIN

@interface CALayer (SwiftyTheme) <SwitfyThemeEnvironment>
@property (nonatomic, copy) NSString *st_backgroundColorKey;
@property (nonatomic, copy) NSString *st_borderColorKey;
@property (nonatomic, copy) NSString *st_shadowColorKey;
- (void)st_updateDynamicColors;
@end

NS_ASSUME_NONNULL_END
