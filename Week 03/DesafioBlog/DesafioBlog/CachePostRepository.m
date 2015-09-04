//
//  CachePostRepository.m
//  DesafioBlog
//
//  Created by Teobaldo Mauro de Moura on 9/4/15.
//  Copyright © 2015 Teobaldo Mauro de Moura. All rights reserved.
//

#import "CachePostRepository.h"

@implementation CachePostRepository


+(NSString *)pathForCache:(NSString *)filename {
    // Define a pasta do cache
    NSArray *diretorios = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *path = diretorios[0];

    // Define o nome do arquivo
    NSString *result = [path stringByAppendingPathComponent:filename];
    
    return result;
}

+(NSArray *)getAll {
    NSString *fileName = [self pathForCache:@"getAll"];
    BOOL fileExists = [[NSFileManager defaultManager] fileExistsAtPath:fileName];
    if (fileExists) {
        NSArray *result = [NSKeyedUnarchiver unarchiveObjectWithFile:fileName];
        return result;
    } else {
        return nil;
    }
}

+(void)saveAll:(NSArray *)data {
    NSString *fileName = [self pathForCache:@"getAll"];
    BOOL status = [NSKeyedArchiver archiveRootObject:data toFile:fileName];
    if (!status) {
        NSLog(@"Falha ao salvar o cache do serviço: getAll");
    }
}

+(NSArray *)getCommentsWithPost:(NSUInteger)postId {
    NSString *key = [NSString stringWithFormat:@"getCommentsWithPost_%lu", postId];
    NSString *fileName = [self pathForCache:key];
    BOOL fileExists = [[NSFileManager defaultManager] fileExistsAtPath:fileName];
    if (fileExists) {
        NSArray *result = [NSKeyedUnarchiver unarchiveObjectWithFile:fileName];
        return result;
    } else {
        return nil;
    }
}

+(void)saveCommentsWithPost:(NSArray *)data withPostId:(NSUInteger)postId {
    NSString *key = [NSString stringWithFormat:@"getCommentsWithPost_%lu", postId];
    NSString *fileName = [self pathForCache:key];
    BOOL status = [NSKeyedArchiver archiveRootObject:data toFile:fileName];
    if (!status) {
        NSLog(@"Falha ao salvar o cache do serviço: getCommentsWithPost");
    }
}

@end
