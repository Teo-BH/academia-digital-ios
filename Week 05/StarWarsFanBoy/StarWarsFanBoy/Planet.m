//
//  Planet.m
//  StarWarsFanBoy
//
//  Created by Teobaldo Mauro de Moura on 9/16/15.
//  Copyright © 2015 Teobaldo Mauro de Moura. All rights reserved.
//

#import "Planet.h"

@implementation Planet

- (instancetype)initWithDictionary:(NSDictionary *)properties
{
    self = [super initWithDictionary:properties withDescriptionName:@"name"];
    if (self && properties) {
        _name = properties[@"name"];
        _diameter = [properties[@"diameter"] integerValue];
        _rotationPeriod = [properties[@"rotation_period"] integerValue];
        _orbitalPeriod = [properties[@"orbital_period"] integerValue];
        _orbitalPeriod = [properties[@"orbital_period"] integerValue];
        _climate = properties[@"climate"];
        _terrain = properties[@"terrain"];
        _surfaceWater = [properties[@"surface_water"] integerValue];
    }
    return self;
}

@end
