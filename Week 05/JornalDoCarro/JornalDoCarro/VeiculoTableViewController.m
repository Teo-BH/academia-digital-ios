//
//  VeiculoTableViewController.m
//  JornalDoCarro
//
//  Created by Rafael Reis Achcar Zanin on 21/09/15.
//  Copyright © 2015 Rafael Reis Achcar Zanin. All rights reserved.
//

#import "VeiculoTableViewController.h"
#import "Grupo.h"
#import "Veiculo.h"
#import "AnoModeloTableViewController.h"

#define VEICULO_CELL_ID @"VeiculoCellID"
#define ANO_MODELO_SEGUE @"AnoModeloSegue"

@interface VeiculoTableViewController ()

@property (nonatomic) NSArray<Veiculo*> * dataSource;
@property (nonatomic) NSMutableArray *veiculosSelecionados;

@end

@implementation VeiculoTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.veiculosSelecionados = [NSMutableArray array];
}

-(void)setGrupo:(Grupo *)grupo {
    _grupo = grupo;
    self.dataSource = [grupo.grupo_veiculo allObjects];
}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:VEICULO_CELL_ID forIndexPath:indexPath];
    
    Veiculo * veiculo = [self.dataSource objectAtIndex:indexPath.row];
    NSString *name = veiculo.fipe_name;
    if (!name) {
        name = veiculo.name;
    }
    [[cell textLabel] setText:name];

    if ([self.veiculosSelecionados containsObject:veiculo]) {
        [cell setAccessoryType:UITableViewCellAccessoryCheckmark];
    } else {
        [cell setAccessoryType:UITableViewCellAccessoryNone];
    }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    Veiculo *veiculo = [self.dataSource objectAtIndex:indexPath.row];
    if ([self.veiculosSelecionados containsObject:veiculo]) {
        [self.veiculosSelecionados removeObject:veiculo];
    } else {
        [self.veiculosSelecionados addObject:veiculo];
    }
    
    [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:NO];
}

#pragma mark - Segue

-(BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender {
    if([identifier isEqualToString:ANO_MODELO_SEGUE]){
        if (self.veiculosSelecionados.count == 0) {
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
    
    if([segue.identifier isEqualToString:ANO_MODELO_SEGUE]){
        AnoModeloTableViewController * view = segue.destinationViewController;
        view.dataSource = self.veiculosSelecionados;
    }    
}

@end
