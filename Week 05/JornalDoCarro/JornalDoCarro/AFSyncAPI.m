//
//  AFSyncAPI.m
//  JornalDoCarro
//
//  Created by Rafael Reis Achcar Zanin on 21/09/15.
//  Copyright © 2015 Rafael Reis Achcar Zanin. All rights reserved.
//

#import "AFSyncAPI.h"
#import <AFNetworking/AFNetworking.h>
#import "Marca.h"
#import "Veiculo.h"
#import "Modelo.h"
#import "Grupo.h"
#import "AppDelegate.h"
#import <CoreData/CoreData.h>


#define MARCA_URL @"http://fipeapi.appspot.com/api/1/carros/marcas.json"
#define VEICULO_URL @"http://fipeapi.appspot.com/api/1/carros/veiculos/%@.json"
#define MODELO_URL @"http://fipeapi.appspot.com/api/1/carros/veiculo/%@/%@.json"
#define DETAIL_MODELO_URL @"http://fipeapi.appspot.com/api/1/carros/veiculo/%@/%@/%@.json"

typedef NS_ENUM(NSUInteger, NetworkType) {
    NetworkTypeData = 0,
    NetworkTypeAF = 1
};


@implementation AFSyncAPI

-(void)getJSON:(NSString*)urlText withNetworkType:(NetworkType)netType
    onComplete:(void (^)(NSDictionary *json))successBlock {
    if(netType == NetworkTypeData) {
        
        NSURL * url = [NSURL URLWithString:urlText];
        NSData * data = [NSData dataWithContentsOfURL:url];
        
        NSError * error = nil;
        NSDictionary * result = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
        
        if(!error)
            successBlock(result);
        else
            NSLog(@"Falha de comunicacao Http: %@", error);
        
    } else {
        
        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
        [[manager operationQueue] setMaxConcurrentOperationCount:3];
        [manager GET:urlText
          parameters:nil
             success:^(AFHTTPRequestOperation *operation, id responseObject) {
                 successBlock(responseObject);
             }
             failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                 NSLog(@"Falha de comunicacao http (AFNetworking): %@", error);
             }];
    }
    
}

#pragma mark - Marcas

-(void)syncMarcasWithComplete:(void (^)(void))successBlock {
    
    //deletando todas marcas do banco
    [self deleteAllMarcas];
    
    //pegando todos valores do json
    [self getJSON:MARCA_URL withNetworkType:NetworkTypeData onComplete:^(NSDictionary *json) {
         //carregando cada dictionary e persistindo no banco
        for (NSDictionary * property in json) {
            NSEntityDescription * entity = [NSEntityDescription entityForName:[Marca entityName] inManagedObjectContext:[self context]];
            
            Marca *marca = [[Marca alloc] initWithEntity:entity insertIntoManagedObjectContext:[self context]];
            [marca loadProperties:property];
            [marca setStatus_sync:@(NO)];
        }
        //salvando alteracoes
        [[self appDelegate] saveContext];

        //sincronizacao concluida
        successBlock();
        
    }];    
}

-(NSArray<Marca*> *)getMarcas {
    return [self getMarcasWithPredicate:nil];
}



-(Marca*)getMarca:(NSNumber*)idMarca {
    NSPredicate * predicate = [NSPredicate predicateWithFormat:@"%K == %@", @"id",idMarca];
    NSArray * marcas = [self getMarcasWithPredicate:predicate];
    return marcas[0];
}

-(NSArray<Marca *> *)getMarcasWithPredicate:(NSPredicate *)predicate{
    // fetch request
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:[Marca entityName]];
    
    if(predicate) [request setPredicate:predicate];
    
    //ordernar
    NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES];
    [request setSortDescriptors:@[sort]];
    
    // executar request
    NSError *error = nil;
    NSArray *results = [[self context] executeFetchRequest:request error:&error];
    
    
    if (error) {
        NSLog(@"%@", error);
        return nil;
    } else {
        return results;
    }
    
    return nil;
}

-(void)deleteAllMarcas {
    
    NSArray<Marca*> *marcas = [self getMarcas];
    
    for (Marca * marca in marcas) {
        [[self context] deleteObject:marca];
    }
    
}

-(void)syncMarcaWithId:(NSNumber *)idMarca withComplete:(void (^)(void))successBlock {
   
    Marca * marca = [self getMarca:idMarca];
    NSString *url = [NSString stringWithFormat:VEICULO_URL, idMarca];
    
    [self getJSON:url withNetworkType:NetworkTypeData onComplete:^(NSDictionary *json) {
        
        for (NSDictionary * property in json) {
            NSEntityDescription * entity = [NSEntityDescription entityForName:[Veiculo entityName] inManagedObjectContext:[self context]];
            
            Veiculo *veiculo = [[Veiculo alloc] initWithEntity:entity insertIntoManagedObjectContext:[self context]];
            
            NSSet * veiculos = [NSSet setWithObject:veiculo];
            
            [marca addMarca_veiculo:veiculos];
            [veiculo loadProperties:property];
            
            [self syncGrupoVeiculo:veiculo];
            [self syncModeloWithVeiculo:veiculo];
            
        }
        //marcando marca como sincronizada
        [marca setStatus_sync:@(YES)];
        [marca setDate_sync:[NSDate date]];
        //salvando alteracoes
        [[self appDelegate] saveContext];
        //sincronizacao concluida
        successBlock();
    }];
}

#pragma mark - Grupo



-(void)syncGrupoVeiculo:(Veiculo *)veiculo{

    NSArray * splitKey = [veiculo.key componentsSeparatedByString:@"-"];
    
    Grupo * grupo = [self getGrupo:splitKey[0]];
    
    if(!grupo){
        
        NSEntityDescription * entity = [NSEntityDescription entityForName:[Grupo entityName] inManagedObjectContext:[self context]];
        grupo = [[Grupo alloc] initWithEntity:entity insertIntoManagedObjectContext:[self context]];
        
        [grupo setName:[splitKey[0] uppercaseString]];
        [grupo setKey:splitKey[0]];
        [grupo setFipe_marca:veiculo.fipe_marca];
        [grupo setId_marca:@([veiculo.id integerValue])];
       
    }
    
    NSSet * grupos = [NSSet setWithObject:veiculo];
    [grupo addGrupo_veiculo:grupos];
}

-(NSArray<Grupo *> *)getGruposWithPredicate:(NSPredicate *)predicate{
    // fetch request
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:[Grupo entityName]];
    
    if(predicate) [request setPredicate:predicate];
    
    //ordernar
    NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES];
    [request setSortDescriptors:@[sort]];
    
    // executar request
    NSError *error = nil;
    NSArray *results = [[self context] executeFetchRequest:request error:&error];
    
    
    if (error) {
        NSLog(@"%@", error);
        return nil;
    } else {
        return results;
    }
    
    return nil;
}

-(Grupo*)getGrupo:(NSString*)keyGrupo {
    NSPredicate * predicate = [NSPredicate predicateWithFormat:@"%K == %@", @"key",keyGrupo];
    NSArray * grupos = [self getGruposWithPredicate:predicate];
    if(!grupos || grupos.count == 0){
        return nil;
    } else {
        return grupos[0];
    }
}


#pragma mark - Modelo

-(void)syncModeloWithVeiculo:(Veiculo*)veiculo {
    
    Marca * marca = (Marca*) veiculo.veiculo_marca;
    
    NSString *url = [NSString stringWithFormat:MODELO_URL, marca.id, veiculo.id];
 
    [self getJSON:url withNetworkType:NetworkTypeData onComplete:^(NSDictionary *json) {
        
        for (NSDictionary * property in json) {
            NSEntityDescription * entity = [NSEntityDescription entityForName:[Modelo entityName] inManagedObjectContext:[self context]];
            
            Modelo *modelo = [[Modelo alloc] initWithEntity:entity insertIntoManagedObjectContext:[self context]];
            
            [modelo loadProperties:property];
            [self syncDetailModelo:modelo withVeiculo:veiculo];
            NSSet * modelos = [NSSet setWithObject:modelo];
            [veiculo addVeiculo_modelo:modelos];
        }
        
    }];
}

#pragma mark - Detail Modelo
-(void)syncDetailModelo:(Modelo*)modelo withVeiculo:(Veiculo *)veiculo {
    
    Marca * marca = (Marca*) veiculo.veiculo_marca;
    
    NSString *url = [NSString stringWithFormat:DETAIL_MODELO_URL, marca.id, veiculo.id, modelo.id];
    
    [self getJSON:url withNetworkType:NetworkTypeData onComplete:^(NSDictionary *json) {
        [modelo loadDetailProperties:json];
    }];
}

#pragma mark - CoreData


-(AppDelegate *)appDelegate {
    AppDelegate *result = [[UIApplication sharedApplication] delegate];
    return result;
}

-(NSManagedObjectContext *)context {
    NSManagedObjectContext *result = [[self appDelegate] managedObjectContext];
    return result;
}

@end
