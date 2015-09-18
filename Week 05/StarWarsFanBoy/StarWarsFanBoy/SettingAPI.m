//
//  SettingAPI.m
//  StarWarsFanBoy
//
//  Created by Teobaldo Mauro de Moura on 9/17/15.
//  Copyright © 2015 Teobaldo Mauro de Moura. All rights reserved.
//

#import "SettingAPI.h"

@implementation SettingAPI

+(NSArray *)getActiveSetting:(NSString *)entityName {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *preferenceName = [self preferenceName:entityName];
    NSArray *result = [userDefaults objectForKey:preferenceName];
    return  result;
}

+(BOOL)saveActiveSetting:(NSArray *)settings withEntityName:(NSString *)entityName {
    // Escreve as Preferências
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *preferenceName = [self preferenceName:entityName];
    [userDefaults setObject:settings forKey:preferenceName];
    
    // Força a atualização
    BOOL status = [userDefaults synchronize];
    return status;
}

+(NSString *)preferenceName:(NSString *)entityName {
    return [NSString stringWithFormat:@"%@_preference", entityName];
}

@end
