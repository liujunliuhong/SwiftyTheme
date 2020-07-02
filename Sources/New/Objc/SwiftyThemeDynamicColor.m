//
//  SwiftyThemeDynamicColor.m
//  SwiftyTheme
//
//  Created by apple on 2020/7/2.
//  Copyright © 2020 yinhe. All rights reserved.
//

#import "SwiftyThemeDynamicColor.h"


@interface SwiftyThemeDynamicColorProxy : NSProxy <NSCopying>
@property (nonatomic, copy) UIColor *(^dynamicProvider)(void);
@property (nonatomic, strong, readonly) UIColor *resolvedColor;
@end

@implementation SwiftyThemeDynamicColorProxy


- (instancetype)initWithDynamicProvider:(UIColor *(^)(void))dynamicProvider{
    self.dynamicProvider = dynamicProvider;
    return self;
}

- (UIColor *)resolvedColor{
    return self.dynamicProvider();
}

#pragma mark UIColor
- (UIColor *)colorWithAlphaComponent:(CGFloat)alpha{
    return [SwiftyThemeDynamicColor colorWithDynamicProvider:^UIColor * _Nonnull{
        return [self.dynamicProvider() colorWithAlphaComponent:alpha];
    }];
}

#pragma mark NSProxy
- (NSMethodSignature *)methodSignatureForSelector:(SEL)sel{
    return [self.resolvedColor methodSignatureForSelector:sel];
}

- (void)forwardInvocation:(NSInvocation *)invocation{
    [invocation invokeWithTarget:self.resolvedColor];
}


#pragma mark NSObject
- (BOOL)isKindOfClass:(Class)aClass{
    static SwiftyThemeDynamicColor *dynamicColor = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
      dynamicColor = [[SwiftyThemeDynamicColor alloc] init];
    });
    return [dynamicColor isKindOfClass:aClass];
}

#pragma mark NSCopying
- (id)copy{
    return [self copyWithZone:nil];
}

- (id)copyWithZone:(NSZone *)zone{
    return [[SwiftyThemeDynamicColorProxy alloc] initWithDynamicProvider:[self.dynamicProvider copy]];
}

@end










@implementation SwiftyThemeDynamicColor

+ (UIColor *)colorWithKey:(NSString *)colorKey{
    return [self colorWithDynamicProvider:^UIColor * _Nonnull{
        int index = arc4random() % 2;
        if (index == 0) {
            return [UIColor redColor]; // ...
        } else {
            return [UIColor orangeColor]; // ...
        }
        
    }];
}

+ (UIColor *)colorWithDynamicProvider:(UIColor * _Nonnull (^)(void))dynamicProvider{
    return (SwiftyThemeDynamicColor *)[[SwiftyThemeDynamicColorProxy alloc] initWithDynamicProvider:dynamicProvider];
}

@end
