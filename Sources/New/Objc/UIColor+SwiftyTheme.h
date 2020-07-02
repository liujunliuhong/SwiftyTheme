//
//  UIColor+SwiftyTheme.h
//  SwiftyTheme
//
//  Created by apple on 2020/7/2.
//  Copyright © 2020 yinhe. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (SwiftyTheme)

+ (UIColor *)st_colorWithKey:(NSString *)colorKey;

@end

NS_ASSUME_NONNULL_END
