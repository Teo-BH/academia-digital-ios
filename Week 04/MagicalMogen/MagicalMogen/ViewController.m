//
//  ViewController.m
//  MagicalMogen
//
//  Created by Teobaldo Mauro de Moura on 9/11/15.
//  Copyright © 2015 Teobaldo Mauro de Moura. All rights reserved.
//

#import "ViewController.h"
#import <MagicalRecord/MagicalRecord.h>
#import "Pessoa.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Incluindo Pessoas
    [MagicalRecord saveWithBlock:^(NSManagedObjectContext *localContext) {
        Pessoa *pessoa = [Pessoa MR_createEntityInContext:localContext];
        pessoa.name = @"João";
        
     }];
    
    // Lista de Pessoas
    NSArray *pessoas = [Pessoa MR_findAll];

#pragma unused (pessoas)
    
    // Lista de Pessoas com contexto
    [MagicalRecord saveWithBlock:^(NSManagedObjectContext *localContext) {
        //NSArray *pessoas = [Pessoa MR_findAll]; // NUNCA USE => falha de contexto
        NSArray *pessoas = [Pessoa MR_findAllInContext:localContext]; // Passe o contexto
        // ...
#pragma unused (pessoas)
    }];
    
    // Seleciona uma Pessoa
    NSArray *find = [Pessoa MR_findByAttribute:PessoaAttributes.name withValue:@"João"];
#pragma unused (find)
    
    // Seleciona ou Cria uma Pessoa
    Pessoa *p = [Pessoa MR_findFirstOrCreateByAttribute:PessoaAttributes.name withValue:@"João"];
#pragma unused (p)
    
    // Incluindo Pessao com callback
    [MagicalRecord saveWithBlock:^(NSManagedObjectContext *localContext) {
        Pessoa *pessoa = [Pessoa MR_findFirstOrCreateByAttribute:PessoaAttributes.name withValue:@"Maria"
                                                       inContext:localContext];
        pessoa.name = @"Maria";
    } completion:^(BOOL contextDidSave, NSError *error) {
        NSLog(@"%@", [Pessoa MR_findAll]);
    }];
    
}

@end
