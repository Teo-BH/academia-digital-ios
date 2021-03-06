//
//  ListTableViewController.m
//  StarWarsFanBoy
//
//  Created by Teobaldo Mauro de Moura on 9/16/15.
//  Copyright © 2015 Teobaldo Mauro de Moura. All rights reserved.
//

#import "ListTableViewController.h"
#import "ListTableViewCell.h"
#import "DetailTableViewController.h"
#import "SettingTableViewController.h"
#import "StarWarAPI.h"
#import "WebStarWarAPI.h"
#import "ModelBase.h"
#import "SettingAPI.h"

#define CELL_ID @"CellID"
#define DETAIL_SEGUE @"DetailSegue"
#define SETTING_SEGUE @"SettingSegue"

@interface ListTableViewController () <UISearchResultsUpdating>

@property (strong, nonatomic) NSArray *fullEntityList;
@property (strong, nonatomic) NSMutableArray *filteredEntityList;

@property (strong, nonatomic) UISearchController *resultSearchController;

@end

@implementation ListTableViewController

-(void)viewDidLoad {
    [super viewDidLoad];
    
    [self setResultSearchController:[self getSearchController]];
}

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
    [self setFullEntityList:data];
    self.filteredEntityList = [NSMutableArray arrayWithCapacity:[self.fullEntityList count]];
    
    // ASYNC => Carrega os dados de 'todas' as páginas
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSArray *fullData = [api getEntity:entityName];
        
        dispatch_async(dispatch_get_main_queue(), ^(void) {
            [self setFullEntityList:fullData];
            self.filteredEntityList = [NSMutableArray arrayWithCapacity:[self.fullEntityList count]];
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
    ListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CELL_ID];
    if ( cell == nil ) {
        cell = [[ListTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CELL_ID];
    }
    
    ModelBase *item = [[self entityList] objectAtIndex:[indexPath row]];
    [cell setName:item.description withLastAccess:item.lastAccess];
    
    return cell;
}

#pragma mark - Segues

-(BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender {
    if ([identifier isEqualToString:DETAIL_SEGUE]) {
        NSArray *setting = [SettingAPI getActiveSetting:self.entity.name];
        BOOL result = setting != nil;
        if (!result) {
            [self alertNotPreferences];
        }
        return result;
    } else {
        return YES;
    }
}

-(void)alertNotPreferences {
    UIAlertController * alert=   [UIAlertController alertControllerWithTitle:@"Preferências"
                                                                     message:@"Defina as preferências para exibir os detalhes"
                                                              preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK"
                                                       style:UIAlertActionStyleCancel
                                                     handler:^(UIAlertAction *action) {
                                                         [alert dismissViewControllerAnimated:YES completion:nil];
                                                     }];
    [alert addAction:okAction];
    
    [self presentViewController:alert animated:YES completion:nil];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:DETAIL_SEGUE]) {
        // Define o item selecionado
        NSIndexPath *indexPath = [[self tableView] indexPathForSelectedRow];
        ModelBase *data = [[self entityList] objectAtIndex:[indexPath row]];
    
        // Atualiza a data do último acesso
        [data setLastAccess:[NSDate date]];
        [[self tableView] reloadRowsAtIndexPaths:@[ indexPath ] withRowAnimation:NO];
        
        // Preenche as propriedades de destino
        DetailTableViewController *destinationView = [segue destinationViewController];
        [destinationView setEntityName:self.entity.name withData:data];
        
    } else if ([segue.identifier isEqualToString:SETTING_SEGUE]) {
        SettingTableViewController *destinationView = [segue destinationViewController];
        [destinationView setEntityName:self.entity.name];
    }
}

#pragma mark - UISearchResultsUpdating

-(UISearchController *)getSearchController {
    UISearchController *controller = [[UISearchController alloc] initWithSearchResultsController:nil];
    controller.searchResultsUpdater = self;
    controller.dimsBackgroundDuringPresentation = NO;
    [controller.searchBar sizeToFit];
    
    self.tableView.tableHeaderView = controller.searchBar;
    self.definesPresentationContext = YES;
    
    return controller;
}

-(NSArray *)entityList {
    if (self.resultSearchController.active) {
        return self.filteredEntityList;
    } else {
        return self.fullEntityList;
    }
}

-(void)updateSearchResultsForSearchController:(UISearchController *)searchController {
    [self filterContentForSearchText:searchController.searchBar.text];
    [self.tableView reloadData];
}

-(void)filterContentForSearchText:(NSString*)searchText {
    // Limpa o array filtrado
    [self.filteredEntityList removeAllObjects];
    
    // Realiza um novo filtro
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF.description contains[c] %@", searchText];
    self.filteredEntityList = [NSMutableArray arrayWithArray:[self.fullEntityList filteredArrayUsingPredicate:predicate]];
}

@end
