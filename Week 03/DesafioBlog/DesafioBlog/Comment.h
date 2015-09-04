//
//  Comment.h
//  DesafioBlog
//
//  Created by Teobaldo Mauro de Moura on 9/4/15.
//  Copyright © 2015 Teobaldo Mauro de Moura. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Comment : NSObject <NSCoding>

@property (nonatomic) NSUInteger commentId;
@property (nonatomic) NSUInteger postId;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *email;
@property (strong, nonatomic) NSString *body;

- (instancetype)initWithDictionary:(NSDictionary *)properties;

@end
