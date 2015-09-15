// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Pessoa.h instead.

@import CoreData;

extern const struct PessoaAttributes {
	__unsafe_unretained NSString *name;
} PessoaAttributes;

extern const struct PessoaRelationships {
	__unsafe_unretained NSString *funcionario;
} PessoaRelationships;

@class Empresa;

@interface PessoaID : NSManagedObjectID {}
@end

@interface _Pessoa : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) PessoaID* objectID;

@property (nonatomic, strong) NSString* name;

//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) Empresa *funcionario;

//- (BOOL)validateFuncionario:(id*)value_ error:(NSError**)error_;

@end

@interface _Pessoa (CoreDataGeneratedPrimitiveAccessors)

- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;

- (Empresa*)primitiveFuncionario;
- (void)setPrimitiveFuncionario:(Empresa*)value;

@end
