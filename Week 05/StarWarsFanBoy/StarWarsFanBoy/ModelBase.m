//
//  ModelBase.m
//  StarWarsFanBoy
//
//  Created by Teobaldo Mauro de Moura on 9/16/15.
//  Copyright © 2015 Teobaldo Mauro de Moura. All rights reserved.
//

#import "ModelBase.h"
#import "NSString+Extension.h"
#import <CoreData/CoreData.h>
#import "AppDelegate.h"
#import "UserAccess+CoreDataProperties.h"

@interface ModelBase (UserAccess)

-(NSDate *)getAccessDateWithEntityName:(NSString *)entityName withUrl:(NSString *)url;
-(void)setAccessDateWithEntityName:(NSString *)entityName withUrl:(NSString *)url withDate:(NSDate *)date;

// CoreData Properties
@property (readonly) AppDelegate *appDelegate;
@property (readonly) NSManagedObjectContext *context;

@end

@implementation ModelBase {
    NSString *_description;
}

- (instancetype)init
{
    return [self initWithDictionary:nil];
}

- (instancetype)initWithDictionary:(NSDictionary *)properties
{
    return [self initWithDictionary:properties withDescriptionName:nil];
}

- (instancetype)initWithDictionary:(NSDictionary *)properties withDescriptionName:(NSString *)descriptionName {
    self = [super init];
    if (self && properties) {
        // Propriedades comuns
        _created = [properties[@"created"] jsonDateValue];
        _edited = [properties[@"edited"] jsonDateValue];
        _url = [NSURL URLWithString:properties[@"url"]];
        
        // Description
        if (descriptionName) {
            _description = properties[descriptionName];
        }
    }
    return self;
}

-(NSString *)description {
    return _description;
}

-(NSDate *)lastAccess {
    NSString *entityName = NSStringFromClass([self class]);
    return [self getAccessDateWithEntityName:entityName
                                     withUrl:self.url.absoluteString];
}
-(void)setLastAccess:(NSDate *)date {
    NSString *entityName = NSStringFromClass([self class]);
    [self setAccessDateWithEntityName:entityName
                              withUrl:self.url.absoluteString
                             withDate:date];
}

@end

@implementation ModelBase (UserAccess)

-(AppDelegate *)appDelegate {
    AppDelegate *result = [[UIApplication sharedApplication] delegate];
    return result;
}

-(NSManagedObjectContext *)context {
    NSManagedObjectContext *result = [[self appDelegate] managedObjectContext];
    return result;
}

-(UserAccess *)getUserAccessWithEntityName:(NSString *)entityName withUrl:(NSString *)url {
    // fetch request
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"UserAccess"];
    
    // filtro
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"%K == %@ AND %K == %@", @"entityname", entityName, @"url", url];
    [request setPredicate:predicate];
    
    // 5: executar request
    NSError *error = nil;
    NSArray *results = [self.context executeFetchRequest:request error:&error];
    
    if (error) {
        NSLog(@"%@", error);
        return nil;
    } else {
        if (results && results.count == 1) {
            return results[0];
        } else {
            return nil;
        }
    }
}

-(NSDate *)getAccessDateWithEntityName:(NSString *)entityName withUrl:(NSString *)url {
    UserAccess *record = [self getUserAccessWithEntityName:entityName withUrl:url];
    NSDate *result = record ? record.accessdate : nil;
    return result;
}

-(void)setAccessDateWithEntityName:(NSString *)entityName withUrl:(NSString *)url withDate:(NSDate *)date {
    UserAccess *record = [self getUserAccessWithEntityName:entityName withUrl:url];
    if (!record) {
        // Entidade
        NSEntityDescription *entidade = [NSEntityDescription entityForName:@"UserAccess" inManagedObjectContext:self.context];
        // New Record
        record = [[UserAccess alloc] initWithEntity:entidade insertIntoManagedObjectContext:self.context];
        // Valores defaults
        record.entityname = entityName;
        record.url = url;
    }
    
    // Atualiza Data
    record.accessdate = date;
    
    // Salva os dados
    [self.appDelegate saveContext];
}

@end
