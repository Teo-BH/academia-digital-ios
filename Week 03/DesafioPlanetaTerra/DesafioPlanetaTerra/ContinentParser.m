//
//  continentHelper.m
//  DesafioPlanetaTerra
//
//  Created by Teobaldo Mauro de Moura on 8/31/15.
//  Copyright (c) 2015 Teobaldo Mauro de Moura. All rights reserved.
//

#import "ContinentParser.h"

#define WEB_JSON_URL [NSURL URLWithString:@"https://gist.githubusercontent.com/mtrovilho/ce33ebd44f7bce75972e/raw/6e6037f4c66afdad0790d54eb1d86381adfe1a1f/data.json"]
#define LOCAL_JSON_URL [[NSBundle mainBundle] URLForResource:@"data" withExtension:@"json"]

#define SMALL_FLAG_URL @"http://geotree.geonames.org/img/flags18/%@.png"
#define LARGE_FLAG_URL @"http://www.geonames.org/flags/x/%@.gif"

#define CONTINENTS_KEY @"continents"
#define COUNTRY_KEY @"countries"
#define COUNTRY_CONTINENT_KEY @"continent"
#define COUNTRY_NAME @"name"

// TODO: Leitura do json.data (local)
// TODO: cache de bandeiras

@implementation ContinentParser

+(NSDictionary *)loadJson {
    NSURL *url =  LOCAL_JSON_URL; // WEB_JSON_URL;
    NSData *data = [NSData dataWithContentsOfURL:url];
    
    NSError *jsonError = nil;
    NSDictionary *result = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
    
    if (jsonError) {
        NSLog(@"Erro do JSON: %@", jsonError);
    }
    
    return result;
}

+(NSDictionary *)json {
    if (!_json)
        _json = [self loadJson];
    return _json;
} static NSDictionary *_json;

+(NSArray *)continents {
    // Tips: self é a subclasse por está dentro de um escopo estático
    NSDictionary *continents = [[self json] objectForKey:CONTINENTS_KEY];
    NSArray *result = [continents allValues];
    return result;
}

+(NSString *)continentId:(NSString *)name {
    NSDictionary *continents = [[self json] objectForKey:CONTINENTS_KEY];
    for (NSString *key in continents) {
        if ([[continents objectForKey:key] isEqual:name]) {
            return key;
        }
    }
    return nil;
}

+(NSArray *)countries {
    // Tips: self é a subclasse por está dentro de um escopo estático
    NSDictionary *dict = [[self json] objectForKey:COUNTRY_KEY];
    NSArray *result = [dict allValues];
    return result;
}

+(NSUInteger)countriesSum:(NSString *)continentName {
    NSArray *result = [self countries:continentName];
    return [result count];
}

+(NSArray *)countries:(NSString *)continentName {
    NSString *continentId = [self continentId:continentName];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"%K == %@", COUNTRY_CONTINENT_KEY, continentId];
    NSArray *result = [[self countries] filteredArrayUsingPredicate:predicate];
    return result;
}

+(NSString *)countryId:(NSString *)name {
    NSDictionary *countries = [[self json] objectForKey:COUNTRY_KEY];
    for (NSString *key in countries) {
        NSDictionary *country = [countries objectForKey:key];
        NSString *countryName = [country objectForKey:COUNTRY_NAME];
        if ([countryName isEqual:name]) {
            return key;
        }
    }
    return nil;
}

+(UIImage *)countryFlag:(NSString *)name withFlagLength:(CountryFlagLength)flagLength {
    NSString *countryId = (flagLength == CountryFlagLengthSmall) ? [self countryId:name] : [[self countryId:name] lowercaseString];
    NSString *flagURLPattern = (flagLength == CountryFlagLengthSmall) ? SMALL_FLAG_URL : LARGE_FLAG_URL;
    NSString *flagURLString = [NSString stringWithFormat:flagURLPattern, countryId];
    NSURL *url = [NSURL URLWithString:flagURLString];
    NSData *data = [NSData dataWithContentsOfURL:url];
    
    UIImage *result = [UIImage imageWithData:data];
    return result;
}

@end
