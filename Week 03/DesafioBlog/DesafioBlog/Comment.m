//
//  Comment.m
//  DesafioBlog
//
//  Created by Teobaldo Mauro de Moura on 9/4/15.
//  Copyright © 2015 Teobaldo Mauro de Moura. All rights reserved.
//

#import "Comment.h"

@implementation Comment

- (instancetype)init
{
    return [self initWithDictionary:nil];
}

- (instancetype)initWithDictionary:(NSDictionary *)properties
{
    self = [super init];
    if (self && properties) {
        _commentId = [[properties objectForKey:@"id"] integerValue];
        _postId = [[properties objectForKey:@"postId"] integerValue];
        _name = [properties objectForKey:@"name"];
        _email = [properties objectForKey:@"email"];
        _body = [properties objectForKey:@"body"];
    }
    return self;
}

#pragma mark - NSCoding

-(instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self) {
        _commentId = [[aDecoder decodeObjectForKey:@"Post_commendId"] integerValue];
        _postId = [[aDecoder decodeObjectForKey:@"Post_postId"] integerValue];
        _name = [[aDecoder decodeObjectForKey:@"Post_name"] copy];
        _email = [[aDecoder decodeObjectForKey:@"Post_email"] copy];
        _body = [[aDecoder decodeObjectForKey:@"Post_body"] copy];
    }
    return self;
}

-(void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:@([self commentId]) forKey:@"Post_commendId"];
    [aCoder encodeObject:@([self postId]) forKey:@"Post_postId"];
    [aCoder encodeObject:[self name] forKey:@"Post_name"];
    [aCoder encodeObject:[self email] forKey:@"Post_email"];
    [aCoder encodeObject:[self body] forKey:@"Post_body"];
}

@end
