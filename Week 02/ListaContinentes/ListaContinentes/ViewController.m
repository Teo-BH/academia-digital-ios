//
//  ViewController.m
//  ListaContinentes
//
//  Created by Teobaldo Mauro de Moura on 8/28/15.
//  Copyright © 2015 Teobaldo Mauro de Moura. All rights reserved.
//

#import "ViewController.h"

#define CONTINENT_CELL_ID @"ContinentCellID"
#define CONTINENT_NAME_KEY @"ContinentNameKey"
#define CONTINENT_NICK_KEY @"ContinentNickKey"

@interface ViewController () <UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray *continents;
@end

@implementation ViewController

-(void)viewDidLoad {
    [super viewDidLoad];
    
    [self setContinents:@[
        @ {
            CONTINENT_NAME_KEY: @"África",
            CONTINENT_NICK_KEY: @"AF"
        },
        @ {
            CONTINENT_NAME_KEY: @"Antártica",
            CONTINENT_NICK_KEY: @"AT"
        },
        @ {
            CONTINENT_NAME_KEY: @"Ásia",
            CONTINENT_NICK_KEY: @"Ai"
        },
        @ {
            CONTINENT_NAME_KEY: @"América do Norte",
            CONTINENT_NICK_KEY: @"AN"
        },
        @ {
            CONTINENT_NAME_KEY: @"América do Sul",
            CONTINENT_NICK_KEY: @"AS"
        },
        @ {
            CONTINENT_NAME_KEY: @"Europa",
            CONTINENT_NICK_KEY: @"EU"
        },
        @ {
            CONTINENT_NAME_KEY: @"Austrália",
            CONTINENT_NICK_KEY: @"AU"
        }
    ]];

}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[self continents]count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CONTINENT_CELL_ID forIndexPath:indexPath];
    
    NSDictionary *continent = [[self continents] objectAtIndex:[indexPath row]];
    
    
    [[cell textLabel] setText:[continent objectForKey:CONTINENT_NAME_KEY]];
    [[cell detailTextLabel] setText:[continent objectForKey:CONTINENT_NICK_KEY]];
    
    return cell;
}

@end
