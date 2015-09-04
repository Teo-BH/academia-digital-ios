//
//  JsonHelper.m
//  DesafioBlog
//
//  Created by Teobaldo Mauro de Moura on 9/4/15.
//  Copyright © 2015 Teobaldo Mauro de Moura. All rights reserved.
//

#import "PostRepository.h"
#import "WebPostRepository.h"
#import "CachePostRepository.h"

@implementation PostRepository

+(NSArray *)getAll {
    NSArray *result = [CachePostRepository getAll];
    if (!result) {
        result = [WebPostRepository getAll];
        [CachePostRepository saveAll:result];
    }
    return result;
}

+(NSArray *)getCommentsWithPost:(NSUInteger)postId {
    NSArray *result = [CachePostRepository getCommentsWithPost:postId];
    if (!result) {
        result = [WebPostRepository getCommentsWithPost:postId];
        [CachePostRepository saveCommentsWithPost:result withPostId:postId];
    }
    return result;
}

@end
