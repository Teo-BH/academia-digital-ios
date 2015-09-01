//
//  SecondViewController.m
//  Conversor
//
//  Created by Teobaldo Mauro de Moura on 8/26/15.
//  Copyright © 2015 Teobaldo Mauro de Moura. All rights reserved.
//

#import "IdadeCaninaViewController.h"

@interface IdadeCaninaViewController ()

@property (weak, nonatomic) IBOutlet UITextField *idadeTextField;
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;

@end

@implementation IdadeCaninaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self idadeTextFieldEdited:self.idadeTextField];
}

- (IBAction)idadeTextFieldEdited:(UITextField *)sender {
    double idade = [sender.text doubleValue];
    
    double result = 0;
    if (idade <= 2)
        result = idade * 10.5;
    else    
    {
        result = 2 * 10.5;
        result += (idade - 2) * 5.74;
    }
    
    self.resultLabel.text = [NSString stringWithFormat: @"%.1f", result];
}


@end
