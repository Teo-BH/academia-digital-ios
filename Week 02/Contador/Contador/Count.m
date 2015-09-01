//
//  Count.m
//  Contador
//
//  Created by Teobaldo Mauro de Moura on 8/28/15.
//  Copyright © 2015 Teobaldo Mauro de Moura. All rights reserved.
//

#import "Count.h"

@implementation Count

- (instancetype)init
{
    self = [super init];
    if (self) {
        _value = 0;
        _history = [NSMutableArray array];
    }
    return self;
}

-(void)reset {
    if (_value != 0) {
        [_history addObject:@(_value)];
    }
    
    _value = 0;
}

-(void)increment {
    _value += 1;
}

@end
