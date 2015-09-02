//
//  TaskTableViewController.m
//  DesafioGeral
//
//  Created by Teobaldo Mauro de Moura on 9/2/15.
//  Copyright © 2015 Teobaldo Mauro de Moura. All rights reserved.
//

#import "TaskTableViewController.h"
#import "SecurityHelper.h"
#import "TaskData.h"
#import "TaskTableViewCell.h"

#define CELL_ID @"TaskCellID"

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
    TaskTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CELL_ID forIndexPath:indexPath];
    
    TaskData *task = [_data objectAtIndex:[indexPath row]];
    [cell setTask:task];
    
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
                                                         TaskData *data = [[TaskData alloc] initWitName:nameTextField.text];
                                                         [_data addObject:data];
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
                                                                                TaskData *task = [_data objectAtIndex:[indexPath row]];
                                                                                [textField setText:[task name]];
                                                                            }];
                                                                            
                                                                            UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK"
                                                                                                                               style:UIAlertActionStyleCancel
                                                                                                                             handler:^(UIAlertAction *action) {
                                                                                                                                 // obtém o dado digitado
                                                                                                                                 UITextField *nameTextField = [[alert textFields] firstObject];
                                                                                                                                 // armazena nos dados
                                                                                                                                 TaskData *task = [_data objectAtIndex:[indexPath row]];
                                                                                                                                 [task setName:nameTextField.text];
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
