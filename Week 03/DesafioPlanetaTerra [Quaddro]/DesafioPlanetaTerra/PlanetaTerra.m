//
//  PlanetaTerra.m
//  DesafioPlanetaTerra
//
//  Created by Marcos Trovilho on 31/08/15.
//  Copyright (c) 2015 Marcos Trovilho. All rights reserved.
//

#import "PlanetaTerra.h"
#import "NSDictionary+KeyForObject.h"

#define SMALL_FLAG_URL_FORMAT @"http://geotree.geonames.org/img/flags18/%@.png"
#define LARGE_FLAG_URL_FORMAT @"http://geonames.org/flags/x/%@.gif"

#define CONTINENTES_KEY     @"continents"
#define PAISES_KEY          @"countries"
#define PAIS_CONTINENTE_KEY @"continent"
#define PAIS_NOME_KEY       @"name"

static NSDictionary *_JSON;
static NSMutableDictionary *_CacheBandeiras;

@implementation PlanetaTerra
/*
 Classe com parser do JSON
 - metodos de classe para:
 - listar continentes
 - id do continente a partir do nome
 - total de paises
 - lista de paises por id do continente
 - id do pais a partir do nome
 */

+(NSURL *)localURL {
    return [[NSBundle mainBundle] URLForResource:@"data"
                                   withExtension:@"json"];
}

+(NSURL *)remoteURL {
    return [NSURL URLWithString:@"https://gist.githubusercontent.com/mtrovilho/ce33ebd44f7bce75972e/raw/6e6037f4c66afdad0790d54eb1d86381adfe1a1f/data.json"];
}

+(NSDictionary *)loadJSON {
    NSURL *jsonURL = [self localURL]; // [self remoteURL];
    NSData *jsonData = [NSData dataWithContentsOfURL:jsonURL];
    
    NSError *jsonError = nil;
    NSDictionary *json = [NSJSONSerialization
                          JSONObjectWithData:jsonData
                          options:0
                          error:&jsonError];
    
    if (jsonError)
        NSLog(@"Erro no JSON: %@", jsonError);
    
    return json;
}

+(NSDictionary *)JSON {
    if (!_JSON)
        _JSON = [self loadJSON];
    
    return _JSON;
}

+(NSDictionary *)continentes {
    NSDictionary *dados = [self JSON];
    return [dados objectForKey:CONTINENTES_KEY];
}

+(NSDictionary *)paises {
    NSDictionary *dados = [self JSON];
    return [dados objectForKey:PAISES_KEY];
}

#pragma mark - Public

+(NSArray *)listaContinentes {
    return [[self continentes] allValues];
}

+(NSString *)siglaContinente:(NSString *)nome {
    return (NSString *)[[self continentes] keyForObject:nome];
}

+(NSArray *)listaPaisesContinente:(NSString *)siglaContinente {
    NSPredicate *predicate = [NSPredicate
                              predicateWithFormat:@"%K == %@",
                              PAIS_CONTINENTE_KEY,
                              siglaContinente];
    NSArray *paises = [[self paises] allValues];
    return [paises filteredArrayUsingPredicate:predicate];
}

+(NSDictionary *)listaPais:(NSString *)siglaPais {
    return [[self paises] objectForKey:siglaPais];
}

+(NSString *)siglaPais:(NSString *)nome {
    for (NSString *sigla in [self paises]) {
        NSDictionary *pais = [[self paises] objectForKey:sigla];
        NSString *nomePais = [pais objectForKey:PAIS_NOME_KEY];
        if ([nomePais isEqual:nome]) {
            return sigla;
        }
    }
    
    return nil;
}

+(NSUInteger)totalPaisesContinente:(NSString *)siglaContinente {
    return [[self listaPaisesContinente:siglaContinente] count];
}

+(UIImage *)bandeiraCacheURLString:(NSString *)URLString {
    if (!_CacheBandeiras)
        _CacheBandeiras = [NSMutableDictionary dictionary];
    
    UIImage *cache = [_CacheBandeiras objectForKey:URLString];
    
    if (!cache) {
        NSURL *bandeiraURL = [NSURL URLWithString:URLString];
        
        // NOTA: chamada sync, vai travar a interface
        NSData *bandeiraData = [NSData dataWithContentsOfURL:bandeiraURL];
        
        cache = [UIImage imageWithData:bandeiraData];
        [_CacheBandeiras setObject:cache forKey:URLString];
    }
    
    return cache;
}

+(UIImage *)bandeiraPais:(NSString *)nomePais
                 tamanho:(PlanetaTerraBandeiraTamanho)tamanho {
    
    NSString *URLString = SMALL_FLAG_URL_FORMAT;
    NSString *siglaPais = [self siglaPais:nomePais];
    
    if (tamanho == PlanetaTerraBandeiraTamanhoGrande) {
        URLString = LARGE_FLAG_URL_FORMAT;
        siglaPais = [siglaPais lowercaseString];
    }
    
    NSString *bandeiraURLString = [NSString
                                   stringWithFormat:URLString,
                                   siglaPais];
    return [self bandeiraCacheURLString:bandeiraURLString];
}

@end
