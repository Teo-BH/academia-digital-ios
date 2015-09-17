//
//  Species.m
//  StarWarsFanBoy
//
//  Created by Teobaldo Mauro de Moura on 9/16/15.
//  Copyright © 2015 Teobaldo Mauro de Moura. All rights reserved.
//

#import "Specie.h"

@implementation Specie

- (instancetype)initWithDictionary:(NSDictionary *)properties
{
    self = [super initWithDictionary:properties withDescriptionName:@"name"];
    if (self && properties) {
        _name = properties[@"name"];
        _classification = properties[@"classification"];
        _designation = properties[@"designation"];
        _averageHeight = properties[@"average_height"];
        _averageLifespan = properties[@"average_lifespan"];
        _eyeColors = properties[@"eye_colors"];
        _hairColors = properties[@"hair_colors"];
        _skinColors = properties[@"skin_colors"];
        _language = properties[@"language"];

    }
    return self;
}

@end
