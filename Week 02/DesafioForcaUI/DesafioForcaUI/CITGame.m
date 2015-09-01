//
//  CITGame.m
//  Forca
//
//  Created by Teobaldo Mauro de Moura on 8/21/15.
//  Copyright (c) 2015 Teobaldo Mauro de Moura. All rights reserved.
//

#import "CITGame.h"

@implementation CITGame {
    int tried;
}

- (instancetype)init
{
    return [self initWithWord:[NSString string] fromTry:0];
}

- (instancetype)initWithWord:(NSString *)value fromTry:(NSUInteger)tries
{
    self = [super init];
    if (self) {
        _answer = [value uppercaseString];
        _tries = tries;
        tried = 0;
        [self defineWordMask];
    }
    return self;
}

- (void)defineWordMask {
    _word = [NSMutableString string];
    for (int i = 0; i < _answer.length; i++) {
        [_word appendString:@"_"];
    }
}

- (BOOL)play:(NSString *)letter {
    BOOL result = NO;
    if (tried < _tries) {
        letter = [letter uppercaseString];
        for (int i = 0; i < _answer.length; i++) {
            NSRange range = NSMakeRange(i, 1);
            NSString *item = [_answer substringWithRange:range];
            if ([item isEqual:letter]) {
                [_word replaceCharactersInRange:range withString:letter];
                result = YES;
            }
        }
    }
    
    if (!result)
        tried++;

    return result;
}

- (NSUInteger)lifes {
    int value = self.tries > tried ? self.tries - tried : 0;
    return (NSUInteger)value;
}
@end
