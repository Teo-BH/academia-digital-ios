//
//  AnoModeloTableViewController.m
//  JornalDoCarro
//
//  Created by Rafael Reis Achcar Zanin on 22/09/15.
//  Copyright © 2015 Rafael Reis Achcar Zanin. All rights reserved.
//

#import "AnoModeloTableViewController.h"
#import "ModeloTableViewController.h"
#import "Veiculo.h"
#import "Modelo.h"

#define ANO_MODELO_CELL_ID @"AnoModeloCellID"
#define MODELO_SEGUE @"ModeloSegue"

@interface AnoModeloTableViewController ()
@property (nonatomic) NSMutableArray *modelosSelecionados;
@end

@implementation AnoModeloTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.modelosSelecionados = [NSMutableArray array];
}

-(void)setDataSource:(NSMutableArray *)dataSource {
    NSMutableArray *veiculos = [NSMutableArray array];
    
    for (Veiculo *veiculo in dataSource) {
        NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"ano_modelo" ascending:YES];
        NSArray *ordenados = [[veiculo.veiculo_modelo allObjects] sortedArrayUsingDescriptors:[NSArray arrayWithObject:sortDescriptor]];
        veiculo.veiculo_modelo = [NSSet setWithArray:ordenados];
        
        [veiculos addObject:veiculo];
    }
    _dataSource = veiculos;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.dataSource count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    Veiculo *veiculo = [self.dataSource objectAtIndex:section];
    return [veiculo.veiculo_modelo count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    Veiculo *veiculo = [self.dataSource objectAtIndex:section];
    return veiculo.name;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:ANO_MODELO_CELL_ID forIndexPath:indexPath];
    
    Veiculo * veiculo = [self.dataSource objectAtIndex:indexPath.section];
    Modelo * modelo = (Modelo *)[[veiculo.veiculo_modelo allObjects] objectAtIndex:indexPath.row];

    [cell.textLabel setText:modelo.ano_modelo];
    [cell.detailTextLabel setText:modelo.combustivel];
    
    if ([self.modelosSelecionados containsObject:modelo]) {
        [cell setAccessoryType:UITableViewCellAccessoryCheckmark];
    } else {
        [cell setAccessoryType:UITableViewCellAccessoryNone];
    }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    Veiculo *veiculo = [self.dataSource objectAtIndex:indexPath.section];
    Modelo *modelo = (Modelo *)[[veiculo.veiculo_modelo allObjects] objectAtIndex:indexPath.row];
    if ([self.modelosSelecionados containsObject:modelo]) {
        [self.modelosSelecionados removeObject:modelo];
    } else {
        [self.modelosSelecionados addObject:modelo];
    }
    
    [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:NO];
}

#pragma mark - Segue

-(BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender {
    if([identifier isEqualToString:MODELO_SEGUE]){
        if (self.modelosSelecionados.count == 0) {
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Atenção" message:@"Selecione pelo menos um item" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *action = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:nil];
            [alert addAction:action];
            
            [self presentViewController:alert animated:YES completion:nil];
            return NO;
        }
    }
    
    return YES;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if([segue.identifier isEqualToString:MODELO_SEGUE]){
        ModeloTableViewController * view = segue.destinationViewController;
        view.dataSource = self.modelosSelecionados;
    }
}

@end
