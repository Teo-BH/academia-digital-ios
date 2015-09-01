//
//  SegundaViewController.m
//  PresentViewController
//
//  Created by Teobaldo Mauro de Moura on 8/25/15.
//  Copyright © 2015 Teobaldo Mauro de Moura. All rights reserved.
//

#import "SegundaViewController.h"
#import "TerceiraViewController.h"

// Definido na propriedade 'Storyboard ID' da terceira tab
#define TERCEIRO_VIEW_CONTROLLER_ID @"TerceiroViewControllerID"

@implementation SegundaViewController

- (IBAction)nextViewTouched:(id)sender {
    
    // troca de tela via ViewController (classe)
    // nota: precisamos instanciar via storyboard senão não teremos a tela e sim um ViewController em branco
    TerceiraViewController *vc = [[self storyboard] instantiateViewControllerWithIdentifier:TERCEIRO_VIEW_CONTROLLER_ID];
    
    [self presentViewController:vc animated:YES completion:nil];
}


@end
