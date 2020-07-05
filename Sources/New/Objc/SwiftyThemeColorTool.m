//
//  SwiftyThemeColorTool.m
//  SwiftyTheme
//
//  Created by apple on 2020/7/3.
//  Copyright © 2020 yinhe. All rights reserved.
//

#import "SwiftyThemeColorTool.h"

@implementation SwiftyThemeColorTool
//+ (UIColor *)colorWithHex:(long)hex alpha:(CGFloat)alpha{
//    CGFloat red = ((CGFloat)((hex & 0xFF0000) >> 16)) / 255.0;
//    CGFloat green = ((CGFloat)((hex & 0xFF00) >> 8)) / 255.0;
//    CGFloat blue = ((CGFloat)(hex & 0xFF)) / 255.0;
//    return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
//}

//+ (UIColor *)colorWithString:(NSString *)colorString{
//    if (!colorString) {
//        return nil;
//    }
//    CGFloat alpha = 0.0;
//    CGFloat red = 0.0;
//    CGFloat green = 0.0;
//    CGFloat blue = 0.0;
//
//    NSString *tmpColorString = colorString;
//    tmpColorString = [tmpColorString uppercaseString];
//    tmpColorString = [tmpColorString stringByReplacingOccurrencesOfString:@"#" withString:@""];
//    tmpColorString = [tmpColorString stringByReplacingOccurrencesOfString:@"0X" withString:@""];
//    tmpColorString = [tmpColorString stringByReplacingOccurrencesOfString:@" " withString:@""];
//
//    //
//    BOOL flag = NO;
//    if ([tmpColorString containsString:@","]) {
//        NSArray<NSString *> *strings = [tmpColorString componentsSeparatedByString:@","];
//
//        __block BOOL isNumber = YES;
//        [strings enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//            NSScanner *scan = [NSScanner scannerWithString:obj];
//            float val;
//            isNumber = [scan scanFloat:&val] && [scan isAtEnd];
//            if (!isNumber) {
//                *stop = YES;
//            }
//        }];
//
//        if (isNumber) {
//            if (strings.count == 3) {
//                red   = ([strings[0] floatValue]) / 255.0;
//                green = ([strings[1] floatValue]) / 255.0;
//                blue  = ([strings[2] floatValue]) / 255.0;
//                alpha = 1.0;
//                flag  = YES;
//            } else if (strings.count == 4) {
//                red   = ([strings[0] floatValue]) / 255.0;
//                green = ([strings[1] floatValue]) / 255.0;
//                blue  = ([strings[2] floatValue]) / 255.0;
//                alpha = [strings[3] floatValue];
//                flag  = YES;
//            }
//        }
//    }
//    if (flag) {
//        return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
//    }
//
//    //
//
//    switch (tmpColorString.length) {
//        case 3: // RGB
//        {
//            alpha = 1.0f;
//            red   = [self colorComponentFrom:tmpColorString start: 0 length: 1];
//            green = [self colorComponentFrom:tmpColorString start: 1 length: 1];
//            blue  = [self colorComponentFrom:tmpColorString start: 2 length: 1];
//        }
//            break;
//        case 4: // ARGB
//        {
//            alpha = [self colorComponentFrom:tmpColorString start: 0 length: 1];
//            red   = [self colorComponentFrom:tmpColorString start: 1 length: 1];
//            green = [self colorComponentFrom:tmpColorString start: 2 length: 1];
//            blue  = [self colorComponentFrom:tmpColorString start: 3 length: 1];
//        }
//            break;
//        case 6: // RRGGBB
//        {
//            alpha = 1.0f;
//            red   = [self colorComponentFrom:tmpColorString start: 0 length: 2];
//            green = [self colorComponentFrom:tmpColorString start: 2 length: 2];
//            blue  = [self colorComponentFrom:tmpColorString start: 4 length: 2];
//        }
//            break;
//        case 8: // AARRGGBB
//        {
//            alpha = [self colorComponentFrom:tmpColorString start: 0 length: 2];
//            red   = [self colorComponentFrom:tmpColorString start: 2 length: 2];
//            green = [self colorComponentFrom:tmpColorString start: 4 length: 2];
//            blue  = [self colorComponentFrom:tmpColorString start: 6 length: 2];
//        }
//            break;
//        default:
//            break;
//    }
//    return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
//}
//
//



@end
