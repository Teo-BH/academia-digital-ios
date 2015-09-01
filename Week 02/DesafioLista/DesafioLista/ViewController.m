//
//  ViewController.m
//  DesafioLista
//
//  Created by Teobaldo Mauro de Moura on 8/28/15.
//  Copyright © 2015 Teobaldo Mauro de Moura. All rights reserved.
//

#import "ViewController.h"

#define CELL_ID @"CellID"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate> {
    NSMutableArray *_data;
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Inicialização dos dados
    _data = [NSMutableArray array];
}

- (IBAction)addTouched:(UIButton *)sender {
    // alerta (deprecated)
//    [[UIAlertView alloc] initWithTitle:[NSString string]
//                        message:[NSString string]
//                        delegate:[NSString string]
//                        cancelButtonTitle:[NSString string]
//                        otherButtonTitles:[NSString string],
//                        nil];
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Adicionar item"
                                                                   message:@"Digite o nome a ser adicionado"
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    [alert addTextFieldWithConfigurationHandler:^(UITextField * textField) {
       // configuração
        [textField setPlaceholder:@"Nome"];
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

#pragma mark - UITableViewDataSource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_data count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CELL_ID forIndexPath:indexPath];
    
    NSString *item = [_data objectAtIndex:[indexPath row]];
    [[cell textLabel] setText:item];
    
    return cell;
}

#pragma mark - UITableViewDelegate

-(NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewRowAction *editAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault
                                                                          title:@"Editar"
                                                                        handler:^(UITableViewRowAction *action, NSIndexPath *indexPath) {
                                                                            // Diálogo
                                                                            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Editar item"
                                                                                                                                           message:@"Digite o nome a ser editado"
                                                                                                                                    preferredStyle:UIAlertControllerStyleAlert];
                                                                            
                                                                            [alert addTextFieldWithConfigurationHandler:^(UITextField * textField) {
                                                                                // configuração
                                                                                [textField setPlaceholder:@"Nome"];
                                                                            }];
                                                                        
                                                                            NSInteger index = [indexPath row];
                                                                            // obtém o dado digitado
                                                                            UITextField *nameTextField = [[alert textFields] firstObject];
                                                                            // armazena nos dados
                                                                            _data[index] = nameTextField.text;
                                                                            // atualiza tableView
                                                                            [[self tableView] reloadData];
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
    
    // Imagens de fundo
    //[editAction setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"abc"]]];
    //[editAction setBackgroundColor:[UIColor blueColor]];
    
    return @[ editAction, deleteAction];
}

-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

@end
