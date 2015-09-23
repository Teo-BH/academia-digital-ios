//
//  Acesso+CoreDataProperties.h
//  JornalDoCarro
//
//  Created by Rafael Reis Achcar Zanin on 22/09/15.
//  Copyright © 2015 Rafael Reis Achcar Zanin. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Acesso.h"

NS_ASSUME_NONNULL_BEGIN

@interface Acesso (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *id_marca;
@property (nullable, nonatomic, retain) NSString *id_grupo;
@property (nullable, nonatomic, retain) NSNumber *qtde_acesso;

@end

NS_ASSUME_NONNULL_END
