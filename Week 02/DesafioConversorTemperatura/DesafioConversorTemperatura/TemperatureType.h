//
//  TemperatureType.h
//  DesafioConversorTemperatura
//
//  Created by Teobaldo Mauro de Moura on 8/24/15.
//  Copyright © 2015 Teobaldo Mauro de Moura. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, TemperatureType) {
    TemperatureCelsious = 0,
    TemperatureFahrenheit = 1,
    TemperatureKelvin = 2
};

TemperatureType TemperaturaTypeMake(NSUInteger value);