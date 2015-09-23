//
//  Marca+CoreDataProperties.h
//  JornalDoCarro
//
//  Created by Rafael Reis Achcar Zanin on 21/09/15.
//  Copyright © 2015 Rafael Reis Achcar Zanin. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Marca.h"

NS_ASSUME_NONNULL_BEGIN

@interface Marca (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) NSString *fipe_name;
@property (nullable, nonatomic, retain) NSNumber *order;
@property (nullable, nonatomic, retain) NSString *key;
@property (nullable, nonatomic, retain) NSNumber *id;
@property (nullable, nonatomic, retain) NSNumber *status_sync;
@property (nullable, nonatomic, retain) NSDate *date_sync;
@property (nullable, nonatomic, retain) NSDate *date_last_access;
@property (nullable, nonatomic, retain) NSSet<Veiculo *> *marca_veiculo;

@end

@interface Marca (CoreDataGeneratedAccessors)

- (void)addMarca_veiculoObject:(Veiculo *)value;
- (void)removeMarca_veiculoObject:(Veiculo *)value;
- (void)addMarca_veiculo:(NSSet<Veiculo *> *)values;
- (void)removeMarca_veiculo:(NSSet<Veiculo *> *)values;

@end

NS_ASSUME_NONNULL_END
