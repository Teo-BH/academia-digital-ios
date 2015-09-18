//
//  DetailTableViewController.m
//  StarWarsFanBoy
//
//  Created by Teobaldo Mauro de Moura on 9/17/15.
//  Copyright © 2015 Teobaldo Mauro de Moura. All rights reserved.
//

#import "DetailTableViewController.h"
#import "DetailTableViewCell.h"
#import "StarWarAPI.h"
#import "WebStarWarAPI.h"
#import "NSObject+Extension.h"
#import "SettingAPI.h"

#define CELL_ID @"PropertyCellID"

@interface DetailTableViewController ()

@property (nonatomic, strong) NSString *entityName;
@property (nonatomic, strong) ModelBase *data;

@property (strong, nonatomic) NSDictionary *properties;
@property (strong, nonatomic) NSArray *visibleProperties;

@end

@implementation DetailTableViewController

#pragma mark Properties (segue)

-(void)setEntityName:(NSString *)entityName withData:(ModelBase *)data {
    [self setEntityName:entityName];
    [self setData:data];
}

-(void)setEntityName:(NSString *)entityName {
    NSArray *actives = [SettingAPI getActiveSetting:entityName];
    [self setVisibleProperties:actives];
    _entityName = entityName;
}

-(void)setData:(ModelBase *)data {
    [[self navigationItem] setTitle:[data description]];
    [self loadDictionary:data];
    _data = data;
}

-(void)loadDictionary:(ModelBase *)data {
    NSMutableDictionary *result = [NSMutableDictionary dictionary];
    NSArray<NSString *> *properties = [data properties];
    for (NSString *propertyName in properties) {
        if ([[self visibleProperties] containsObject:propertyName]) {
            id valueForKey = [data valueForKey:propertyName];
            NSString *propertyValue = valueForKey == nil ? [NSString string] : [valueForKey displayText];
            [result setObject:propertyValue forKey:propertyName];
        }
    }
    
    [self setProperties:result];
}

#pragma mark TableViewController

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[[self properties] allKeys] count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CELL_ID forIndexPath:indexPath];
    
    NSString *propertyName = [[[self properties] allKeys] objectAtIndex:[indexPath row]];
    NSString *propertyValue = [[self properties] objectForKey:propertyName];
    
    [cell setTitle:propertyName withValue:propertyValue];
    
    return cell;
}

@end
