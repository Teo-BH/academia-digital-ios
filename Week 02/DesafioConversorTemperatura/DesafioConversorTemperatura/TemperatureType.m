//
//  TemperatureType.m
//  DesafioConversorTemperatura
//
//  Created by Teobaldo Mauro de Moura on 8/24/15.
//  Copyright © 2015 Teobaldo Mauro de Moura. All rights reserved.
//

#import "TemperatureType.h"

TemperatureType TemperaturaTypeMake(NSUInteger value) {
    switch (value) {
        case 1: return TemperatureFahrenheit;
        case 2: return TemperatureKelvin;
        default: return TemperatureCelsious;
    }
}