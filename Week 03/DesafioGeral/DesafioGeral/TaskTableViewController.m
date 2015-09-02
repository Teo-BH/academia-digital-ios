//
//  TaskTableViewController.m
//  DesafioGeral
//
//  Created by Teobaldo Mauro de Moura on 9/2/15.
//  Copyright © 2015 Teobaldo Mauro de Moura. All rights reserved.
//

#import "TaskTableViewController.h"
#import "SecurityHelper.h"

#define CELL_ID @"CellID"

@interface TaskTableViewController ()

@property (weak, nonatomic) IBOutlet UILabel *welcomeLabel;

@end

@implementation TaskTableViewController {
    NSMutableArray *_data;
}

-(void)viewDidLoad {
    [super viewDidLoad];
    
    // Mensagem de bem vindo
    NSString *welcomeText = [NSString stringWithFormat:@"Bem vindo, %@", [SecurityHelper userName]];
    [[self welcomeLabel] setText:welcomeText];
    
    // Inicialização de instâncias
    _data = [NSMutableArray array];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_data count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CELL_ID forIndexPath:indexPath];
    
    NSString *task = [_data objectAtIndex:[indexPath row]];
    [[cell textLabel] setText:task];
    
    return cell;
}

- (IBAction)addTaskTouched:(UIButton *)sender {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Adicionar tarefa"
                                                                   message:@"Digite a descrição da tarefa"
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    [alert addTextFieldWithConfigurationHandler:^(UITextField * textField) {
        // configuração
        [textField setPlaceholder:@"Descrição"];
    }];
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK"
                                                       style:UIAlertActionStyleCancel
                                                     handler:^(UIAlertAction *action) {
                                                         // obtém o dado digitado
                                                         UITextField *nameTextField = [[alert textFields] firstObject];
                                                         // armazena nos dados
                                                         [_data addObject:nameTextField.text];
                                                         // atualiza tableView
                                                         [[self tableView] reloadData];
                                                     }];
    [alert addAction:okAction];
    
    [self presentViewController:alert animated:YES completion:nil];
}

#pragma mark - Edição

-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

-(NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewRowAction *editAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault
                                                                          title:@"Editar"
                                                                        handler:^(UITableViewRowAction *action, NSIndexPath *indexPath) {
                                                                            // Diálogo
                                                                            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Editar tarefa"
                                                                                                                                           message:@"Digite a descrição da tarefa"
                                                                                                                                    preferredStyle:UIAlertControllerStyleAlert];
                                                                            
                                                                            [alert addTextFieldWithConfigurationHandler:^(UITextField * textField) {
                                                                                // configuração
                                                                                [textField setPlaceholder:@"Descrição"];
                                                                                // texto
                                                                                [textField setText:[_data objectAtIndex:[indexPath row]]];
                                                                            }];
                                                                            
                                                                            UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK"
                                                                                                                               style:UIAlertActionStyleCancel
                                                                                                                             handler:^(UIAlertAction *action) {
                                                                                                                                 NSInteger index = [indexPath row];
                                                                                                                                 // obtém o dado digitado
                                                                                                                                 UITextField *nameTextField = [[alert textFields] firstObject];
                                                                                                                                 // armazena nos dados
                                                                                                                                 _data[index] = nameTextField.text;
                                                                                                                                 // atualiza tableView
                                                                                                                                 [[self tableView] reloadData];
                                                                                                                             }];
                                                                            [alert addAction:okAction];
                                                                            
                                                                            [self presentViewController:alert animated:YES completion:nil];
                                                                        }];
   
    UITableViewRowAction *deleteAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault
                                                                            title:@"Deletar"
                                                                          handler:^(UITableViewRowAction *action, NSIndexPath *indexPath) {
                                                                              NSInteger index = [indexPath row];
                                                                              // Remove da lista
                                                                              [_data removeObjectAtIndex:index];
                                                                              // atualiza tableView
                                                                              [[self tableView] reloadData];
                                                                          }];
    return @[ deleteAction, editAction ];
}


@end
