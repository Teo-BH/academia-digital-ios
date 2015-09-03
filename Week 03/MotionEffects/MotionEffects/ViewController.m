//
//  ViewController.m
//  MotionEffects
//
//  Created by Teobaldo Mauro de Moura on 9/3/15.
//  Copyright © 2015 Teobaldo Mauro de Moura. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIView *square;

@end

@implementation ViewController

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    // UIMotionEffect -> simula abstract

    // Parallax
    UIInterpolatingMotionEffect *paralax = [[UIInterpolatingMotionEffect alloc]
                                           initWithKeyPath:@"center.x" // executa a mensagem 'center.x' no square (adicionado o Motion Effect)
                                           type:UIInterpolatingMotionEffectTypeTiltAlongHorizontalAxis];
    [paralax setMinimumRelativeValue:@(-50)];
    [paralax setMaximumRelativeValue:@50];
    
    [[self square] addMotionEffect:paralax];
    
    // Sombra
    UIInterpolatingMotionEffect *sombra = [[UIInterpolatingMotionEffect alloc]
                                           initWithKeyPath:@"layer.shadowOffset"
                                           type:UIInterpolatingMotionEffectTypeTiltAlongHorizontalAxis];
    
    // (encapsula valores dentro do NSValue)
    NSValue *minValue = [NSValue valueWithCGSize:CGSizeMake(-10, 5)];
    NSValue *maxValue = [NSValue valueWithCGSize:CGSizeMake(10, 5)];
    
    [sombra setMinimumRelativeValue:minValue];
    [sombra setMaximumRelativeValue:maxValue];
    
    [[[self square] layer] setShadowOpacity:0.9];
    [[self square] addMotionEffect:sombra];
}

@end
