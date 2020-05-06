//
//  SwiftyThemeObject.m
//  SwiftyTheme
//
//  Created by apple on 2020/5/6.
//  Copyright © 2020 yinhe. All rights reserved.
//

#import "SwiftyThemeObject.h"

@interface SwiftyThemeObject()
@property (nonatomic, copy) NSString *sel;
@property (nonatomic, strong) NSArray *args;
@end

@implementation SwiftyThemeObject

- (instancetype)initWithSel:(NSString *)sel args:(NSArray *)args
{
    self = [super init];
    if (self) {
        self.sel = sel;
        self.args = args;
    }
    return self;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (NSUInteger)hash{
    long v1 = (long)sel_getName(NSSelectorFromString(self.sel));
    long v2 = (long)self.args;
    
    NSUInteger value = v1 ^ v2;
    
    return value;
}

- (BOOL)isEqual:(id)object{
    if (![object isKindOfClass:[self class]]) {
        return NO;
    }
    SwiftyThemeObject *other = object;
    
    if (other == self) {
        return YES;
    }
    
    BOOL r1 = self.sel == other.sel;
    
    BOOL r2 = YES;
    if (self.args.count == other.args.count) {
        for (int i = 0; i < self.args.count; i ++) {
            if (self.args[i] != other.args[i]) {
                r2 = NO;
                break;
            }
        }
    } else {
        r2 = NO;
    }
    
    return r1 && r2;
}
@end
