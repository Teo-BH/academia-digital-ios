//
//  ViewController.m
//  Tabela
//
//  Created by Teobaldo Mauro de Moura on 8/28/15.
//  Copyright © 2015 Teobaldo Mauro de Moura. All rights reserved.
//

#import "ViewController.h"

#define CELL_ID @"CellID"
// NSString *const CELLID = @"CellID";

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // Carregando uma célula reutilizável do storyboard
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CELL_ID];
    
    // Código legado (muito antigo)
    // Célula não for carregada no Storyboard/xib devemos criá-las caso não exista
    /*
    if (!cell)
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CELL_ID];
     */
    
    [[cell textLabel] setText:@"Célula X"];
    //[[cell detailTextLabel] setText:@"Detalhe"];
    
    return cell;
}

@end
