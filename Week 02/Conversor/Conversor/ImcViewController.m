//
//  ImcViewController.m
//  Conversor
//
//  Created by Teobaldo Mauro de Moura on 8/26/15.
//  Copyright © 2015 Teobaldo Mauro de Moura. All rights reserved.
//

#import "ImcViewController.h"

@interface ImcViewController ()

@property (weak, nonatomic) IBOutlet UITextField *pesoTextField;
@property (weak, nonatomic) IBOutlet UITextField *alturaTextField;

@property (weak, nonatomic) IBOutlet UILabel *imcLabel;

@end

@implementation ImcViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self pesoAlturaTextFieldEdited:nil];
}

- (IBAction)pesoAlturaTextFieldEdited:(UITextField *)sender {
    double peso = [self.pesoTextField.text doubleValue];
    double altura = [self.alturaTextField.text doubleValue];
    
    double imc = peso / altura * altura;
    
    self.imcLabel.text = [NSString stringWithFormat:@"%.2f", imc];
};


@end
