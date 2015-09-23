//
//  Modelo+CoreDataProperties.h
//  JornalDoCarro
//
//  Created by Rafael Reis Achcar Zanin on 22/09/15.
//  Copyright © 2015 Rafael Reis Achcar Zanin. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Modelo.h"

NS_ASSUME_NONNULL_BEGIN

@interface Modelo (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *fipe_codigo;
@property (nullable, nonatomic, retain) NSString *fipe_marca;
@property (nullable, nonatomic, retain) NSString *id;
@property (nullable, nonatomic, retain) NSString *key;
@property (nullable, nonatomic, retain) NSString *marca;
@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) NSString *veiculo;
@property (nullable, nonatomic, retain) NSString *combustivel;
@property (nullable, nonatomic, retain) NSString *ano_modelo;
@property (nullable, nonatomic, retain) NSString *preco;
@property (nullable, nonatomic, retain) NSString *referencia;
@property (nullable, nonatomic, retain) Veiculo *modelo_veiculo;

@end

NS_ASSUME_NONNULL_END
