//
//  UIColor+SwiftyThemeConvert.h
//  SwiftyTheme
//
//  Created by 刘军 on 2020/7/4.
//  Copyright © 2020 yinhe. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (SwiftyThemeConvert)
+ (nullable UIColor *)st_convert_colorWithString:(nullable NSString *)colorString;
@end

NS_ASSUME_NONNULL_END
