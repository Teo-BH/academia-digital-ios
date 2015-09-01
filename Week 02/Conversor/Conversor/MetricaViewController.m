//
//  FirstViewController.m
//  Conversor
//
//  Created by Teobaldo Mauro de Moura on 8/26/15.
//  Copyright © 2015 Teobaldo Mauro de Moura. All rights reserved.
//


// 7 Tabs
// Conversões
//  - Metricas
//    - digitar metros
//    - botão converter
//    - labels:
//      - km, cm, ft, yd
//  - Idade Canina
//    - digitar idade canina
//    - labels:
//      - idade * 7
//      - maneira "correta"i < 2 ? *= 10 : 4
//  - Moedas:
//    - digitar real
//    - labels:
//      - dolar (*3.7)
//      - euro (*4.0)
//      - libra (*5.0)
//  - IMC:
//    - digitar peso e altura
//    - label:
//      - imc -> peso / altura ^ 2
// - Volume:
//   - digitar litros
//   - labels:
//     - galoes
//     - m^3
//     - cm^3

#import "MetricaViewController.h"

@interface MetricaViewController ()

@property (weak, nonatomic) IBOutlet UITextField *meterTextField;

@property (weak, nonatomic) IBOutlet UILabel *kmLabel;
@property (weak, nonatomic) IBOutlet UILabel *cmLabel;
@property (weak, nonatomic) IBOutlet UILabel *ftLabel;
@property (weak, nonatomic) IBOutlet UILabel *ydLabel;

@end

@implementation MetricaViewController

-(void)viewDidAppear:(BOOL)animated {
    [self meterTextFieldEdited:self.meterTextField];
}

- (IBAction)meterTextFieldEdited:(UITextField *)sender {
    double value = [sender.text doubleValue];
    
    self.kmLabel.text = [NSString stringWithFormat: @"%.2f", (value / 1000.0)];
    self.cmLabel.text = [NSString stringWithFormat:@"%.0f", (value * 100)];
    self.ftLabel.text = [NSString stringWithFormat:@"%.2f", (value * 3.28084)];
    self.ydLabel.text = [NSString stringWithFormat:@"%.2f", (value * 1.09361)];
}

@end
