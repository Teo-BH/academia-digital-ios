//
//  PostRepositoryProtocol.h
//  DesafioBlog
//
//  Created by Teobaldo Mauro de Moura on 9/4/15.
//  Copyright © 2015 Teobaldo Mauro de Moura. All rights reserved.
//

@protocol PostRepositoryProtocol

+(NSArray *)getAll;
+(NSArray *)getCommentsWithPost:(NSUInteger)postId;

@end
