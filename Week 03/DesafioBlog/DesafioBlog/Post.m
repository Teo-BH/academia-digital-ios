//
//  Post.m
//  DesafioBlog
//
//  Created by Teobaldo Mauro de Moura on 9/4/15.
//  Copyright © 2015 Teobaldo Mauro de Moura. All rights reserved.
//

#import "Post.h"

@implementation Post

- (instancetype)init
{
    return [self initWithDictionary:nil];
}

- (instancetype)initWithDictionary:(NSDictionary *)properties
{
    self = [super init];
    if (self && properties) {
        _postId = [[properties objectForKey:@"id"] integerValue];
        _userId = [[properties objectForKey:@"userId"] integerValue];
        _title = [properties objectForKey:@"title"];
        _body = [properties objectForKey:@"body"];
    }
    return self;
}

#pragma mark - NSCoding

-(instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self) {
        _postId = [[aDecoder decodeObjectForKey:@"Post_postId"] integerValue];
        _userId = [[aDecoder decodeObjectForKey:@"Post_userId"] integerValue];
        _title = [[aDecoder decodeObjectForKey:@"Post_title"] copy];
        _body = [[aDecoder decodeObjectForKey:@"Post_body"] copy];
    }
    return self;
}

-(void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:@([self postId]) forKey:@"Post_postId"];
    [aCoder encodeObject:@([self userId]) forKey:@"Post_userId"];
    [aCoder encodeObject:[self title] forKey:@"Post_title"];
    [aCoder encodeObject:[self body] forKey:@"Post_body"];
}

@end
