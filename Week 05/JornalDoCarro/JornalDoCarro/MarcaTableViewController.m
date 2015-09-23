//
//  ViewController.m
//  JornalDoCarro
//
//  Created by Rafael Reis Achcar Zanin on 21/09/15.
//  Copyright © 2015 Rafael Reis Achcar Zanin. All rights reserved.
//

#import "MarcaTableViewController.h"
#import "AFSyncAPI.h"
#import "Marca.h"
#import "MarcaTableViewCell.h"
#import "GrupoTableViewController.h"
#import "AcessoHelper.h"

#define MARCA_CELL_ID @"MarcaCellID"
#define GRUPO_SEGUE @"GrupoSegue"
#define ULTIMA_SINCRONIZACAO @"ultimaSincronizacao"

@interface MarcaTableViewController ()

@property (nonatomic, strong) NSArray * dataSource;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *syncButton;

@end

@implementation MarcaTableViewController {
    BOOL ordemMarca;
    NSDictionary *acessos;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadDataSource];
    ordemMarca = YES;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    self.syncButton.enabled = ![self isSincronizado];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    acessos = [AcessoHelper pesquisarAcessosMarca];
    [self.tableView reloadData];
}

- (IBAction)ordenar:(UIBarButtonItem *)sender {
    ordemMarca = !ordemMarca;
    
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:ordemMarca];
    NSArray *ordenados = [self.dataSource sortedArrayUsingDescriptors:[NSArray arrayWithObject:sortDescriptor]];
    self.dataSource = ordenados;
    [self.tableView reloadData];
}

- (BOOL)isSincronizado {
    NSDate *ultimaSincronizacao = [self readUltimaSincronizacao];
    if (!ultimaSincronizacao) {
        return NO;
    }
    NSDate *dataLimite = [ultimaSincronizacao dateByAddingTimeInterval:60*60*24];
    
    NSDate * date = [NSDate date];

    NSComparisonResult compare = [date compare:dataLimite];
    
    return (compare == NSOrderedAscending);
}

- (void)saveUltimaSincronizacao {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:[NSDate date] forKey:ULTIMA_SINCRONIZACAO];
}

- (NSDate *)readUltimaSincronizacao {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSDate *date = [userDefaults objectForKey:ULTIMA_SINCRONIZACAO];
    return date;
}

- (IBAction)syncronizeTouched:(UIBarButtonItem *)sender {
    self.syncButton.enabled = NO;
    [self saveUltimaSincronizacao];
    
    AFSyncAPI * api = [[AFSyncAPI alloc] init];
    [api syncMarcasWithComplete:^{
        self.dataSource = [api getMarcas];
            
        [self.tableView reloadData];
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
            for (Marca *marca in self.dataSource) {
                
                [api syncMarcaWithId:marca.id withComplete:^{
                    NSUInteger index = [self.dataSource indexOfObject:marca];
                    NSIndexPath * indexPath = [NSIndexPath indexPathForRow:index inSection:0];
                    dispatch_sync(dispatch_get_main_queue(), ^{
                        [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:NO];
                    });
                }];
            }
        
        });
    }];
    
}

#pragma mark - Service

-(void)loadDataSource {
    AFSyncAPI * api = [[AFSyncAPI alloc] init];
    self.dataSource = [api getMarcas];
    if(!self.dataSource || self.dataSource.count == 0){
        [api syncMarcasWithComplete:^{
            self.dataSource = [api getMarcas];
            [self.tableView reloadData];
        }];
    }
    
}



#pragma mark - UITableViewDelegate

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return  1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MarcaTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:MARCA_CELL_ID forIndexPath:indexPath];
    Marca * marca = [self.dataSource objectAtIndex:indexPath.row];
    NSNumber *qtdeAcesso = [acessos objectForKey:[NSString stringWithFormat:@"%@", marca.id]];
    if (qtdeAcesso) {
        UIColor *color = [UIColor redColor];
        [cell setBackgroundColor:[color colorWithAlphaComponent:(0.01f * [qtdeAcesso intValue])]];
    } else {
        [cell setBackgroundColor:[UIColor clearColor]];
    }
    
    [cell setMarca:marca];
    
    return cell;
}

#pragma mark - Segue

-(BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender {
    if([identifier isEqualToString:GRUPO_SEGUE]){
        NSIndexPath * index = [self.tableView indexPathForSelectedRow];
        Marca * marca = [self.dataSource objectAtIndex:index.row];
        if (!marca.status) {
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Atenção" message:@"Esta marca ainda não foi sincronizada." preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *action = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:nil];
            [alert addAction:action];
            
            [self presentViewController:alert animated:YES completion:nil];
        }
        return marca.status;
    } else {
        return YES;
    }
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:GRUPO_SEGUE]){
        NSIndexPath * index = [self.tableView indexPathForSelectedRow];
        Marca *marca = [self.dataSource objectAtIndex:index.row];
        
        [AcessoHelper computarAcessoMarca:[NSString stringWithFormat:@"%@", marca.id]];
        
        GrupoTableViewController * view = segue.destinationViewController;
        view.marca = marca;
    }
}


@end
