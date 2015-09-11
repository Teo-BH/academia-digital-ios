//
//  Empresa+CoreDataProperties.h
//  CoreData
//
//  Created by Teobaldo Mauro de Moura on 9/11/15.
//  Copyright © 2015 Teobaldo Mauro de Moura. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Empresa.h"

NS_ASSUME_NONNULL_BEGIN

@interface Empresa (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *nomeFantasia;
@property (nullable, nonatomic, retain) NSSet<NSManagedObject *> *funcionarios;

@end

@interface Empresa (CoreDataGeneratedAccessors)

- (void)addFuncionariosObject:(NSManagedObject *)value;
- (void)removeFuncionariosObject:(NSManagedObject *)value;
- (void)addFuncionarios:(NSSet<NSManagedObject *> *)values;
- (void)removeFuncionarios:(NSSet<NSManagedObject *> *)values;

@end

NS_ASSUME_NONNULL_END
