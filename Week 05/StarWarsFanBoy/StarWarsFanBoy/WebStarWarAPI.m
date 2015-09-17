//
//  WebStarWarAPI.m
//  StarWarsFanBoy
//
//  Created by Teobaldo Mauro de Moura on 9/16/15.
//  Copyright © 2015 Teobaldo Mauro de Moura. All rights reserved.
//

#import "WebStarWarAPI.h"
#import "EntityMetadata.h"
#import "WebHelper.h"

// Model
#import "ModelBase.h"
#import "Person.h"
#import "Planet.h"
#import "Film.h"
#import "Vehicle.h"
#import "Specie.h"
#import "Starship.h"

#define STAR_WAR_URL_API @"http://swapi.co/api"

@implementation WebStarWarAPI

-(NSArray<EntityMetadata *> *)getEntities {
    // Leitura das Entidades na Web
    NSDictionary *data = [WebHelper requestUrl:STAR_WAR_URL_API];
    if (!data)
        return nil;
    
    // Transformação em classe EntityMetadata
    NSMutableArray *result = [NSMutableArray array];
    for (NSString *name in [data allKeys]) {
        NSURL *url = [NSURL URLWithString:data[name]];
        
        EntityMetadata *entity = [[EntityMetadata alloc] initWithName:name withURL:url];
        [result addObject:entity];
    }
    
    return result;
}

-(NSArray *)getEntity:(NSString *)entityName {
    // Leitura dos dados da Entidade (1˚ página)
    // TODO: Carregar as demais páginas
    NSString *urlText = [self getEntityUrl:entityName];
    if (urlText) {
        NSDictionary *json = [WebHelper requestUrl:urlText];
        if (json && [[json allKeys] containsObject:@"results"])
        {
            NSDictionary *data = json[@"results"];
            
            // Transformação em classe (Person, Planets, ...)
            NSMutableArray *result = [NSMutableArray array];
            for (NSDictionary *properties in data) {
                ModelBase *model = [[self allocEntity:entityName] initWithDictionary:properties];
                [result addObject:model];
            }
            return result;
        }
    }
    return nil;
}

-(NSString *)getEntityUrl:(NSString *)entityName {
    NSArray<EntityMetadata *> * entities = [self getEntities];
    
    NSString *expression = [NSString stringWithFormat:@"name == '%@'", entityName];
    NSPredicate *filter = [NSPredicate predicateWithFormat:expression];
    NSArray *results = [entities filteredArrayUsingPredicate:filter];
    
    if (results.count == 1) {
        EntityMetadata *entity = (EntityMetadata *)results[0];
        return [entity.url absoluteString];
    } else {
        return nil;
    }
}

-(ModelBase *) allocEntity:(NSString *)entityName {
    if ([entityName isEqualToString:@"people"]) {
        return [Person alloc];
    } else if ([entityName isEqualToString:@"planets"]) {
        return [Planet alloc];
    } else if ([entityName isEqualToString:@"films"]) {
        return [Film alloc];
    } else if ([entityName isEqualToString:@"vehicles"]) {
        return [Vehicle alloc];
    } else if ([entityName isEqualToString:@"species"]) {
        return [Specie alloc];
    } else if ([entityName isEqualToString:@"starships"]) {
        return [Starship alloc];
    } else {
        return nil;
    }
}

@end
