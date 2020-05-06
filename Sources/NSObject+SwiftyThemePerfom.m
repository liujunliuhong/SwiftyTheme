//
//  NSObject+SwiftyThemePerfom.m
//  SwiftyTheme
//
//  Created by apple on 2020/5/6.
//  Copyright © 2020 yinhe. All rights reserved.
//

#import "NSObject+SwiftyThemePerfom.h"
#import <UIKit/UIKit.h>

@implementation NSObject (SwiftyThemePerfom)
- (void)st_perfomWithThemeObject:(SwiftyThemeObject *)themeObject{
    
    SEL selector = NSSelectorFromString(themeObject.sel);
    
    NSMethodSignature *signature = [self methodSignatureForSelector:selector];
    
    if (!signature) {
        [self doesNotRecognizeSelector:selector];
    }
    
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
    
    if (!invocation) {
        [self doesNotRecognizeSelector:selector];
    }
    
    [invocation setTarget:self];
    [invocation setSelector:selector];
    
    if (signature.numberOfArguments == themeObject.args.count + 2) {
        
        [themeObject.args enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            
            NSInteger index = idx + 2;
            [self setInvocation:invocation signature:signature arg:obj index:index];
            
        }];
        
    } else {
        NSAssert(YES, @"参数个数与方法参数个数不匹配");
    }
    
}


- (void)setInvocation:(NSInvocation *)invocation signature:(NSMethodSignature *)signature arg:(id)arg index:(NSInteger)index{
    
    if (signature.numberOfArguments <= index) return;
    
    char *type = (char *)[signature getArgumentTypeAtIndex:index];
    
    while (*type == 'r' || // const
           *type == 'n' || // in
           *type == 'N' || // inout
           *type == 'o' || // out
           *type == 'O' || // bycopy
           *type == 'R' || // byref
           *type == 'V') { // oneway
        type++; // cutoff useless prefix
    }
    
    BOOL unsupportedType = NO;
    
    switch (*type) {
        case 'v': // 1: void
        case 'B': // 1: bool
        case 'c': // 1: char / BOOL
        case 'C': // 1: unsigned char
        case 's': // 2: short
        case 'S': // 2: unsigned short
        case 'i': // 4: int / NSInteger(32bit)
        case 'I': // 4: unsigned int / NSUInteger(32bit)
        case 'l': // 4: long(32bit)
        case 'L': // 4: unsigned long(32bit)
        { // 'char' and 'short' will be promoted to 'int'.
            int value = [arg intValue];
            [invocation setArgument:&value atIndex:index];
        } break;
            
        case 'q': // 8: long long / long(64bit) / NSInteger(64bit)
        case 'Q': // 8: unsigned long long / unsigned long(64bit) / NSUInteger(64bit)
        {
            long long value = [arg longLongValue];
            [invocation setArgument:&value atIndex:index];
        } break;
            
        case 'f': // 4: float / CGFloat(32bit)
        { // 'float' will be promoted to 'double'.
            double value = [arg doubleValue];
            float valuef = value;
            [invocation setArgument:&valuef atIndex:index];
        } break;
            
        case 'd': // 8: double / CGFloat(64bit)
        {
            double value = [arg doubleValue];
            [invocation setArgument:&value atIndex:index];
        } break;
            
        case '*': // char *
        case '^': // pointer
        {
            if ([arg isKindOfClass:UIColor.class]) arg = (id)[arg CGColor]; //CGColor转换
            if ([arg isKindOfClass:UIImage.class]) arg = (id)[arg CGImage]; //CGImage转换
            void *value = (__bridge void *)arg;
            [invocation setArgument:&value atIndex:index];
        } break;
            
        case '@': // id
        {
            id value = arg;
            [invocation setArgument:&value atIndex:index];
        } break;
            
        case '{': // struct
        {
            if (strcmp(type, @encode(CGPoint)) == 0) {
                CGPoint value = [arg CGPointValue];
                [invocation setArgument:&value atIndex:index];
            } else if (strcmp(type, @encode(CGSize)) == 0) {
                CGSize value = [arg CGSizeValue];
                [invocation setArgument:&value atIndex:index];
            } else if (strcmp(type, @encode(CGRect)) == 0) {
                CGRect value = [arg CGRectValue];
                [invocation setArgument:&value atIndex:index];
            } else if (strcmp(type, @encode(CGVector)) == 0) {
                CGVector value = [arg CGVectorValue];
                [invocation setArgument:&value atIndex:index];
            } else if (strcmp(type, @encode(CGAffineTransform)) == 0) {
                CGAffineTransform value = [arg CGAffineTransformValue];
                [invocation setArgument:&value atIndex:index];
            } else if (strcmp(type, @encode(CATransform3D)) == 0) {
                CATransform3D value = [arg CATransform3DValue];
                [invocation setArgument:&value atIndex:index];
            } else if (strcmp(type, @encode(NSRange)) == 0) {
                NSRange value = [arg rangeValue];
                [invocation setArgument:&value atIndex:index];
            } else if (strcmp(type, @encode(UIOffset)) == 0) {
                UIOffset value = [arg UIOffsetValue];
                [invocation setArgument:&value atIndex:index];
            } else if (strcmp(type, @encode(UIEdgeInsets)) == 0) {
                UIEdgeInsets value = [arg UIEdgeInsetsValue];
                [invocation setArgument:&value atIndex:index];
            } else {
                unsupportedType = YES;
            }
        } break;
            
        case '(': // union
        {
            unsupportedType = YES;
        } break;
            
        case '[': // array
        {
            unsupportedType = YES;
        } break;
            
        default: // what?!
        {
            unsupportedType = YES;
        } break;
    }
    
    NSAssert(unsupportedType == NO, @"方法的参数类型暂不支持");
}

@end
