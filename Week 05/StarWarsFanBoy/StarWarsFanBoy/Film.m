//
//  Film.m
//  StarWarsFanBoy
//
//  Created by Teobaldo Mauro de Moura on 9/16/15.
//  Copyright © 2015 Teobaldo Mauro de Moura. All rights reserved.
//

#import "Film.h"

@implementation Film

- (instancetype)initWithDictionary:(NSDictionary *)properties
{
    self = [super initWithDictionary:properties withDescriptionName:@"title"];
    if (self && properties) {
        _title = properties[@"title"];
        _episodeID = [properties[@"episodeID"] integerValue];
        _openingCrawl = properties[@"openingCrawl"];
        _director = properties[@"director"];
        _producer = properties[@"producer"];
    }
    return self;
}

@end
