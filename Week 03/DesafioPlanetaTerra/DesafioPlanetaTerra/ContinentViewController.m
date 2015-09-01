//
//  ViewController.m
//  DesafioPlanetaTerra
//
//  Created by Teobaldo Mauro de Moura on 8/31/15.
//  Copyright (c) 2015 Teobaldo Mauro de Moura. All rights reserved.
//

#import "ContinentViewController.h"
#import "ContinentParser.h"
#import "ContinentTableViewCell.h"
#import "CountryTableViewController.h"

#define CELL_ID @"CellID"

/*
 Tabela com lista de continentes
 - nome
 - siglas
 - quantidade de países
 
 Tabela com lista de paises por continentes
 - nome
 - bandeira
 
 Tela com detalhes do pais
 - nome
 - nome em lingua nativa
 - bandeira
 - capital
 * bonus: link pra wikipedia
 
 
 Classe com parser do JSON
 - metodos de classe para:
 - listar continentes
 - id do continente a partir do nome
 - total de países
 - lista de países por id do continente
 - id do pais a partir do nome
 */

@implementation ContinentViewController

-(void)viewDidLoad {
    [super viewDidLoad];
    
    [[self tableView] reloadData];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[ContinentParser continents] count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ContinentTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CELL_ID forIndexPath:indexPath];
    
    NSString *name = [[ContinentParser continents] objectAtIndex:[indexPath row]];
    [[cell nameLabel] setText:name];
    
    NSString *nick = [ContinentParser continentId:name];
    [[cell nickLabel] setText:nick];
    
    NSInteger total = [ContinentParser countriesSum:name];
    [[cell totalLabel] setText:[NSString stringWithFormat:@"%ld", total]];
    
    return cell;
}

#pragma mark Segue

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // seleciona o item
    NSIndexPath *indexPath = [[self tableView] indexPathForSelectedRow];
    NSString *continentName = [[ContinentParser continents] objectAtIndex:[indexPath row]];
    
    // Define a propriedade
    NSArray *countries = [ContinentParser countries:continentName];
    CountryTableViewController *view = segue.destinationViewController;
    view.countries = countries;
}

@end
