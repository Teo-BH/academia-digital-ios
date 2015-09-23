//
//  Veiculo.h
//  JornalDoCarro
//
//  Created by Rafael Reis Achcar Zanin on 21/09/15.
//  Copyright © 2015 Rafael Reis Achcar Zanin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

NS_ASSUME_NONNULL_BEGIN

@interface Veiculo : NSManagedObject

+(NSString *)entityName;
-(void)loadProperties:(NSDictionary *)json;

@end

NS_ASSUME_NONNULL_END

#import "Veiculo+CoreDataProperties.h"
