//
//  ViewController.m
//  DesafioConversorTemperatura
//
//  Created by Teobaldo Mauro de Moura on 8/24/15.
//  Copyright © 2015 Teobaldo Mauro de Moura. All rights reserved.
//

#import "ViewController.h"
#import "Temperature.h"
#import "TemperatureType.h"

@interface ViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UILabel *resultLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *inputSegment;
@property (weak, nonatomic) IBOutlet UISegmentedControl *outputSegment;
@property (weak, nonatomic) IBOutlet UITextField *inputTextField;

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

- (IBAction)inputChanged:(id)sender {
    TemperatureType input = TemperaturaTypeMake(self.inputSegment.selectedSegmentIndex);
    TemperatureType output = TemperaturaTypeMake(self.outputSegment.selectedSegmentIndex);
    double value = [self.inputTextField.text doubleValue];
    
    NSString *endText = [self temperaturaText:output];
    double result = [self calcTemperature:value from:input to:output];
    self.resultLabel.text = [NSString stringWithFormat:@"Resultado: %.1f %@", result, endText];
}


-(NSString *)temperaturaText:(TemperatureType)type {
    switch (type) {
        case TemperatureFahrenheit: return @"˚F";
        case TemperatureKelvin: return @"K";
        default: return @"˚C";
    }
}

-(double)calcTemperature:(double)value from:(TemperatureType)input to:(TemperatureType)output {
    
    // Inicializa classe de Temperatura
    Temperature *t = nil;
    switch (input) {
        case TemperatureKelvin:
            t = [[Temperature alloc] initWithKelvin:value];
            break;
        case TemperatureFahrenheit:
            t = [[Temperature alloc] initWithFahrenheit:value];
            break;
        default:
            t = [[Temperature alloc] initWithCelsious:value];
            break;
    }
    
    // Retorna o resultado
    switch (output) {
        case TemperatureKelvin: return t.kelvin;
        case TemperatureFahrenheit: return t.fahrenheit;
        default: return t.celsious;
    }
}

@end
