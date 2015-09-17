//
//  ListTableViewController.m
//  StarWarsFanBoy
//
//  Created by Teobaldo Mauro de Moura on 9/16/15.
//  Copyright © 2015 Teobaldo Mauro de Moura. All rights reserved.
//

#import "ListTableViewController.h"
#import "StarWarAPI.h"
#import "WebStarWarAPI.h"
#import "ModelBase.h"

#define CELL_ID @"CellID"

@interface ListTableViewController ()

@property (weak, nonatomic) IBOutlet UINavigationItem *navigationItem;
@property (strong, nonatomic) NSArray *entityList;

@end

@implementation ListTableViewController

#pragma mark - Properties (Segue)

-(void)setEntity:(EntityMetadata *)entity {
    [self loadEntityList:entity.name];
    _entity = entity;
}

-(void)loadEntityList:(NSString *)entityName {
    // Define o título
    [[self navigationItem] setTitle:entityName];
    
    // Carrega os dados
    [self getEntity:entityName];
}

-(void)getEntity:(NSString *)entityName {
    // API Class
    id<StarWarAPI> api = [[WebStarWarAPI alloc] init];
    
    // SYNC => Carrega os dados da 1˚ página
    NSArray *data = [api getEntity:entityName withPage:1];
    [self setEntityList:data];
    
    // ASYNC => Carrega os dados de 'todas' as páginas
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSArray *fullData = [api getEntity:entityName];
        
        dispatch_async(dispatch_get_main_queue(), ^(void) {
            [self setEntityList:fullData];
            [[self tableView] reloadData];
        });
    });
}

#pragma mark - TableViewController

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[self entityList] count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CELL_ID];
    
    ModelBase *item = [[self entityList] objectAtIndex:[indexPath row]];
    [[cell textLabel] setText:item.description];
    
    return cell;
}

@end