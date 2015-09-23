//
//  Veiculo+CoreDataProperties.h
//  JornalDoCarro
//
//  Created by Rafael Reis Achcar Zanin on 21/09/15.
//  Copyright © 2015 Rafael Reis Achcar Zanin. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Veiculo.h"

NS_ASSUME_NONNULL_BEGIN

@interface Veiculo (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *fipe_marca;
@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) NSString *marca;
@property (nullable, nonatomic, retain) NSString *key;
@property (nullable, nonatomic, retain) NSString *id;
@property (nullable, nonatomic, retain) NSString *fipe_name;
@property (nullable, nonatomic, retain) NSString *key_grupo;
@property (nullable, nonatomic, retain) NSManagedObject *veiculo_marca;
@property (nullable, nonatomic, retain) NSSet<NSManagedObject *> *veiculo_modelo;
@property (nullable, nonatomic, retain) NSManagedObject *veiculo_grupo;

@end

@interface Veiculo (CoreDataGeneratedAccessors)

- (void)addVeiculo_modeloObject:(NSManagedObject *)value;
- (void)removeVeiculo_modeloObject:(NSManagedObject *)value;
- (void)addVeiculo_modelo:(NSSet<NSManagedObject *> *)values;
- (void)removeVeiculo_modelo:(NSSet<NSManagedObject *> *)values;

@end

NS_ASSUME_NONNULL_END
