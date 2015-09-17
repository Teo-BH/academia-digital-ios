//
//  People.h
//  StarWarsFanBoy
//
//  Created by Teobaldo Mauro de Moura on 9/16/15.
//  Copyright © 2015 Teobaldo Mauro de Moura. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ModelBase.h"

@interface Person : ModelBase

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *birthYear;
@property (nonatomic, copy) NSString *eyeColor;
@property (nonatomic, copy) NSString *gender;
@property (nonatomic, copy) NSString *skinColor;
@property (nonatomic) NSInteger height;
@property (nonatomic) NSInteger mass;
@property (nonatomic) NSInteger hairColor;

// TODO: Carregar as propriedades de Pessoa
@property (nonatomic, copy) NSString *homeworld;
@property (nonatomic, copy) NSArray *films;
@property (nonatomic, copy) NSArray *species;
@property (nonatomic, copy) NSArray *starships;
@property (nonatomic, copy) NSArray *vehicles;

@end
