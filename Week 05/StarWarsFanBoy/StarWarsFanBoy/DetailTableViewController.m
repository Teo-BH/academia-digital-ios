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

#define CELL_ID @"PropertyCellID"

@interface DetailTableViewController ()

@property (strong, nonatomic) NSDictionary *properties;

@end

@implementation DetailTableViewController

#pragma mark Properties (segue)

-(void)setData:(ModelBase *)data {
    [[self navigationItem] setTitle:[data description]];
    [self loadDictionary:data];
    _data = data;
}

-(void)loadDictionary:(ModelBase *)data {
    NSMutableDictionary *result = [NSMutableDictionary dictionary];
    
    NSArray<NSString *> *properties = [data properties];
    for (NSString *propertyName in properties) {
        id valueForKey = [data valueForKey:propertyName];
        NSString *propertyValue = valueForKey == nil ? [NSString string] : [valueForKey displayText];
        [result setObject:propertyValue forKey:propertyName];
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
