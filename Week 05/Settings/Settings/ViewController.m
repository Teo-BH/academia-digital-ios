//
//  ViewController.m
//  Settings
//
//  Created by Teobaldo Mauro de Moura on 9/14/15.
//  Copyright © 2015 Teobaldo Mauro de Moura. All rights reserved.
//

#import "ViewController.h"

#define NAME_PREF @"name_preference"
#define SWITCH_PREF @"enabled_preference"
#define SLIDER_PREF @"slider_preference"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UISwitch *toggleSwitch;
@property (weak, nonatomic) IBOutlet UISlider *slider;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (IBAction)readTouched:(UIButton *)sender {
    // Leitura das preferências
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *name = [userDefaults objectForKey:NAME_PREF];
    NSNumber *enabled = [userDefaults objectForKey:SWITCH_PREF];
    NSNumber *slider = [userDefaults objectForKey:SLIDER_PREF];
    
    NSLog(@"%@ - %@ - %@", name, enabled, slider);
    
    // Preenchendo as propriedades da view
    [[self nameTextField] setText:name];
    [[self toggleSwitch] setOn:[enabled boolValue]];
    [[self slider] setValue:[slider floatValue]];
}

- (IBAction)saveTouched:(UIButton *)sender {
    NSString *name = [[self nameTextField] text];
    NSNumber *enabled = [NSNumber numberWithBool:[[self toggleSwitch] isOn]];
    NSNumber *slider = [NSNumber numberWithFloat:[[self slider] value]];

    // Escreve as preferências
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:name forKey:NAME_PREF]; 
    [userDefaults setObject:enabled forKey:SWITCH_PREF];
    [userDefaults setObject:slider forKey:SLIDER_PREF];

    // NOTA: esses dados serão salvos quando o iOS decidir
    //       porém podemos forçar isso usando o método abaixo
    BOOL status = [userDefaults synchronize];
    
    NSLog(@"Status de salvar as preferências: %@", status ? @"Ok" : @"Falha");
}

@end
