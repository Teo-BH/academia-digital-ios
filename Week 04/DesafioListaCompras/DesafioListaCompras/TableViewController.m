//
//  TableViewController.m
//  DesafioListaCompras
//
//  Created by Teobaldo Mauro de Moura on 9/11/15.
//  Copyright © 2015 Teobaldo Mauro de Moura. All rights reserved.
//

#import "TableViewController.h"
#import <CoreData/CoreData.h>
#import "AppDelegate.h"
#import "Product.h"

#define CELL_ID @"CellID"

@interface TableViewController ()

@property (weak, nonatomic) AppDelegate *appDelegate;
@property (weak, nonatomic) NSManagedObjectContext *context;

@property (strong, nonatomic) NSMutableArray<Product *> *products;

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Configura o contexto
    [self defineContext];
    // Carrega os dados
    NSArray *products = [self getData];
    [self setProducts:[products mutableCopy]];
}

#pragma mark - CoreData

-(void)defineContext {
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    [self setAppDelegate:appDelegate];
    [self setContext:[appDelegate managedObjectContext]];
}

-(NSArray<Product *> *)getData {
    NSString *entityName = [Product entityName];
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:entityName];
    
    NSError *error = nil;
    NSArray<Product *> *results = [self.context executeFetchRequest:request
                                                              error:&error];
    
    if (error)
        return nil;
    else
        return results;
}

-(BOOL)addData:(NSString *)productName {
    // Prepara o contexto
    NSString *entityName = [Product entityName];
    NSEntityDescription *entity = [NSEntityDescription entityForName:entityName
                                              inManagedObjectContext:self.context];
    
    // Cria a entidade
    Product *product = [[Product alloc] initWithEntity:entity insertIntoManagedObjectContext:self.context];
    product.name = productName;
    
    
    // Salva os dados
    NSError *error = nil;
    BOOL result = [self.context save:&error];
    
    // Adiciona a array
    if (result) {
        [[self products] addObject:product];
    }
    // retorna o resultado
    return result;
}

-(BOOL)removeData:(NSInteger)index {
    // Remove do contexto
    Product *product = [[self products] objectAtIndex:index];
    [[self products] removeObject:product];
    [self.context deleteObject:product];
    
    // Salva os dados
    NSError *error = nil;
    BOOL result = [self.context save:&error];
    
    // retorna o resultado
    return result;
}

-(BOOL)modifyData:(NSInteger)index withProductName:(NSString *)productName {
    // Altera os dados
    Product *product = [[self products] objectAtIndex:index];
    product.name = productName;

    // Salva os dados
    NSError *error = nil;
    BOOL result = [self.context save:&error];
    
    // retorna o resultado
    return result;
}

#pragma mark - Actions

- (IBAction)addTouched:(UIBarButtonItem *)sender {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Adicionar item"
                                                                   message:@"Digite o nome do produto"
                                                            preferredStyle:UIAlertControllerStyleAlert];
    [alert addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        [textField setPlaceholder:@"Nome do Produto"];
    }];
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK"
                                                       style:UIAlertActionStyleCancel
                                                     handler:^(UIAlertAction *action) {
                                                         // Obtém os dados
                                                         UITextField *nameTextField = [[alert textFields] firstObject];
                                                         NSString *productName = [nameTextField text];
                                                         // Insere no CoreData
                                                         [self addData:productName];
                                                         // Atualiza TableView
                                                         [[self tableView] reloadData];
                                                     }];
    [alert addAction:okAction];
    
    [self presentViewController:alert animated:YES completion:nil];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[self products] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CELL_ID forIndexPath:indexPath];
    
    // Configure the cell...
    Product *product = [[self products] objectAtIndex:[indexPath row]];
    [[cell textLabel] setText:[product name]];
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

-(NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewRowAction *editAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault
                                                                          title:@"Editar"
                                                                        handler:^(UITableViewRowAction *action, NSIndexPath *indexPath)
    {
        // Diálogo
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Editar produto"
                                                                       message:@"Digite o nome do produto"
                                                                preferredStyle:UIAlertControllerStyleAlert];
        [alert addTextFieldWithConfigurationHandler:^(UITextField *textField) {
            [textField setPlaceholder:@"Nome do produto"];
            Product *product = [[self products] objectAtIndex:[indexPath row]];
            [textField setText:[product name]];
        }];
        
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK"
                                                           style:UIAlertActionStyleCancel
                                                         handler:^(UIAlertAction *action)
                                   {
                                       // obtém o dado digitado
                                       UITextField *textField = [[alert textFields] firstObject];
                                       // Atualiza CoreData
                                       BOOL result = [self modifyData:[indexPath row] withProductName:[textField text]];
                                       // atualiza tableView
                                       if (result) {
                                           [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
                                       }
                                   }];
        
        [alert addAction:okAction];
                                                                            
        [self presentViewController:alert animated:YES completion:nil];
        
    }];
    
    UITableViewRowAction *deleteAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault
                                                                            title:@"Deletar"
                                                                          handler:^(UITableViewRowAction *action, NSIndexPath *indexPath) {
                                                                              // Remove dCoreData
                                                                              BOOL result = [self removeData:[indexPath row]];
                                                                              
                                                                              // Remove do TableView
                                                                              if (result) {
                                                                                  [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
                                                                              }
                                                                          }];
    
    return @[ editAction, deleteAction ];
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath { }

@end
