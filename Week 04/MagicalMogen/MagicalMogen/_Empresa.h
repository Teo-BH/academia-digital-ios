// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Empresa.h instead.

@import CoreData;

extern const struct EmpresaAttributes {
	__unsafe_unretained NSString *cnpj;
	__unsafe_unretained NSString *nameFantasia;
} EmpresaAttributes;

extern const struct EmpresaRelationships {
	__unsafe_unretained NSString *empregador;
} EmpresaRelationships;

@class Pessoa;

@interface EmpresaID : NSManagedObjectID {}
@end

@interface _Empresa : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) EmpresaID* objectID;

@property (nonatomic, strong) NSNumber* cnpj;

@property (atomic) int64_t cnpjValue;
- (int64_t)cnpjValue;
- (void)setCnpjValue:(int64_t)value_;

//- (BOOL)validateCnpj:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* nameFantasia;

//- (BOOL)validateNameFantasia:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSSet *empregador;

- (NSMutableSet*)empregadorSet;

@end

@interface _Empresa (EmpregadorCoreDataGeneratedAccessors)
- (void)addEmpregador:(NSSet*)value_;
- (void)removeEmpregador:(NSSet*)value_;
- (void)addEmpregadorObject:(Pessoa*)value_;
- (void)removeEmpregadorObject:(Pessoa*)value_;

@end

@interface _Empresa (CoreDataGeneratedPrimitiveAccessors)

- (NSNumber*)primitiveCnpj;
- (void)setPrimitiveCnpj:(NSNumber*)value;

- (int64_t)primitiveCnpjValue;
- (void)setPrimitiveCnpjValue:(int64_t)value_;

- (NSString*)primitiveNameFantasia;
- (void)setPrimitiveNameFantasia:(NSString*)value;

- (NSMutableSet*)primitiveEmpregador;
- (void)setPrimitiveEmpregador:(NSMutableSet*)value;

@end
