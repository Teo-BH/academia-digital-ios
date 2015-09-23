//
//  Grupo+CoreDataProperties.h
//  JornalDoCarro
//
//  Created by Rafael Reis Achcar Zanin on 21/09/15.
//  Copyright © 2015 Rafael Reis Achcar Zanin. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Grupo.h"

NS_ASSUME_NONNULL_BEGIN

@interface Grupo (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) NSString *key;
@property (nullable, nonatomic, retain) NSString *fipe_marca;
@property (nullable, nonatomic, retain) NSNumber *id_marca;
@property (nullable, nonatomic, retain) NSDate *date_last_access;
@property (nullable, nonatomic, retain) NSSet<Veiculo *> *grupo_veiculo;

@end

@interface Grupo (CoreDataGeneratedAccessors)

- (void)addGrupo_veiculoObject:(Veiculo *)value;
- (void)removeGrupo_veiculoObject:(Veiculo *)value;
- (void)addGrupo_veiculo:(NSSet<Veiculo *> *)values;
- (void)removeGrupo_veiculo:(NSSet<Veiculo *> *)values;

@end

NS_ASSUME_NONNULL_END
