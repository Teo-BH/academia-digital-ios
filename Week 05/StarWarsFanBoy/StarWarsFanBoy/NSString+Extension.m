//
//  NSDate+Extension.m
//  StarWarsFanBoy
//
//  Created by Teobaldo Mauro de Moura on 9/16/15.
//  Copyright © 2015 Teobaldo Mauro de Moura. All rights reserved.
//

#import "NSString+Extension.h"

@implementation NSString (Extension)

-(NSDate *)jsonDateValue {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSS"];
    
    NSDate *date = [formatter dateFromString:self];
    return date;
}

-(NSNumber *)jsonNumberValue {
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    formatter.numberStyle = NSNumberFormatterDecimalStyle;

    NSNumber *number = [formatter numberFromString:self];
    return number;
}


@end
