//
//  Species.h
//  StarWarsFanBoy
//
//  Created by Teobaldo Mauro de Moura on 9/16/15.
//  Copyright © 2015 Teobaldo Mauro de Moura. All rights reserved.
//

#import "ModelBase.h"

@interface Specie : ModelBase

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *classification;
@property (nonatomic, copy) NSString *designation;
@property (nonatomic, copy) NSNumber *averageHeight;
@property (nonatomic, copy) NSNumber *averageLifespan;
@property (nonatomic, copy) NSString *eyeColors;
@property (nonatomic, copy) NSString *hairColors;
@property (nonatomic, copy) NSString *skinColors;
@property (nonatomic, copy) NSString *language;

/*
#warning TODO: Carregar as propriedades de Specie
@property (nonatomic, copy) NSString *homeworld;
@property (nonatomic, copy) NSArray *people;
@property (nonatomic, copy) NSArray *films;
*/

@end
