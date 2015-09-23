//
//  AcessoHelper.h
//  JornalDoCarro
//
//  Created by Rafael Reis Achcar Zanin on 22/09/15.
//  Copyright © 2015 Rafael Reis Achcar Zanin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Acesso.h"

@interface AcessoHelper : NSObject
+ (NSDictionary *)pesquisarAcessosMarca;
+ (NSDictionary *)pesquisarAcessosGrupo:(NSString *)idMarca;
+ (Acesso *)pesquisarAcesso:(NSString *)idMarca withGrupo:(NSString *)idGrupo;
+ (void)computarAcessoMarca:(NSString *)idMarca;
+ (void)computarAcessoGrupo:(NSString *)idGrupo withMarca:(NSString *)idMarca;
@end
