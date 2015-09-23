//
//  ModeloTableViewController.m
//  JornalDoCarro
//
//  Created by Rafael Reis Achcar Zanin on 21/09/15.
//  Copyright © 2015 Rafael Reis Achcar Zanin. All rights reserved.
//

#import "ModeloTableViewController.h"
#import "ModeloTableViewCell.h"
#import "Modelo.h"
#import "Veiculo.h"

#define MODELO_CELL_ID @"ModeloCellID"

@interface ModeloTableViewController ()
@end

@implementation ModeloTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)home:(UIBarButtonItem *)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.dataSource count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    Modelo *modelo = [self.dataSource objectAtIndex:section];
    return modelo.veiculo;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ModeloTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:MODELO_CELL_ID forIndexPath:indexPath];
    
    Modelo * modelo = [self.dataSource objectAtIndex:indexPath.section];
    [cell setModelo:modelo];
    return cell;
}

@end
