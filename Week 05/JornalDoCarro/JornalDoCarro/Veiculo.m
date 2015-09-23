//
//  Veiculo.m
//  JornalDoCarro
//
//  Created by Rafael Reis Achcar Zanin on 21/09/15.
//  Copyright © 2015 Rafael Reis Achcar Zanin. All rights reserved.
//

#import "Veiculo.h"

@implementation Veiculo


-(void)loadProperties:(NSDictionary *)json {
    
    self.fipe_marca = json[@"fipe_marca"];
    self.name = json[@"name"];
    self.marca = json[@"marca"];
    self.key =json[@"key"];
    self.id = json[@"id"];
    self.fipe_name = json[@"fipe_name"];
    
}

+(NSString *)entityName {
    return @"Veiculo";
}

@end
