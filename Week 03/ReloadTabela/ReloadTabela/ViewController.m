//
//  ViewController.m
//  ReloadTabela
//
//  Created by Teobaldo Mauro de Moura on 8/31/15.
//  Copyright © 2015 Teobaldo Mauro de Moura. All rights reserved.
//

#import "ViewController.h"
#import "ProductDetailTableViewController.h"

#define CELL_ID @"CellID"

@interface ViewController ()
@property (nonatomic, strong) NSArray *dados;
@end

@implementation ViewController

-(void)setDados:(NSArray *)dados {
    _dados = dados;
    [[self tableView] reloadData];
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    // Executa o Refresh assim que entra na tela
    [[self refreshControl] beginRefreshing];
    [self refresh:[self refreshControl]];
}

- (IBAction)refresh:(UIRefreshControl *)sender {
    // Executa o carragamento lento (baixar json web e etc...)
    NSURL *url = [NSURL URLWithString:@"http://compracerta.vtexcommercestable.com.br/api/catalog_system/pub/products/search/"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
                               if (error)
                                   NSLog(@"Erro na conexão: %@", error);
                               
                               // parse JSON
                               NSArray *dados = [NSJSONSerialization JSONObjectWithData:data
                                                                                options:0
                                                                                  error:nil];
                               
                               NSLog(@"%@", dados);
                               
                               // Salva os dados para popular tabela
                               [self setDados:dados];
                               
                               // Termina o refresh
                               [sender endRefreshing];
                           }];
    
    
}

#pragma mark TableView

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[self dados] count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CELL_ID forIndexPath:indexPath];
    
    NSInteger index = [indexPath row];
    NSDictionary *produto = [self dados][index];
    NSString *name = [produto objectForKey:@"productName"]; // produto[@"productName"];
    
    
    [[cell textLabel] setText:name];

    return cell;
}

#pragma mark Segue

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Seleciona o item
    NSIndexPath *indexPath = [[self tableView] indexPathForSelectedRow];
    NSInteger index = [indexPath row];
    NSDictionary *produto = [self dados][index];
    
    // Obtém os details
    NSString *name = produto[@"productName"];
    NSArray *details = produto[@"items"];
    
    // Define as propriedades
    ProductDetailTableViewController *view = segue.destinationViewController;
    view.title = name;
    view.details = details;
}

@end