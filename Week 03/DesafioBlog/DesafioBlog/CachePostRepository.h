//
//  CachePostRepository.h
//  DesafioBlog
//
//  Created by Teobaldo Mauro de Moura on 9/4/15.
//  Copyright © 2015 Teobaldo Mauro de Moura. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PostRepositoryProtocol.h"

@interface CachePostRepository : NSObject <PostRepositoryProtocol>

+(void)saveAll:(NSArray *)data;
+(void)saveCommentsWithPost:(NSArray *)data withPostId:(NSUInteger)postId;

@end
