//
//  Post.h
//  DesafioBlog
//
//  Created by Teobaldo Mauro de Moura on 9/4/15.
//  Copyright © 2015 Teobaldo Mauro de Moura. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Post : NSObject <NSCoding>

@property (nonatomic) NSUInteger postId;
@property (nonatomic) NSUInteger userId;
@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *body;

- (instancetype)initWithDictionary:(NSDictionary *)properties;

@end
