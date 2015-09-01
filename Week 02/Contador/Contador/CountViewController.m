//
//  ViewController.m
//  Contador
//
//  Created by Teobaldo Mauro de Moura on 8/28/15.
//  Copyright © 2015 Teobaldo Mauro de Moura. All rights reserved.
//

//Desafio Contador (Parte 1)
//
//TabBar
//
//Tela 1:
//label display valor atual
//botão incrementador
//botão zerar
//* fazer classe contador ("modelo")
//
//cada vez que zerar salva o resultado anterior num array
//que sera exibido na tela 2
//
//Tela 2:
//tableView com lista de valores do contador

#import "CountViewController.h"
#import "TabBarController.h"
#import "Count.h"

@interface CountViewController ()

@property (weak, nonatomic) IBOutlet UILabel *numberLabel;
@property (readonly) Count *count;

@end

@implementation CountViewController


-(UIStatusBarStyle)preferredStatusBarStyle {
    // Define a barra de estilo branca
    return UIStatusBarStyleLightContent;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Inicializa contador
    [self refreshLabel];
}

-(Count *)count {
    TabBarController *tabBar = (TabBarController *)[self tabBarController];
    return [tabBar count];
}

- (IBAction)countTouched:(UIButton *)sender {
    [[self count] increment];
    [self refreshLabel];
}

- (IBAction)zeroTouched:(UIButton *)sender {
    [[self count] reset];
    [self refreshLabel];
}

-(void)refreshLabel {
    [[self numberLabel] setText:[NSString stringWithFormat:@"%lu", [[self count] value]]];
}

@end
