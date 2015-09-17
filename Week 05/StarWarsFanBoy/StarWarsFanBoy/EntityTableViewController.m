//
//  EntityTableViewController.m
//  StarWarsFanBoy
//
//  Created by Teobaldo Mauro de Moura on 9/16/15.
//  Copyright © 2015 Teobaldo Mauro de Moura. All rights reserved.
//

#import "EntityTableViewController.h"
#import "ListTableViewController.h"
#import "EntityMetadata.h"
#import "StarWarAPI.h"
#import "WebStarWarAPI.h"

#define CELL_ID @"CellID"

@interface EntityTableViewController ()
@property (strong, nonatomic) NSArray<EntityMetadata *> *entities;
@end

@implementation EntityTableViewController

#pragma mark - Life Cycle

-(void)viewDidLoad {
    [super viewDidLoad];
    
    // Carrega os dados
    [self loadEntities];
}

#pragma mark - Internal Functions

-(void)loadEntities {
    id<StarWarAPI> api = [[WebStarWarAPI alloc] init];
    NSArray<EntityMetadata *> *data = [api getEntities];
    [self setEntities:data];
}

#pragma mark - TableViewController

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[self entities] count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CELL_ID forIndexPath:indexPath];
    
    EntityMetadata *entity = [[self entities] objectAtIndex:[indexPath row]];
    [[cell textLabel] setText:entity.name];
    
    return cell;
}

#pragma mark - Segues

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSIndexPath *indexPath = [[self tableView] indexPathForSelectedRow];
    EntityMetadata *entity = [[self entities] objectAtIndex:[indexPath row]];
    
    ListTableViewController *destinationView = [segue destinationViewController];
    [destinationView setEntity:entity];
}

@end
