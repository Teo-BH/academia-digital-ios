//
//  DetailTableViewCell.m
//  StarWarsFanBoy
//
//  Created by Teobaldo Mauro de Moura on 9/17/15.
//  Copyright © 2015 Teobaldo Mauro de Moura. All rights reserved.
//

#import "DetailTableViewCell.h"

@interface DetailTableViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *valueLabel;

@end

@implementation DetailTableViewCell

-(void)setTitle:(NSString *)title withValue:(NSString *)value {
    [[self titleLabel] setText:title];
    [[self valueLabel] setText:value];
}

@end
