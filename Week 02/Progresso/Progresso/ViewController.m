//
//  ViewController.m
//  Progresso
//
//  Created by Teobaldo Mauro de Moura on 8/26/15.
//  Copyright © 2015 Teobaldo Mauro de Moura. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) IBOutletCollection(UIActivityIndicatorView) NSArray *spinners;
@property (weak, nonatomic) IBOutlet UIProgressView *progressBar;

@end

@implementation ViewController


-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    // liga os spinners
    [self performSelector:@selector(ligarSpinners) withObject:nil afterDelay:5];
    
    // Progress Bar
    [self incrementarProgresso];
}

#pragma mark - Spinners

// Tip: Existe um Spinner NetworkIndicator para uso em requisição web 

-(void)ligarSpinners {
    for (UIActivityIndicatorView *spinner in [self spinners]) {
        [spinner startAnimating];
    }
    // ou
    //[[self spinners] makeObjectsPerformSelector:@selector(startAnimating)];
    
    // desliga os spinners
    [self performSelector:@selector(desligarSpinners) withObject:nil afterDelay:10];
}

-(void)desligarSpinners {
    //for (UIActivityIndicatorView *spinner in [self spinners]) {
    //    [spinner stopAnimating];
    //}
    // ou
    [[self spinners] makeObjectsPerformSelector:@selector(stopAnimating)];
}

#pragma mark - Progress Bar

-(void)incrementarProgresso {
    // Checar se progresso não é 100%
    if ([[self progressBar] progress] < 1) {
        
        // incrementar
        [[self progressBar] setProgress:([[self progressBar] progress] + 0.1)];
        // ou
        //self.progressBar.progress = self.progressBar.progress + 1;
        // ou
        //_progressBar.progress = _progressBar.progress;
        
        // agendar para 1 segundo
        [self performSelector:@selector(incrementarProgresso) withObject:nil afterDelay:1];
    }
}

@end
