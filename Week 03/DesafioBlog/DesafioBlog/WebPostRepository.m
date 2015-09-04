//
//  WebPostRepository.m
//  DesafioBlog
//
//  Created by Teobaldo Mauro de Moura on 9/4/15.
//  Copyright © 2015 Teobaldo Mauro de Moura. All rights reserved.
//

#import "WebPostRepository.h"
#import "Post.h"
#import "Comment.h"

#define JSON_POST_URL @"http://jsonplaceholder.typicode.com/posts"
#define JSON_POST_COMMENT_URL @"http://jsonplaceholder.typicode.com/posts/%lu/comments"

@implementation WebPostRepository

+(NSDictionary *)JSONObjectWithUrl:(NSString *)stringUrl {
    NSURL *url = [NSURL URLWithString:stringUrl];
    NSData *data = [NSData dataWithContentsOfURL:url];
    
    NSError *error = nil;
    NSDictionary *result = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
    if (!error) {
        return result;
    } else {
        NSLog(@"Falha na leitura da url '%@', conforme descrito abaixo:\n%@", stringUrl, error);
        return nil;
    }
}

+(NSArray *)getAll {
    NSDictionary *posts = [self JSONObjectWithUrl:JSON_POST_URL];
    if (posts) {
        NSMutableArray *result = [NSMutableArray array];
        for (NSDictionary *post in posts) {
            Post *p = [[Post alloc] initWithDictionary:post];
            [result addObject:p];
        }
        return result;
    } else {
        return nil;
    }
}

+(NSArray *)getCommentsWithPost:(NSUInteger)postId {
    NSString *url = [NSString stringWithFormat:JSON_POST_COMMENT_URL, postId];
    NSDictionary *comments = [self JSONObjectWithUrl:url];
    if (comments) {
        NSMutableArray *result = [NSMutableArray array];
        for (NSDictionary *comment in comments) {
            Comment *c = [[Comment alloc] initWithDictionary:comment];
            [result addObject:c];
        }
        return result;
    } else {
        return nil;
    }
}


@end
