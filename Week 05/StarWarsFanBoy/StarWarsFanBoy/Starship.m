//
//  Starship.m
//  StarWarsFanBoy
//
//  Created by Teobaldo Mauro de Moura on 9/16/15.
//  Copyright © 2015 Teobaldo Mauro de Moura. All rights reserved.
//

#import "Starship.h"

@implementation Starship

- (instancetype)initWithDictionary:(NSDictionary *)properties
{
    self = [super initWithDictionary:properties withDescriptionName:@"name"];
    if (self && properties) {
        _name = properties[@"name"];
        _model = properties[@"model"];
        _starshipClass = properties[@"starship_class"];
        _manufacturer = properties[@"manufacturer"];
        _costInCredits = properties[@"cost_in_credits"];
        _length = properties[@"length"];
        _crew = properties[@"crew"];
        _passengers = properties[@"passengers"];
        _maxAtmospheringSpeed = properties[@"max_atmosphering_Speed"];
        _hyperdriveRating = properties[@"hyperdrive_rating"];
        _MGLT = properties[@"MGLT"];
        _cargoCapacity = properties[@"cargo_capacity"];
        _consumables = properties[@"consumables"];
    }
    return self;
}

@end
