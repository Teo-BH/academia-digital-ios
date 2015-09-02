//
//  TaskData.m
//  DesafioGeral
//
//  Created by Teobaldo Mauro de Moura on 9/2/15.
//  Copyright © 2015 Teobaldo Mauro de Moura. All rights reserved.
//

#import "TaskData.h"

@implementation TaskData

- (instancetype)init
{
    return [self initWitName:[NSString string]];
}

- (instancetype)initWitName:(NSString *)name
{
    self = [super init];
    if (self) {
        _name = name;
        _done = NO;
    }
    return self;
}

-(NSString *)description {
    return [NSString stringWithFormat:@"Name: %@ - Done: %d", _name, _done];
}

@end
