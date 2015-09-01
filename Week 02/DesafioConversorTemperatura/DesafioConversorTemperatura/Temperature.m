//
//  Temperatura.m
//  Classes
//
//  Created by Teobaldo Mauro de Moura on 8/20/15.
//  Copyright (c) 2015 Teobaldo Mauro de Moura. All rights reserved.
//

#import "Temperature.h"

@implementation Temperature {
    double _celsiousValue;
}

// Inicializadores
- (instancetype)init
{
    return [self initWithCelsious:0];
}

- (instancetype)initWithCelsious:(double)value
{
    self = [super init];
    if (self) {
        [self setCelsious:value];
    }
    return self;
}

- (instancetype)initWithFahrenheit:(double)value
{
    self = [super init];
    if (self) {
        [self setFahrenheit:value];
    }
    return self;
}

- (instancetype)initWithKelvin:(double)value
{
    self = [super init];
    if (self) {
        [self setKelvin:value];
    }
    return self;
}

// Propriedades sobrescritas
-(void)setCelsious:(double)value {
    _celsiousValue = value;
}
-(double)celsious {
    return _celsiousValue;
}

-(void)setFahrenheit:(double)value {
    _celsiousValue = FahrenheitToCelsious(value);
}
-(double)fahrenheit {
    return CelsiousToFahrenheit(_celsiousValue);
}

-(void)setKelvin:(double)value {
    _celsiousValue = value - 273.15;
}
- (double)kelvin {
    return _celsiousValue + 273.15;
}

#pragma mark - Funções C

double CelsiousToFahrenheit(double value) {
    return value * 9 / 5 + 32;
    
}

double FahrenheitToCelsious(double value) {
    return (value - 32) * 5 / 9;
    
}

@end
