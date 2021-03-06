//
//  StarWarAPI.h
//  StarWarsFanBoy
//
//  Created by Teobaldo Mauro de Moura on 9/16/15.
//  Copyright © 2015 Teobaldo Mauro de Moura. All rights reserved.
//

#import "EntityMetadata.h"
#import "AttributeMetadata.h"
#import "ModelBase.h"

@protocol StarWarAPI <NSObject>

-(NSArray<EntityMetadata *> *)getEntities;
-(ModelBase *) allocByEntityName:(NSString *)entityName;

-(NSArray *)getEntity:(NSString *)entityName;
-(NSArray *)getEntity:(NSString *)entityName withPage:(NSInteger)page;



@end