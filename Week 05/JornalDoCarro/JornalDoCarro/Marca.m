//
//  Marca.m
//  JornalDoCarro
//
//  Created by Rafael Reis Achcar Zanin on 21/09/15.
//  Copyright © 2015 Rafael Reis Achcar Zanin. All rights reserved.
//

#import "Marca.h"
#import "Veiculo.h"

@implementation Marca

-(void)loadProperties:(NSDictionary *)json {
    self.name = json[@"name"];
    self.fipe_name = json[@"fipe_name"];
    self.order = @([json[@"order"] integerValue]);
    self.key = json[@"key"];
    self.id = @([json[@"id"] integerValue]);
}

-(BOOL)status {
    
    BOOL result = self.status_sync;
    
    if(result){
        NSDate *dataAtual = [NSDate date];
        NSDate *data = [self.date_sync dateByAddingTimeInterval:60*60*24];
        NSComparisonResult compare = [dataAtual compare:data];
       
        result = (compare == NSOrderedAscending);
    }
    
    return result;
}

-(NSInteger)totalModelos {
    
    
    NSArray<Veiculo*> * array = self.marca_veiculo.allObjects;
    NSInteger result = 0;
    
    for (Veiculo * veiculo in array) {
        
        result+=veiculo.veiculo_modelo.count;
        
    }
    return result;
}

-(NSString *)dataSyncFormatada {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"dd/MM/yyyy HH:mm"];
    if (self.date_sync) {
        return [formatter stringFromDate:self.date_sync];
    }
    
    return @"";
}

+(NSString *)entityName {
    return @"Marca";
}

@end
