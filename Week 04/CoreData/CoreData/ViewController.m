//
//  ViewController.m
//  CoreData
//
//  Created by Teobaldo Mauro de Moura on 9/11/15.
//  Copyright © 2015 Teobaldo Mauro de Moura. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import <CoreData/CoreData.h>
#import "Pessoa.h"

@interface ViewController ()

// só salva o AppDelegate para usar o -saveContext
// usando o tratamento de erro contido no método
@property (weak, nonatomic) AppDelegate *appDelegate;

// essas props são 'weak' porque já estão retidas por outras classes
@property (weak, nonatomic) NSManagedObjectContext *context;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    [self setAppDelegate:appDelegate];
    [self setContext:[appDelegate managedObjectContext]];
    
    // wait 1 second
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self inserindoObjetos];
        
        // wait 2 seconds
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self buscandoObjetos];
            [self encontrandoPessoa];
        });
    });
    
}

-(void)exemploAcesso {
    
#pragma mark - Manipulando objetos sem SubClasse
    
    NSManagedObject *pessoa; // fetch
    // leitura
    NSString *nome = [pessoa valueForKey:@"nome"];
    // alteração
    [pessoa setValue:@"João" forKey:@"nome"];
    
#pragma mark - Manipulando objetos com SubClasse
    
    Pessoa *p; // fetch
    NSString *n = p.nome;
    p.nome = @"João";
    
}

-(void)inserindoObjetos {
    // 1: Busca de entidade
    NSEntityDescription *entidade = [NSEntityDescription entityForName:@"Pessoa"
                                                inManagedObjectContext:self.context];
    
    // 2: Criação
    Pessoa *p = [[Pessoa alloc] initWithEntity:entidade
                insertIntoManagedObjectContext:self.context];
    
    // 3: Atribuições
    p.nome = @"João";
    p.idade = @25;
    p.corPreferida = [UIColor greenColor];
    
    // 4: Salvar
    // ou salvamos o contexto (e tratamos o erro)
    //[self.context save:(NSError * _Nullable __autoreleasing * _Nullable)]
    // ou chamamos o -saveContext do AppDelegate
    [self.appDelegate saveContext];
}

-(void)buscandoObjetos {
    // 1: criar fetch request
    NSFetchRequest *request = [[NSFetchRequest alloc]
                               initWithEntityName:@"Pessoa"];
    
    // 2: executar request
    NSError *error = nil;
    NSArray *results = [self.context executeFetchRequest:request
                                                   error:&error];
    
    // 3: ler resultado
    if (error) NSLog(@"%@", error);
    
    for (Pessoa *p in results) {
        NSLog(@"%@", p.nome);
    }
}

-(void)encontrandoPessoa {
    // 1: criar fetch request
    NSFetchRequest *request = [[NSFetchRequest alloc]
                               initWithEntityName:@"Pessoa"];
    // 2: criando predicate
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"%K == %@", @"nome", @"João"];
    [request setPredicate:predicate];
    
    // 3: ordenação
    NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:@"nome" ascending:YES];
    [request setSortDescriptors:@[ sort ]];
    
    // 4: Paginação
    // [request setFetchOffset:0];
    // [request setFetchLimit:20];
    
    // 5: executar request
    NSError *error = nil;
    NSArray *results = [self.context executeFetchRequest:request
                                                   error:&error];
    
    // 6: ler resultado
    if (error) NSLog(@"%@", error);
    
    for (Pessoa *p in results) {
        NSLog(@"%@", p.nome);
    }
}

@end
