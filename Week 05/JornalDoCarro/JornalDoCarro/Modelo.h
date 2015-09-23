//
//  Modelo.h
//  JornalDoCarro
//
//  Created by Rafael Reis Achcar Zanin on 21/09/15.
//  Copyright © 2015 Rafael Reis Achcar Zanin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Veiculo;

NS_ASSUME_NONNULL_BEGIN

@interface Modelo : NSManagedObject
-(void)loadProperties:(NSDictionary *)json;
-(void)loadDetailProperties:(NSDictionary *)json;
+(NSString *)entityName;
@end

NS_ASSUME_NONNULL_END

#import "Modelo+CoreDataProperties.h"
