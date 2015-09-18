//
//  Vehicle.h
//  StarWarsFanBoy
//
//  Created by Teobaldo Mauro de Moura on 9/16/15.
//  Copyright © 2015 Teobaldo Mauro de Moura. All rights reserved.
//

#import "ModelBase.h"

@interface Vehicle : ModelBase

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *model;
@property (nonatomic, copy) NSString *vehicleClass;
@property (nonatomic, copy) NSString *manufacturer;
@property (nonatomic, copy) NSNumber *costInCredits;
@property (nonatomic, copy) NSNumber *length;
@property (nonatomic) NSInteger crew;
@property (nonatomic) NSInteger passengers;
@property (nonatomic) NSInteger maxAtmospheringSpeed;
@property (nonatomic) NSInteger cargoCapacity;
@property (nonatomic, copy) NSNumber *consumables;

/*
#warning TODO: Carregar as propriedades de Planeta
@property (nonatomic, copy) NSArray *films;
@property (nonatomic, copy) NSArray *pilots;
*/

@end
