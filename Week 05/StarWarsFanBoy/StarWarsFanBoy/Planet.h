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
@property (nonatomic) NSInteger diameter;
@property (nonatomic) NSInteger rotationPeriod;
@property (nonatomic) NSInteger orbitalPeriod;
@property (nonatomic, copy) NSString *gravity;
@property (nonatomic) NSInteger population;
@property (nonatomic, copy) NSString *climate;
@property (nonatomic, copy) NSString *terrain;
@property (nonatomic) NSInteger surfaceWater;

/*
#warning TODO: Carregar as propriedades de Planeta
@property (nonatomic, copy) NSArray *residents;
@property (nonatomic, copy) NSArray *films;
*/

@end
