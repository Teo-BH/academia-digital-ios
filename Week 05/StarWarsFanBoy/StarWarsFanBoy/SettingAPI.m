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
    // Define o caminho - Documents
    NSString *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    NSString *fileName = [NSString stringWithFormat:@"%@-setting", entityName];
    path = [path stringByAppendingPathComponent:fileName];
    
    if ([[NSFileManager defaultManager] fileExistsAtPath:path]) {
        // Deserializando
        NSData *dataBin = [NSData dataWithContentsOfFile:path];
        NSArray *result = [NSKeyedUnarchiver unarchiveObjectWithData:dataBin];
        return result;
    } else {
        return nil;
    }
}

+(BOOL)saveActiveSetting:(NSArray *)settings withEntityName:(NSString *)entityName {
    // Define o caminho - Documents
    NSString *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    NSString *fileName = [NSString stringWithFormat:@"%@-setting", entityName];
    path = [path stringByAppendingPathComponent:fileName];
    
    // Serialização para arquivo
    BOOL result = [NSKeyedArchiver archiveRootObject:settings toFile:path];
    return result;
}


@end
