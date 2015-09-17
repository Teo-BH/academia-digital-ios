//
//  SettingTableViewController.m
//  StarWarsFanBoy
//
//  Created by Teobaldo Mauro de Moura on 9/17/15.
//  Copyright © 2015 Teobaldo Mauro de Moura. All rights reserved.
//

#import "SettingTableViewController.h"
#import "StarWarAPI.h"
#import "WebStarWarAPI.h"
#import "NSObject+Extension.h"
#import "SettingAPI.h"

#define CELL_ID @"SettingCellID"

@interface SettingTableViewController ()

@property (strong, nonatomic) NSMutableDictionary *dictionary;
@end

@implementation SettingTableViewController

#pragma mark - Load and Save Settings

-(void)setEntityName:(NSString *)entityName {
    [[self navigationItem] setTitle:entityName];
    [self loadDictionary:entityName];
    _entityName = entityName;
}

-(void)loadDictionary:(NSString *)entityName {
    id<StarWarAPI> api = [[WebStarWarAPI alloc] init];
    ModelBase *model = [api allocByEntityName:entityName];
    
    // Settings armazenado
    NSArray *settings = [SettingAPI getActiveSetting:entityName];
    
    // Carrega as propriedades
    NSMutableDictionary *result = [NSMutableDictionary dictionary];
    NSArray<NSString *> *properties = [model properties];
    for (NSString *propertyName in properties) {
        BOOL active = (settings == nil || [settings containsObject:propertyName]);
        NSNumber *value = [NSNumber numberWithBool:active];
        [result setObject:value forKey:propertyName];
    }
    
    // Define a propriedade
    [self setDictionary:result];
}

-(void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    [self saveSettings];
}

-(void)saveSettings {
#warning TODO: Validar o salve Settings
    NSMutableArray *actives = [NSMutableArray array];
    for (NSString *propertyName in [[self dictionary] allKeys]) {
        NSNumber *value = [[self dictionary] objectForKey:propertyName];
        BOOL propertyActive = [value boolValue];
        if (propertyActive) {
            [actives addObject:propertyName];
        }
    }
    
    // Salva os Settings
    [SettingAPI saveActiveSetting:actives withFileName:self.entityName];
}

#pragma mark TableViewController

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[[self dictionary] allKeys] count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CELL_ID forIndexPath:indexPath];
    
    NSString *propertyName = [[[self dictionary] allKeys] objectAtIndex:[indexPath row]];
    NSNumber *value = [[self dictionary] objectForKey:propertyName];
    BOOL propertyActive = [value boolValue];
    
    [[cell textLabel] setText:propertyName];
    UITableViewCellAccessoryType acessoryType = propertyActive ? UITableViewCellAccessoryCheckmark : UITableViewCellAccessoryNone;
    [cell setAccessoryType:acessoryType];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Ajusta o TableView
    UITableViewCell* cell = [[self tableView] cellForRowAtIndexPath:indexPath];
    BOOL propertyActive = !(cell.accessoryType == UITableViewCellAccessoryCheckmark);
    UITableViewCellAccessoryType acessoryType = propertyActive ? UITableViewCellAccessoryCheckmark : UITableViewCellAccessoryNone;
    [cell setAccessoryType:acessoryType];
    
    // Atualiza o Dicionário (memória)
    NSString *propertyName = [[[self dictionary] allKeys] objectAtIndex:[indexPath row]];
    NSNumber *value = [NSNumber numberWithBool:YES];
    self.dictionary[propertyName] = value;
}

@end
