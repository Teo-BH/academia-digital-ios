//
//  PlanetaTerra.h
//  DesafioPlanetaTerra
//
//  Created by Marcos Trovilho on 31/08/15.
//  Copyright (c) 2015 Marcos Trovilho. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, PlanetaTerraBandeiraTamanho) {
    PlanetaTerraBandeiraTamanhoPequeno,
    PlanetaTerraBandeiraTamanhoGrande
};

@interface PlanetaTerra : NSObject
// Continentes
+(NSArray *)listaContinentes;
+(NSString *)siglaContinente:(NSString *)nome;
// Paises
+(NSArray *)listaPaisesContinente:(NSString *)siglaContinente;
+(NSDictionary *)listaPais:(NSString *)siglaPais;
+(NSString *)siglaPais:(NSString *)nome;
+(NSUInteger)totalPaisesContinente:(NSString *)siglaContinente;
+(UIImage *)bandeiraPais:(NSString *)nomePais
                 tamanho:(PlanetaTerraBandeiraTamanho)tamanho;
@end
