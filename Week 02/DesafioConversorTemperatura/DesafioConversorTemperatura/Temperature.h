//
//  Temperatura.h
//  Classes
//
//  Created by Teobaldo Mauro de Moura on 8/20/15.
//  Copyright (c) 2015 Teobaldo Mauro de Moura. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Temperature : NSObject

// Inicializadores
- (instancetype)initWithCelsious:(double)value;
- (instancetype)initWithFahrenheit:(double)value;
- (instancetype)initWithKelvin:(double)value;

// Propriedades Temperaturas
@property double celsious;
@property double fahrenheit;
@property double kelvin;

@end
