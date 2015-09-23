//
//  SyncAPI.h
//  JornalDoCarro
//
//  Created by Rafael Reis Achcar Zanin on 21/09/15.
//  Copyright © 2015 Rafael Reis Achcar Zanin. All rights reserved.
//

@class Marca;
@protocol SyncAPI

-(void)syncMarcasWithComplete:(void (^)(void))successBlock;
-(NSArray<Marca*>*)getMarcas;

-(void)syncMarcaWithId:(NSNumber*)idMarca withComplete:(void(^)(void))successBlock;

@end