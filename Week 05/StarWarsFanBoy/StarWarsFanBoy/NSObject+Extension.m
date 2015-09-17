//
//  ReflectorHelper.m
//  StarWarsFanBoy
//
//  Created by Teobaldo Mauro de Moura on 9/17/15.
//  Copyright © 2015 Teobaldo Mauro de Moura. All rights reserved.
//

#import "NSObject+Extension.h"
#import <objc/runtime.h>

@implementation NSObject (Extension)

-(NSArray<NSString *> *)properties {
    NSMutableArray<NSString *> *result = [NSMutableArray array];
    Class class = [self class];
    while (class != [NSObject class]) {
        unsigned int count;
        objc_property_t *properties = class_copyPropertyList(class, &count);
        
        for (unsigned int i = 0; i < count; i++) {
            objc_property_t property = properties[i];
            const char *propChar = property_getName(property);
            NSString *propName = [NSString stringWithUTF8String:propChar];
            [result addObject:propName];
        }
        
        class = [class superclass];
    }
    
    return result;
}

-(NSString *)displayText {
    if (self == nil) {
        return [NSString string];
    } else if ([self isKindOfClass:[NSDate class]]) {
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateStyle:NSDateFormatterShortStyle];
        [formatter setTimeStyle:NSDateFormatterShortStyle];
        return [formatter stringFromDate:(NSDate *)self];
    } else {
        return [self description];
    }
}

@end
