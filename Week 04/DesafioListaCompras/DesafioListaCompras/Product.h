//
//  Product.h
//  DesafioListaCompras
//
//  Created by Teobaldo Mauro de Moura on 9/11/15.
//  Copyright © 2015 Teobaldo Mauro de Moura. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

NS_ASSUME_NONNULL_BEGIN

@interface Product : NSManagedObject

+(NSString *)entityName;

@end

NS_ASSUME_NONNULL_END

#import "Product+CoreDataProperties.h"
