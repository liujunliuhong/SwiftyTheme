//
//  SwiftyThemeDynamicColor.h
//  SwiftyTheme
//
//  Created by apple on 2020/7/2.
//  Copyright © 2020 yinhe. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SwiftyThemeDynamicColor : UIColor

+ (UIColor *)colorWithKey:(NSString *)colorKey;
+ (UIColor *)colorWithDynamicProvider:(UIColor * (^)(void))dynamicProvider;
@end

NS_ASSUME_NONNULL_END
