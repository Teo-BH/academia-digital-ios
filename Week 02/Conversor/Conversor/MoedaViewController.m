//
//  MoedaViewController.m
//  Conversor
//
//  Created by Teobaldo Mauro de Moura on 8/26/15.
//  Copyright © 2015 Teobaldo Mauro de Moura. All rights reserved.
//

#import "MoedaViewController.h"

@interface MoedaViewController ()

@property (weak, nonatomic) IBOutlet UITextField *valueTextField;

@property (weak, nonatomic) IBOutlet UILabel *dolarLabel;
@property (weak, nonatomic) IBOutlet UILabel *euroLabel;
@property (weak, nonatomic) IBOutlet UILabel *libraLabel;

@end

@implementation MoedaViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self valueTextFieldEdited:self.valueTextField];
}

- (IBAction)valueTextFieldEdited:(UITextField *)sender {
    double value = [sender.text doubleValue];
    
    self.dolarLabel.text = [NSString stringWithFormat:@"%.2f", value * 3.7];
    self.euroLabel.text = [NSString stringWithFormat:@"%.2f", value * 4.0];
    self.libraLabel.text = [NSString stringWithFormat:@"%.2f", value * 5.0];
}

@end