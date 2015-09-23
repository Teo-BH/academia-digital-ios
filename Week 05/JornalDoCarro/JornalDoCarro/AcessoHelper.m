//
//  AcessoHelper.m
//  JornalDoCarro
//
//  Created by Rafael Reis Achcar Zanin on 22/09/15.
//  Copyright © 2015 Rafael Reis Achcar Zanin. All rights reserved.
//

#import "AppDelegate.h"
#import "AcessoHelper.h"

@implementation AcessoHelper

+ (NSDictionary *)pesquisarAcessosMarca {
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:[Acesso entityName]];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"%K == nil", @"id_grupo"];
    
    [request setPredicate:predicate];
    
    // executar request
    NSError *error = nil;
    NSArray *results = [[self context] executeFetchRequest:request error:&error];
    
    if (error) {
        NSLog(@"%@", error);
        return nil;
    } else {
        NSMutableDictionary *retorno = [NSMutableDictionary dictionary];
        for (Acesso *acesso in results) {
            [retorno setObject:acesso.qtde_acesso forKey:acesso.id_marca];
        }
        return retorno;
    }
}

+ (NSDictionary *)pesquisarAcessosGrupo:(NSString *)idMarca {
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:[Acesso entityName]];
    NSPredicate *grupoFilter = [NSPredicate predicateWithFormat:@"%K != nil", @"id_grupo"];
    NSPredicate *marcaFilter = [NSPredicate predicateWithFormat:@"%K == %@", @"id_marca",idMarca];
    
    NSPredicate *predicate = [NSCompoundPredicate andPredicateWithSubpredicates:@[marcaFilter, grupoFilter]];
    [request setPredicate:predicate];
    
    // executar request
    NSError *error = nil;
    NSArray *results = [[self context] executeFetchRequest:request error:&error];
    
    if (error) {
        NSLog(@"%@", error);
        return nil;
    } else {
        NSMutableDictionary *retorno = [NSMutableDictionary dictionary];
        for (Acesso *acesso in results) {
            [retorno setObject:acesso.qtde_acesso forKey:acesso.id_grupo];
        }
        return retorno;
    }
}

+ (Acesso *)pesquisarAcesso:(NSString *)idMarca withGrupo:(NSString *)idGrupo {
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:[Acesso entityName]];

    NSPredicate *marcaFilter = [NSPredicate predicateWithFormat:@"%K == %@", @"id_marca",idMarca];
    NSPredicate *grupoFilter;
    if (idGrupo) {
        grupoFilter = [NSPredicate predicateWithFormat:@"%K == %@", @"id_grupo",idGrupo];
    } else {
        grupoFilter = [NSPredicate predicateWithFormat:@"%K == nil", @"id_grupo"];
    }
    NSPredicate *predicate = [NSCompoundPredicate andPredicateWithSubpredicates:@[marcaFilter, grupoFilter]];
    
    [request setPredicate:predicate];
    
    // executar request
    NSError *error = nil;
    NSArray *results = [[self context] executeFetchRequest:request error:&error];
    
    if (error) {
        NSLog(@"%@", error);
        return nil;
    }
    
    if ([results count] > 0) {
        return results[0];
    }
    
    return nil;
}

+ (void)computarAcessoMarca:(NSString *)idMarca {
    [self computarAcessoGrupo:nil withMarca:idMarca];
}

+ (void)computarAcessoGrupo:(NSString *)idGrupo withMarca:(NSString *)idMarca {
    Acesso *acesso = [self pesquisarAcesso:idMarca withGrupo:idGrupo];
    if (!acesso) {
        NSEntityDescription * entity = [NSEntityDescription entityForName:[Acesso entityName] inManagedObjectContext:[self context]];
        
        acesso = [[Acesso alloc] initWithEntity:entity insertIntoManagedObjectContext:[self context]];
        acesso.id_marca = idMarca;
        acesso.id_grupo = idGrupo;
        acesso.qtde_acesso = 0;
    }
    acesso.qtde_acesso = @([acesso.qtde_acesso intValue]+1);
    [[self appDelegate] saveContext];
}

#pragma mark - CoreData

+ (AppDelegate *)appDelegate {
    AppDelegate *result = [[UIApplication sharedApplication] delegate];
    return result;
}

+ (NSManagedObjectContext *)context {
    NSManagedObjectContext *result = [[self appDelegate] managedObjectContext];
    return result;
}

@end
