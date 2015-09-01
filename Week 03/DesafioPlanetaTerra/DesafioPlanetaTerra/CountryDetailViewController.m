//
//  CountryDetailViewController.m
//  DesafioPlanetaTerra
//
//  Created by Teobaldo Mauro de Moura on 8/31/15.
//  Copyright (c) 2015 Teobaldo Mauro de Moura. All rights reserved.
//

#import "CountryDetailViewController.h"

@interface CountryDetailViewController ()

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *languageLabel;
@property (weak, nonatomic) IBOutlet UILabel *capitalLabel;
@property (weak, nonatomic) IBOutlet UIImageView *flagImageView;

@end

@implementation CountryDetailViewController

-(void)viewDidLoad {
    [super viewDidLoad];
    
    [[self nameLabel] setText:[self name]];
    [[self capitalLabel] setText:[self capital]];
    [[self languageLabel] setText:[self language]];
    [[self flagImageView] setImage:[self flag]];
}

@end
