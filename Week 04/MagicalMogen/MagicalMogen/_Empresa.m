// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Empresa.m instead.

#import "_Empresa.h"

const struct EmpresaAttributes EmpresaAttributes = {
	.cnpj = @"cnpj",
	.nameFantasia = @"nameFantasia",
};

const struct EmpresaRelationships EmpresaRelationships = {
	.empregador = @"empregador",
};

@implementation EmpresaID
@end

@implementation _Empresa

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Empresa" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Empresa";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Empresa" inManagedObjectContext:moc_];
}

- (EmpresaID*)objectID {
	return (EmpresaID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	if ([key isEqualToString:@"cnpjValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"cnpj"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}

@dynamic cnpj;

- (int64_t)cnpjValue {
	NSNumber *result = [self cnpj];
	return [result longLongValue];
}

- (void)setCnpjValue:(int64_t)value_ {
	[self setCnpj:@(value_)];
}

- (int64_t)primitiveCnpjValue {
	NSNumber *result = [self primitiveCnpj];
	return [result longLongValue];
}

- (void)setPrimitiveCnpjValue:(int64_t)value_ {
	[self setPrimitiveCnpj:@(value_)];
}

@dynamic nameFantasia;

@dynamic empregador;

- (NSMutableSet*)empregadorSet {
	[self willAccessValueForKey:@"empregador"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"empregador"];

	[self didAccessValueForKey:@"empregador"];
	return result;
}

@end

