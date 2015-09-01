//
//  HistoryViewController.m
//  Contador
//
//  Created by Teobaldo Mauro de Moura on 8/28/15.
//  Copyright © 2015 Teobaldo Mauro de Moura. All rights reserved.
//

#import "HistoryViewController.h"
#import "TabBarController.h"
#import "Count.h"

#define CELL_ID @"CellID"

@interface HistoryViewController () <UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (readonly) Count *count;

@end

@implementation HistoryViewController

-(void)viewDidLoad {
    [super viewDidLoad];
    
    // Define um espaçamento (rodapé) na TabView
    UIEdgeInsets inset = UIEdgeInsetsMake(0, 0, self.tabBarController.tabBar.frame.size.height, 0);
    [[self tableView] setContentInset:inset];
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [[self tableView] reloadData];
}

-(Count *)count {
    TabBarController *tabBar = (TabBarController *)[self tabBarController];
    return [tabBar count];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[[self count] history] count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CELL_ID forIndexPath:indexPath];
    
    NSNumber *value  = [[[self count] history] objectAtIndex:[indexPath row]];
    NSString *text = [NSString stringWithFormat:@"%@", value];

    [[cell textLabel] setText:text];
    
    return cell;
}


@end
