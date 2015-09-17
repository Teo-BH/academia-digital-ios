//
//  EntityMetadata.m
//  StarWarsFanBoy
//
//  Created by Teobaldo Mauro de Moura on 9/16/15.
//  Copyright © 2015 Teobaldo Mauro de Moura. All rights reserved.
//

#import "EntityMetadata.h"

@implementation EntityMetadata

- (instancetype)init
{
    return [self initWithName:nil withURL:nil];
}

- (instancetype)initWithName:(NSString *) name withURL:(NSURL *)url
{
    self = [super init];
    if (self) {
        _name = name;
        _url = url;
    }
    return self;
}

-(NSString *)description {
    return [NSString stringWithFormat:@"Entity: %@", [self name]];
}

@end
