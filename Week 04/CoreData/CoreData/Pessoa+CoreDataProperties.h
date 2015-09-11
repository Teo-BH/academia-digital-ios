//
//  Pessoa+CoreDataProperties.h
//  CoreData
//
//  Created by Teobaldo Mauro de Moura on 9/11/15.
//  Copyright © 2015 Teobaldo Mauro de Moura. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Pessoa.h"

NS_ASSUME_NONNULL_BEGIN

@interface Pessoa (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *nome;
@property (nullable, nonatomic, retain) id corPreferida;
@property (nullable, nonatomic, retain) NSNumber *idade;
@property (nullable, nonatomic, retain) Empresa *empregador;

@end

NS_ASSUME_NONNULL_END
