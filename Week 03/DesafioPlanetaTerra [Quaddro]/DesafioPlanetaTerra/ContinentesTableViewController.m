//
//  ContinentesTableViewController.m
//  DesafioPlanetaTerra
//
//  Created by Marcos Trovilho on 31/08/15.
//  Copyright (c) 2015 Marcos Trovilho. All rights reserved.
//

#import "ContinentesTableViewController.h"
#import "PlanetaTerra.h"
#import "PaisesTableViewController.h"

#define CONTINENTES_CELL_IDENTIFIER @"ContinentesCellIdentifier"

@interface ContinentesTableViewController ()
@property (nonatomic) NSArray *continentes;
@end



@implementation ContinentesTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setContinentes:[PlanetaTerra listaContinentes]];
}

#pragma mark - TableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[self continentes] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView
                             dequeueReusableCellWithIdentifier:CONTINENTES_CELL_IDENTIFIER
                             forIndexPath:indexPath];
    
    NSString *nomeContinente  = [[self continentes] objectAtIndex:[indexPath row]];
    NSString *siglaContinente = [PlanetaTerra siglaContinente:nomeContinente];
    NSNumber *totalPaises     = @([PlanetaTerra totalPaisesContinente:siglaContinente]);
    
    // TODO: celula customizada exibindo
    /*
    - nome
    - siglas
    - quantidade de paises
     */
    
    [[cell textLabel]       setText:nomeContinente];
    [[cell detailTextLabel] setText:[totalPaises stringValue]];
    
    return cell;
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    PaisesTableViewController *paisesTVC = [segue destinationViewController];
    
    NSIndexPath *indexPathSelecionado = [[self tableView] indexPathForSelectedRow];
    NSString *continenteSelecionado = [[self continentes] objectAtIndex:[indexPathSelecionado row]];
    NSString *siglaContinente = [PlanetaTerra siglaContinente:continenteSelecionado];
    NSArray *paises = [PlanetaTerra listaPaisesContinente:siglaContinente];
    [paisesTVC setPaises:paises];
    [paisesTVC setTitle:continenteSelecionado];
}

@end
