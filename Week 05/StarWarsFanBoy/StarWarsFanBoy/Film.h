//
//  Film.h
//  StarWarsFanBoy
//
//  Created by Teobaldo Mauro de Moura on 9/16/15.
//  Copyright © 2015 Teobaldo Mauro de Moura. All rights reserved.
//

#import "ModelBase.h"

@interface Film : ModelBase

@property (nonatomic, copy) NSString *title;
@property (nonatomic) NSInteger episodeID;
@property (nonatomic, copy) NSString *openingCrawl;
@property (nonatomic, copy) NSString *director;
@property (nonatomic, copy) NSString *producer;

/*
#warning TODO: Carregar as propriedades de Filme
@property (nonatomic, copy) NSArray *species;
@property (nonatomic, copy) NSArray *starships;
@property (nonatomic, copy) NSArray *vehicles;
@property (nonatomic, copy) NSArray *characters;
@property (nonatomic, copy) NSArray *planets;
*/

@end
