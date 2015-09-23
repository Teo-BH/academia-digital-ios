//
//  MarcaTableViewCell.m
//  JornalDoCarro
//
//  Created by Rafael Reis Achcar Zanin on 21/09/15.
//  Copyright © 2015 Rafael Reis Achcar Zanin. All rights reserved.
//

#import "MarcaTableViewCell.h"
#import "Marca.h"

@interface MarcaTableViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *dataSyncLabel;
@property (weak, nonatomic) IBOutlet UIImageView *statusImage;

@end

@implementation MarcaTableViewCell


-(void)setMarca:(Marca *)marca {
    _marca = marca;
    
    NSString * text = [NSString stringWithFormat:@"%@ (%ld)", marca.name, marca.totalModelos];
    self.titleLabel.text = text ;
    NSString * imageName = marca.status ? @"syncronized" : @"pending";
    
    UIImage *img = [UIImage imageNamed:imageName];
    self.statusImage.image = img;
    
    [self.dataSyncLabel setText:marca.dataSyncFormatada];
}

@end
