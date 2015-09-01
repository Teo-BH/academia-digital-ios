//
//  PaisesTableViewController.m
//  DesafioPlanetaTerra
//
//  Created by Marcos Trovilho on 31/08/15.
//  Copyright (c) 2015 Marcos Trovilho. All rights reserved.
//

#import "PaisesTableViewController.h"
#import "PlanetaTerra.h"
#import "PaisViewController.h"

#define PAISES_CELL_IDENTIFIER @"PaisesCellIdentifier"

@interface PaisesTableViewController ()
@end



@implementation PaisesTableViewController

#pragma mark - TableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[self paises] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView
                             dequeueReusableCellWithIdentifier:PAISES_CELL_IDENTIFIER
                             forIndexPath:indexPath];
    
    NSDictionary *pais = [[self paises] objectAtIndex:[indexPath row]];
    NSString *nomePais = [pais objectForKey:@"name"];
    UIImage *bandeiraPais = [PlanetaTerra
                             bandeiraPais:nomePais
                             tamanho:PlanetaTerraBandeiraTamanhoPequeno];
    
    // TODO: celula customizada exibindo
    /*
     - nome
     - bandeira
     */
    
    [[cell textLabel] setText:nomePais];
    [[cell imageView] setImage:bandeiraPais];
    
    return cell;
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    PaisViewController *paisVC = [segue destinationViewController];
    
    NSIndexPath *indexPathSelecionado = [[self tableView] indexPathForSelectedRow];
    NSDictionary *paisSelecionado = [[self paises] objectAtIndex:[indexPathSelecionado row]];
    NSString *nomePais = [paisSelecionado objectForKey:@"name"];
    NSString *siglaPais = [PlanetaTerra siglaPais:nomePais];
    NSDictionary *pais = [PlanetaTerra listaPais:siglaPais];
    [paisVC setPais:pais];
    [paisVC setTitle:nomePais];
}

@end
