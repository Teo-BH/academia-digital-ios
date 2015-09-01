//
//  ViewController.m
//  DesafioRGB
//
//  Created by Teobaldo Mauro de Moura on 8/24/15.
//  Copyright © 2015 Teobaldo Mauro de Moura. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *hexLabel;
@property (weak, nonatomic) IBOutlet UIView *colorView;

@property (weak, nonatomic) IBOutlet UISlider *redSlider;
@property (weak, nonatomic) IBOutlet UISlider *greenSlider;
@property (weak, nonatomic) IBOutlet UISlider *blueSlider;
@property (weak, nonatomic) IBOutlet UISlider *alphaSlider;
@property (weak, nonatomic) IBOutlet UILabel *redLabel;
@property (weak, nonatomic) IBOutlet UILabel *greenLabel;
@property (weak, nonatomic) IBOutlet UILabel *blueLabel;
@property (weak, nonatomic) IBOutlet UILabel *alphaLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)sliderChanged:(UISlider *)sender {
    // valores
    int red = self.redSlider.value;
    int green = self.greenSlider.value;
    int blue = self.blueSlider.value;
    int alpha = self.alphaSlider.value;
    
    // cor
    UIColor *color = [UIColor colorWithRed:red / 255.0
                                     green:green / 255.0
                                      blue:blue / 255.0
                                      alpha:alpha / 255.0];
    self.colorView.backgroundColor = color;
    
    // HEX
    self.hexLabel.text = [NSString stringWithFormat:@"HEX: %02X%X%X%X", red, green, blue, alpha];
    
    // Labels
    self.redLabel.text = [NSString stringWithFormat:@"R (%03d):", red];
    self.greenLabel.text = [NSString stringWithFormat:@"G (%03d):", green];
    self.blueLabel.text = [NSString stringWithFormat:@"B (%03d):", blue];
    self.alphaLabel.text = [NSString stringWithFormat:@"A (%03d):", alpha];
}
- (IBAction)randomColor:(id)sender {
    // sorteio
    self.redSlider.value = arc4random_uniform(256);
    self.greenSlider.value = arc4random_uniform(256);
    self.blueSlider.value = arc4random_uniform(256);
    self.alphaSlider.value = arc4random_uniform(256);
    
    [self sliderChanged:nil];
}

@end
