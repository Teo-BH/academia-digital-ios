//
//  ViewController.m
//  Sombras
//
//  Created by Teobaldo Mauro de Moura on 9/8/15.
//  Copyright © 2015 Teobaldo Mauro de Moura. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) IBOutletCollection(UIView) NSArray *views;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self colocarSombra];
    [self colocarSombraTrapezoidal];
    [self colocarSombraEfeitoAlbum];
}

-(void)colocarSombra {
    UIView *view = [[self views] firstObject];
    CALayer *layer = [view layer];
    
    [layer setShadowColor:[[UIColor blackColor] CGColor]];
    [layer setShadowOpacity:0.7]; // De: 0.0 até 1.0
    
    [layer setShadowOffset:CGSizeMake(15, 15)];
    // ou
    //[layer setShadowOffset:CGSizeMake(0, 10)];
    //[layer setShadowRadius:15];
}


// Sombras com Formas
// Trapezoidal
//
//   _____
//  /     \
// /_______\
//
-(void)colocarSombraTrapezoidal {
    UIView *view = [[self views] objectAtIndex:1];
    CALayer *layer = [view layer];
    
    [layer setShadowColor:[[UIColor blackColor] CGColor]];
    [layer setShadowOpacity:0.7]; // De: 0.0 até 1.0
    
    // desenhando o trapézio
    UIBezierPath *trapezio = [UIBezierPath bezierPath];
    
    // anda com a "ponta da caneta"
    [trapezio moveToPoint:CGPointMake(view.frame.size.width * 0.33, view.frame.size.height * 0.66)];
    
    // desenha as linhas
    [trapezio addLineToPoint:CGPointMake(view.frame.size.width *  0.66, view.frame.size.height * 0.66)];
    [trapezio addLineToPoint:CGPointMake(view.frame.size.width *  1.15, view.frame.size.height * 1.15)];
    [trapezio addLineToPoint:CGPointMake(view.frame.size.width * -0.15, view.frame.size.height * 1.15)];
    
    // define o Path
    [layer setShadowPath:[trapezio CGPath]];
}

-(void)colocarSombraEfeitoAlbum {
    UIView *view = [[self views] lastObject];
    CALayer *layer = [view layer];
    
    [layer setShadowColor:[[UIColor blackColor] CGColor]];
    [layer setShadowOpacity:0.85]; // De: 0.0 até 1.0
    
    // efeito album
    // constantes de configuração
    CGFloat fatorDobra = 10.0;
    CGFloat profundidadeSombra = 15.0;
    
    // desenhando :)
    UIBezierPath *efeitoAlbum = [UIBezierPath bezierPath];
    [efeitoAlbum moveToPoint:CGPointMake(0, 0)];
    
    // linha horizontal superior
    [efeitoAlbum addLineToPoint:CGPointMake(view.bounds.size.width, 0)];
    
    // linha vertical direita
    [efeitoAlbum addLineToPoint:CGPointMake(view.bounds.size.width, view.bounds.size.height + profundidadeSombra)];
    
    // curva para efeito album
    [efeitoAlbum addCurveToPoint:CGPointMake(0,
                                             view.bounds.size.height + profundidadeSombra)
                   controlPoint1:CGPointMake(view.bounds.size.width  - fatorDobra,
                                             view.bounds.size.height + profundidadeSombra - fatorDobra)
                   controlPoint2:CGPointMake(fatorDobra,
                                             view.bounds.size.height + profundidadeSombra - fatorDobra)];
    // define o Path
    [layer setShadowPath:[efeitoAlbum CGPath]];
}

@end
