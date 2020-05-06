//
//  SwiftyThemeObject.h
//  SwiftyTheme
//
//  Created by apple on 2020/5/6.
//  Copyright © 2020 yinhe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@interface SwiftyThemeObject : NSObject
@property (nonatomic, copy, readonly) NSString *sel;
@property (nonatomic, strong, readonly) NSArray *args;
- (instancetype)initWithSel:(NSString *)sel args:(NSArray *)args;
- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)new NS_UNAVAILABLE;
@end
NS_ASSUME_NONNULL_END
