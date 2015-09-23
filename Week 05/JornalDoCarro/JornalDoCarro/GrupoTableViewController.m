//
//  GrupoTableViewController.m
//  JornalDoCarro
//
//  Created by Rafael Reis Achcar Zanin on 21/09/15.
//  Copyright © 2015 Rafael Reis Achcar Zanin. All rights reserved.
//

#import "GrupoTableViewController.h"
#import "Grupo.h"
#import "Marca.h"
#import "Veiculo.h"
#import "VeiculoTableViewController.h"
#import "AcessoHelper.h"

#define GRUPO_CELL_ID @"GrupoCellID"
#define VEICULO_SEGUE @"VeiculoSegue"

@interface GrupoTableViewController ()

@property (nonatomic) NSMutableArray<Grupo*> * dataSource;

@end

@implementation GrupoTableViewController {
    BOOL ordemGrupo;
    NSDictionary *acessos;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    ordemGrupo = YES;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    acessos = [AcessoHelper pesquisarAcessosGrupo:[NSString stringWithFormat:@"%@", self.marca.id]];
    [self.tableView reloadData];
}

#pragma mark - Service

- (IBAction)ordenar:(UIBarButtonItem *)sender {
    ordemGrupo = !ordemGrupo;
    
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:ordemGrupo];
    NSArray *ordenados = [self.dataSource sortedArrayUsingDescriptors:[NSArray arrayWithObject:sortDescriptor]];
    self.dataSource = [ordenados mutableCopy];
    [self.tableView reloadData];
}

-(void)setMarca:(Marca *)marca{
    _marca = marca;
    [self getGruposWithMarca:marca];
}

-(void)getGruposWithMarca:(Marca*)marca{
    
    NSMutableArray * result = [NSMutableArray array];
    for (Veiculo * veiculo in marca.marca_veiculo) {
        Grupo * grupo = (Grupo*) veiculo.veiculo_grupo;
        if(![result containsObject:grupo]){
            [result addObject:grupo];
        }
    }
    NSArray * array = [NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"key" ascending:YES]];
    result = [[result sortedArrayUsingDescriptors:array] mutableCopy];
    self.dataSource = result;
    [self.tableView reloadData];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:GRUPO_CELL_ID forIndexPath:indexPath];
    
    Grupo * grupo = [self.dataSource objectAtIndex:indexPath.row];
    NSNumber *qtdeAcesso = [acessos objectForKey:grupo.key];
    if (qtdeAcesso) {
        UIColor *color = [UIColor greenColor];
        [cell setBackgroundColor:[color colorWithAlphaComponent:(0.01f * [qtdeAcesso intValue])]];
    } else {
        [cell setBackgroundColor:[UIColor clearColor]];
    }
    [[cell textLabel]setText:grupo.name];
    
    return cell;
}

#pragma mark - Segue

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:VEICULO_SEGUE]){
        VeiculoTableViewController * view = segue.destinationViewController;
        NSIndexPath * index = [self.tableView indexPathForSelectedRow];
        Grupo *grupo = [self.dataSource objectAtIndex:index.row];
        view.grupo = grupo;
        
        [AcessoHelper computarAcessoGrupo:grupo.key
                                withMarca:[NSString stringWithFormat:@"%@", self.marca.id]];
    }
}

@end
