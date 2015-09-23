//
//  Acesso.h
//  JornalDoCarro
//
//  Created by Rafael Reis Achcar Zanin on 22/09/15.
//  Copyright © 2015 Rafael Reis Achcar Zanin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

NS_ASSUME_NONNULL_BEGIN

@interface Acesso : NSManagedObject

+(NSString *)entityName;

@end

NS_ASSUME_NONNULL_END

#import "Acesso+CoreDataProperties.h"
