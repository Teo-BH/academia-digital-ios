//
//  CountryTableViewController.m
//  DesafioPlanetaTerra
//
//  Created by Teobaldo Mauro de Moura on 8/31/15.
//  Copyright (c) 2015 Teobaldo Mauro de Moura. All rights reserved.
//

#import "CountryTableViewController.h"
#import "CountryDetailViewController.h"
#import "ContinentParser.h"

#define COUNTRY_CELL_ID @"CountryCellID"
#define COUNTRY_NAME @"name"
#define COUNTRY_LANGUAGE @"languages"
#define COUNTRY_CAPITAL @"capital"

@implementation CountryTableViewController

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[self countries] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:COUNTRY_CELL_ID forIndexPath:indexPath];
    
    // Nome do país
    NSInteger index = [indexPath row];
    NSString *name = self.countries[index][COUNTRY_NAME];
    [[cell textLabel] setText:name];
    
    // Bandeira do País
    UIImage *flag = [ContinentParser countryFlag:name withFlagLength:CountryFlagLengthSmall];
    [[cell imageView] setImage:flag];
    
    return cell;
}

#pragma mark - Segue

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // seleciona o item
    NSIndexPath *indexPath = [[self tableView] indexPathForSelectedRow];
    NSInteger index = [indexPath row];
    NSDictionary *dictionary = self.countries[index];
    
    // Define a propriedade
    CountryDetailViewController *view = segue.destinationViewController;
    NSString *name = dictionary[COUNTRY_NAME];
    [view setName:name];
    [view setLanguage:dictionary[COUNTRY_LANGUAGE]];
    [view setCapital:dictionary[COUNTRY_CAPITAL]];
    UIImage *flag = [ContinentParser countryFlag:name withFlagLength:CountryFlagLengthLarge];
    [view setFlag:flag];
}

@end
