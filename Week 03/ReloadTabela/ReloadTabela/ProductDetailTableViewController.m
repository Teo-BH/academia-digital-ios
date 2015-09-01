//
//  ProductDetailTableViewController.m
//  ReloadTabela
//
//  Created by Teobaldo Mauro de Moura on 8/31/15.
//  Copyright (c) 2015 Teobaldo Mauro de Moura. All rights reserved.
//

#import "ProductDetailTableViewController.h"
#import "ProductDetailTableViewCell.h"

#define CELL_ID @"DetailCellID"

@interface ProductDetailTableViewController ()

@end

@implementation ProductDetailTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[self details] count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ProductDetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CELL_ID forIndexPath:indexPath];
    
    // Define o itém
    NSInteger index = [indexPath row];
    NSDictionary *detail = [self details][index];
    
    NSString *sku = detail[@"itemId"];
    NSString *name = detail[@"nameComplete"];
    //[[cell textLabel] setText:name];
    [[cell nomeLabel] setText:name];
    [[cell skuLabel] setText:sku];
    
    //Célula customizada
    NSArray *images = detail[@"images"];
    int random = arc4random_uniform((int)[images count]);
    NSDictionary *fotoInfo = images[random];
    NSString *fotoURL = fotoInfo[@"imageUrl"];
    
    NSURL *url = [NSURL URLWithString:fotoURL];
    NSData *data = [NSData dataWithContentsOfURL:url];
    UIImage *foto = [UIImage imageWithData:data];
    //[[cell imageView] setImage:foto];
    [[cell fotoImageView] setImage:foto];

    return cell;
}

//-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    return 100; // define o tamanho da célula
//}


@end
