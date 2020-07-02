//
//  NSObject+SwiftyThemeSwizzle.m
//  SwiftyTheme
//
//  Created by apple on 2020/4/30.
//  Copyright © 2020 yinhe. All rights reserved.
//

#import "NSObject+SwiftyThemeSwizzle.h"
#import <objc/message.h>

@implementation NSObject (SwiftyThemeSwizzle)
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
                class_replaceMethod(self, replaceSelector, method_getImplementation(originMethod), method_getTypeEncoding(originMethod));
            } else {
                method_exchangeImplementations(originMethod, replaceMethod);
            }
        }
    });
}

@end
