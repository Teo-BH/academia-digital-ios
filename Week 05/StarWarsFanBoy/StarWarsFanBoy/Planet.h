//
//  Planet.h
//  StarWarsFanBoy
//
//  Created by Teobaldo Mauro de Moura on 9/16/15.
//  Copyright © 2015 Teobaldo Mauro de Moura. All rights reserved.
//

#import "ModelBase.h"

@interface Planet : ModelBase

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *diameter;
@property (nonatomic, copy) NSString *rotationPeriod;
@property (nonatomic, copy) NSString *orbitalPeriod;
@property (nonatomic, copy) NSString *gravity;
@property (nonatomic, copy) NSString *population;
@property (nonatomic, copy) NSString *climate;
@property (nonatomic, copy) NSString *terrain;
@property (nonatomic, copy) NSString *surfaceWater;

// TODO: Carregar as propriedades de Planeta
@property (nonatomic, copy) NSArray *residents;
@property (nonatomic, copy) NSArray *films;

@end
