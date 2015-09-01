//
//  VolumeViewController.m
//  Conversor
//
//  Created by Teobaldo Mauro de Moura on 8/26/15.
//  Copyright © 2015 Teobaldo Mauro de Moura. All rights reserved.
//

#import "VolumeViewController.h"

@interface VolumeViewController ()

@property (weak, nonatomic) IBOutlet UITextField *litroTextField;

@property (weak, nonatomic) IBOutlet UILabel *galaoLabel;
@property (weak, nonatomic) IBOutlet UILabel *m3Label;
@property (weak, nonatomic) IBOutlet UILabel *cm3Label;

@end

@implementation VolumeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self litroTextFieldEdited:self.litroTextField];
}

- (IBAction)litroTextFieldEdited:(UITextField *)sender {
    double litro = [self.litroTextField.text doubleValue];
    
    self.galaoLabel.text = [NSString stringWithFormat:@"%.2f", litro * 0.264172];
    self.m3Label.text = [NSString stringWithFormat:@"%.6f", litro * 0.001];
    self.cm3Label.text = [NSString stringWithFormat:@"%.10f", litro * 0.001 * 0.001];
}

@end
