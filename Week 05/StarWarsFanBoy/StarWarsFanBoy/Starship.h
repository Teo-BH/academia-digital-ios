//
//  Starship.h
//  StarWarsFanBoy
//
//  Created by Teobaldo Mauro de Moura on 9/16/15.
//  Copyright © 2015 Teobaldo Mauro de Moura. All rights reserved.
//

#import "ModelBase.h"

@interface Starship : ModelBase

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *model;
@property (nonatomic, copy) NSString *starshipClass;
@property (nonatomic, copy) NSString *manufacturer;
@property (nonatomic, copy) NSString *costInCredits;
@property (nonatomic, copy) NSString *length;
@property (nonatomic, copy) NSString *crew;
@property (nonatomic, copy) NSString *passengers;
@property (nonatomic, copy) NSString *maxAtmospheringSpeed;
@property (nonatomic, copy) NSString *hyperdriveRating;
@property (nonatomic, copy) NSString *MGLT;
@property (nonatomic, copy) NSString *cargoCapacity;
@property (nonatomic, copy) NSString *consumables;

// TODO: Carregar as propriedades de Nave
@property (nonatomic, copy) NSArray *films;
@property (nonatomic, copy) NSArray *pilots;

@end
