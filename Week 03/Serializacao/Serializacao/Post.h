//
//  Post.h
//  Serializacao
//
//  Created by Teobaldo Mauro de Moura on 9/4/15.
//  Copyright © 2015 Teobaldo Mauro de Moura. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Post : NSObject <NSCoding>

@property (copy) NSString *titulo;
@property (copy) NSString *conteudo;
@property (copy) NSDate *data;

@end
