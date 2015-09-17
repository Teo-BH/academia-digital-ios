//
//  People.m
//  StarWarsFanBoy
//
//  Created by Teobaldo Mauro de Moura on 9/16/15.
//  Copyright © 2015 Teobaldo Mauro de Moura. All rights reserved.
//

#import "Person.h"

@implementation Person

- (instancetype)initWithDictionary:(NSDictionary *)properties
{
    self = [super initWithDictionary:properties withDescriptionName:@"name"];
    if (self && properties) {
        _name = properties[@"name"];
        _birthYear = properties[@"birth_year"];
        _eyeColor = properties[@"eye_color"];
        _gender = properties[@"gender"];
        _skinColor = properties[@"skin_color"];
        _height = [properties[@"height"] integerValue];
        _mass = [properties[@"mass"] integerValue];
        _hairColor = [properties[@"hair_color"] integerValue];
    }
    return self;
}

@end
