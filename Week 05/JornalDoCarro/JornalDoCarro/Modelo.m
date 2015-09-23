//
//  Modelo.m
//  JornalDoCarro
//
//  Created by Rafael Reis Achcar Zanin on 21/09/15.
//  Copyright © 2015 Rafael Reis Achcar Zanin. All rights reserved.
//

#import "Modelo.h"
#import "Veiculo.h"

@implementation Modelo


-(void)loadProperties:(NSDictionary *)json {

    self.fipe_marca = json[@"fipe_marca"];
    self.fipe_codigo = json[@"fipe_codigo"];
    self.name = json[@"name"];
    self.marca = json[@"marca"];
    self.key = json[@"key"];
    self.veiculo =json[@"veiculo"];
    self.id = json[@"id"];
    
}

-(void)loadDetailProperties:(NSDictionary *)json {
    
    self.combustivel = json[@"combustivel"];
    self.ano_modelo = json[@"ano_modelo"];
    self.referencia = json[@"referencia"];
    self.preco =json[@"preco"];
    
}

-(NSString *)description {
    return self.name;
}

+(NSString *)entityName {
    return @"Modelo";
}
@end
