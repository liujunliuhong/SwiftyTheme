//
//  NSObject+SwiftyThemeSwizzle.h
//  SwiftyTheme
//
//  Created by apple on 2020/4/30.
//  Copyright © 2020 yinhe. All rights reserved.
//


#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@interface NSObject (SwiftyThemeSwizzle)
// This method is not used for the time being and may be used in the future.
+ (BOOL)st_swizzleInstanceMethod:(SEL)selector1 to:(SEL)selector2;
@end
NS_ASSUME_NONNULL_END
