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

+ (UIColor *)colorWithString:(NSString *)colorString{
    if (!colorString) {
        return nil;
    }
    NSString *tmpColorString = colorString;
    tmpColorString = [tmpColorString uppercaseString];
    tmpColorString = [tmpColorString stringByReplacingOccurrencesOfString:@"#" withString:@""];
    tmpColorString = [tmpColorString stringByReplacingOccurrencesOfString:@"0X" withString:@""];
    tmpColorString = [tmpColorString stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    //
    UIColor *rgbColor = nil;
    if ([tmpColorString containsString:@","]) {
        NSArray<NSString *> *strings = [tmpColorString componentsSeparatedByString:@","];
        
        __block BOOL isNumber = YES;
        [strings enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            NSScanner *scan = [NSScanner scannerWithString:obj];
            float val;
            isNumber = [scan scanFloat:&val] && [scan isAtEnd];
            if (!isNumber) {
                *stop = YES;
            }
        }];
        
        if (isNumber) {
            if (strings.count == 3) {
                CGFloat red = ([strings[0] floatValue]) / 255.0;
                CGFloat green = ([strings[1] floatValue]) / 255.0;
                CGFloat blue = ([strings[2] floatValue]) / 255.0;
                rgbColor = [UIColor colorWithRed:red green:green blue:blue alpha:1];
            } else if (strings.count == 4) {
                CGFloat red = ([strings[0] floatValue]) / 255.0;
                CGFloat green = ([strings[1] floatValue]) / 255.0;
                CGFloat blue = ([strings[2] floatValue]) / 255.0;
                CGFloat alpha = [strings[3] floatValue];
                rgbColor = [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
            }
        }
    }
    if (rgbColor) {
        return rgbColor;
    }
    
    //
    UIColor *hexColor = nil;
    switch (tmpColorString.length) {
        case 3: // RGB
        {
            CGFloat alpha = 1.0f;
            CGFloat red   = [self colorComponentFrom:colorString start: 0 length: 1];
            CGFloat green = [self colorComponentFrom:colorString start: 1 length: 1];
            CGFloat blue  = [self colorComponentFrom:colorString start: 2 length: 1];
            hexColor = [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
        }
            break;
        case 4: // ARGB
        {
            CGFloat alpha = [self colorComponentFrom:colorString start: 0 length: 1];
            CGFloat red   = [self colorComponentFrom:colorString start: 1 length: 1];
            CGFloat green = [self colorComponentFrom:colorString start: 2 length: 1];
            CGFloat blue  = [self colorComponentFrom:colorString start: 3 length: 1];
            hexColor = [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
        }
            break;
        case 6: // RRGGBB
        {
            CGFloat alpha = 1.0f;
            CGFloat red   = [self colorComponentFrom:colorString start: 0 length: 2];
            CGFloat green = [self colorComponentFrom:colorString start: 2 length: 2];
            CGFloat blue  = [self colorComponentFrom:colorString start: 4 length: 2];
            hexColor = [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
        }
            break;
        case 8: // AARRGGBB
        {
            CGFloat alpha = [self colorComponentFrom:colorString start: 0 length: 2];
            CGFloat red   = [self colorComponentFrom:colorString start: 2 length: 2];
            CGFloat green = [self colorComponentFrom:colorString start: 4 length: 2];
            CGFloat blue  = [self colorComponentFrom:colorString start: 6 length: 2];
            hexColor = [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
        }
            break;
        default:
        {
            CGFloat alpha = 0;
            CGFloat red   = 0;
            CGFloat green = 0;
            CGFloat blue  = 0;
            hexColor = [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
        }
            break;
    }
    return hexColor;
}



+ (CGFloat)colorComponentFrom:(NSString *) string start:(NSUInteger)start length:(NSUInteger) length{
    NSString *substring = [string substringWithRange: NSMakeRange(start, length)];
    NSString *fullHex = (length == 2) ? substring : [NSString stringWithFormat: @"%@%@", substring, substring];
    unsigned hexComponent;
    [[NSScanner scannerWithString: fullHex] scanHexInt: &hexComponent];
    return hexComponent / 255.0f;
}

@end
