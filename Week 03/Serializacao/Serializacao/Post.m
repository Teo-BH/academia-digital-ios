//
//  Post.m
//  Serializacao
//
//  Created by Teobaldo Mauro de Moura on 9/4/15.
//  Copyright © 2015 Teobaldo Mauro de Moura. All rights reserved.
//

#import "Post.h"

#define TITULO_KEY @"Post_titulo"
#define CONTEUDO_KEY @"Post_conteudo"
#define DATA_KEY @"Post_data"

@implementation Post

// Inicialização designado - requer toda inicialização
-(instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self) {
        _titulo = [[aDecoder decodeObjectForKey:TITULO_KEY] copy];
        _conteudo = [[aDecoder decodeObjectForKey:CONTEUDO_KEY] copy];
        _data = [[aDecoder decodeObjectForKey:DATA_KEY] copy];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:[self titulo] forKey:TITULO_KEY];
    [aCoder encodeObject:[self conteudo] forKey:CONTEUDO_KEY];
    [aCoder encodeObject:[self data] forKey:DATA_KEY];
}

@end
