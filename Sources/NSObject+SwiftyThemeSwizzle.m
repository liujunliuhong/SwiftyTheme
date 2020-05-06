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
+ (BOOL)st_swizzleInstanceMethod:(SEL)selector1 to:(SEL)selector2{
    __block BOOL isSuccess = NO;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        Method method1 = class_getInstanceMethod(self, selector1);
        Method method2 = class_getInstanceMethod(self, selector2);
        
        if (!method1 || !method2) {
            isSuccess = NO;
        }
        
        
        if (class_addMethod(self, selector1, method_getImplementation(method2), method_getTypeEncoding(method2))) {
            class_replaceMethod(self, selector2, method_getImplementation(method1), method_getTypeEncoding(method1));
        } else {
            method_exchangeImplementations(method1, method2);
        }
        
        isSuccess = YES;
    });
    return isSuccess;
}
@end
