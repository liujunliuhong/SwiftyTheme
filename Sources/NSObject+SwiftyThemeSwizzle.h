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
+ (void)st_swizzleWithCls:(Class)cls
      originSelectorNames:(NSArray<NSString *> *)originSelectorNames
     replaceSelectorNames:(NSArray<NSString *> *)replaceSelectorNames;
@end
NS_ASSUME_NONNULL_END
