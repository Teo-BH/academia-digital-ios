//
//  continentHelper.h
//  DesafioPlanetaTerra
//
//  Created by Teobaldo Mauro de Moura on 8/31/15.
//  Copyright (c) 2015 Teobaldo Mauro de Moura. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ContinentParser : NSObject

/*
 
Classe com parser do JSON
- metodos de classe para:
- listar continentes
- id do continente a partir do nome
- total de países
- lista de países por id do continente
- id do pais a partir do nome
 
*/

typedef NS_ENUM(NSUInteger, CountryFlagLength) {
    CountryFlagLengthSmall,
    CountryFlagLengthLarge
};

+(NSArray *)continents;
+(NSString *)continentId:(NSString *)name;
+(NSUInteger)countriesSum:(NSString *)continentName;
+(NSArray *)countries:(NSString *)continentName;
+(NSString *)countryId:(NSString *)name;
+(UIImage *)countryFlag:(NSString *)name withFlagLength:(CountryFlagLength)flagLength;

@end
