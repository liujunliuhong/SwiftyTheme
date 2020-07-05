//
//  SwiftyThemeDynamicColor.h
//  SwiftyTheme
//
//  Created by apple on 2020/7/2.
//  Copyright © 2020 yinhe. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SwiftyThemeDynamicColorProxy : NSProxy //<NSCopying>
@property (nonatomic, copy) UIColor *(^dynamicProvider)(void);
- (instancetype)initWithDynamicProvider:(UIColor *(^)(void))dynamicProvider;
@end

NS_ASSUME_NONNULL_END
