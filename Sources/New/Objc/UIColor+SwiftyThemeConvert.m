//
//  UIColor+SwiftyThemeConvert.m
//  SwiftyTheme
//
//  Created by 刘军 on 2020/7/4.
//  Copyright © 2020 yinhe. All rights reserved.
//

#import "UIColor+SwiftyThemeConvert.h"

@implementation UIColor (SwiftyThemeConvert)
+ (nullable UIColor *)st_convert_colorWithString:(nullable NSString *)colorString{
    if (!colorString) {
        return nil;
    }
    CGFloat alpha = 0.0;
    CGFloat red = 0.0;
    CGFloat green = 0.0;
    CGFloat blue = 0.0;
    
    NSString *tmpColorString = colorString;
    tmpColorString = [tmpColorString uppercaseString];
    tmpColorString = [tmpColorString stringByReplacingOccurrencesOfString:@"#" withString:@""];
    tmpColorString = [tmpColorString stringByReplacingOccurrencesOfString:@"0X" withString:@""];
    tmpColorString = [tmpColorString stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    //
    BOOL flag = NO;
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
                red   = ([strings[0] floatValue]) / 255.0;
                green = ([strings[1] floatValue]) / 255.0;
                blue  = ([strings[2] floatValue]) / 255.0;
                alpha = 1.0;
                flag  = YES;
            } else if (strings.count == 4) {
                red   = ([strings[0] floatValue]) / 255.0;
                green = ([strings[1] floatValue]) / 255.0;
                blue  = ([strings[2] floatValue]) / 255.0;
                alpha = [strings[3] floatValue];
                flag  = YES;
            }
        }
    }
    if (flag) {
        return [[UIColor alloc] initWithRed:red green:green blue:blue alpha:alpha];
    }
    
    //
    
    switch (tmpColorString.length) {
        case 3: // RGB
        {
            alpha = 1.0f;
            red   = [self st_convert_colorComponentFrom:tmpColorString start: 0 length: 1];
            green = [self st_convert_colorComponentFrom:tmpColorString start: 1 length: 1];
            blue  = [self st_convert_colorComponentFrom:tmpColorString start: 2 length: 1];
        }
            break;
        case 4: // ARGB
        {
            alpha = [self st_convert_colorComponentFrom:tmpColorString start: 0 length: 1];
            red   = [self st_convert_colorComponentFrom:tmpColorString start: 1 length: 1];
            green = [self st_convert_colorComponentFrom:tmpColorString start: 2 length: 1];
            blue  = [self st_convert_colorComponentFrom:tmpColorString start: 3 length: 1];
        }
            break;
        case 6: // RRGGBB
        {
            alpha = 1.0f;
            red   = [self st_convert_colorComponentFrom:tmpColorString start: 0 length: 2];
            green = [self st_convert_colorComponentFrom:tmpColorString start: 2 length: 2];
            blue  = [self st_convert_colorComponentFrom:tmpColorString start: 4 length: 2];
        }
            break;
        case 8: // AARRGGBB
        {
            alpha = [self st_convert_colorComponentFrom:tmpColorString start: 0 length: 2];
            red   = [self st_convert_colorComponentFrom:tmpColorString start: 2 length: 2];
            green = [self st_convert_colorComponentFrom:tmpColorString start: 4 length: 2];
            blue  = [self st_convert_colorComponentFrom:tmpColorString start: 6 length: 2];
        }
            break;
        default:
            break;
    }
    return [[UIColor alloc] initWithRed:red green:green blue:blue alpha:alpha];
}
+ (CGFloat)st_convert_colorComponentFrom:(NSString *) string start:(NSUInteger)start length:(NSUInteger) length{
    NSString *substring = [string substringWithRange: NSMakeRange(start, length)];
    NSString *fullHex = (length == 2) ? substring : [NSString stringWithFormat: @"%@%@", substring, substring];
    unsigned hexComponent;
    [[NSScanner scannerWithString: fullHex] scanHexInt: &hexComponent];
    return hexComponent / 255.0f;
}
@end
