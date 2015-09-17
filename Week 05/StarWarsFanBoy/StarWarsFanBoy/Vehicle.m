//
//  Vehicle.m
//  StarWarsFanBoy
//
//  Created by Teobaldo Mauro de Moura on 9/16/15.
//  Copyright © 2015 Teobaldo Mauro de Moura. All rights reserved.
//

#import "Vehicle.h"
#import "NSString+Extension.h"

@implementation Vehicle

- (instancetype)initWithDictionary:(NSDictionary *)properties
{
    self = [super initWithDictionary:properties withDescriptionName:@"name"];
    if (self && properties) {
        _name = properties[@"name"];
        _model = properties[@"model"];
        _vehicleClass = properties[@"vehicle_class"];
        _manufacturer = properties[@"name"];
        _costInCredits = properties[@"cost_in_credits"];
        _length = [properties[@"length"] jsonNumberValue];
        _crew = [properties[@"crew"] integerValue];
        _passengers = [properties[@"passengers"] integerValue];
        _maxAtmospheringSpeed = [properties[@"max_atmosphering_speed"] integerValue];
        _cargoCapacity = [properties[@"cargoCapacity"] integerValue];
        _consumables = properties[@"consumables"];
    }
    return self;
}

@end
