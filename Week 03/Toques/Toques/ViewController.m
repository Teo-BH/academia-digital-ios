//
//  ViewController.m
//  Toques
//
//  Created by Teobaldo Mauro de Moura on 9/3/15.
//  Copyright © 2015 Teobaldo Mauro de Moura. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController {
    BOOL _isTouching;
    CGPoint _centerOffSet;
    UIView *_quadrado;
}

-(void)viewDidLoad {
    [super viewDidLoad];
    
    // Obtém a View do Storyboard pela propriedade Tag
    _quadrado = [[self view] viewWithTag:3];
    
    // inicialização de variáveis
    _isTouching = false;
}

#pragma mark - Objective-C Functions

-(BOOL)containsPoint:(CGRect)rect withPoint:(CGPoint)point {
    // worst way
    //    return rect.origin.x                    <= point.x &&
    //           rect.origin.y                    <= point.y &&
    //           rect.origin.x + rect.size.width  >= point.x &&
    //           rect.origin.y + rect.size.height >= point.y;
    
    // best way
    return CGRectContainsPoint(rect, point);
}

-(CGPoint)anyTouchLocation:(NSSet<UITouch *> *)touches {
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInView:nil];  // nil => relativo ao window
    return location;
}

#pragma mark - C Functions

CGPoint CGPointDifToPoint(CGPoint p1, CGPoint p2) {
    return CGPointMake(p1.x - p2.x, p1.y - p2.y);
}

CGPoint CGPointAddToPoint(CGPoint p1, CGPoint p2) {
    return CGPointMake(p1.x + p2.x, p1.y + p2.y);
}

#pragma mark - Touches

/* Quando começa o toque */
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"%@", NSStringFromSelector(_cmd));
    NSLog(@"%@", touches);
    
    CGPoint location = [self anyTouchLocation:touches];
    
    // se tocou no quadrado e arrastou, movimenta ao quadrado
    _isTouching = [self containsPoint:_quadrado.frame withPoint:location];
    if (_isTouching) {
        UITouch *touch = [touches anyObject];
        CGPoint viewPoint = [touch locationInView:_quadrado];
        CGPoint centerPoint = CGPointMake(_quadrado.frame.size.width / 2, _quadrado.frame.size.height / 2);
        _centerOffSet = CGPointDifToPoint(centerPoint, viewPoint);
    }
}

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"%@", NSStringFromSelector(_cmd));
    NSLog(@"%@", touches);
    
    // arrastou o quadrado
    if (_isTouching) {
        CGPoint location = [self anyTouchLocation:touches];
        CGPoint newLocation = CGPointAddToPoint(location, _centerOffSet);
        _quadrado.center = newLocation;
    }
}

/* Quando solta o toque */
-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"%@", NSStringFromSelector(_cmd));
    NSLog(@"%@", touches);
    
    _isTouching = NO;
    
    /*
     * TIP: função útil com toques é remover o teclado ao tocar na tela
     * [_textField resignFirstResponder]
     */
}

/* Algo interrompeu o final do toque: saiu da tela, ... */
-(void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"%@", NSStringFromSelector(_cmd));
    NSLog(@"%@", touches);
    
    _isTouching = NO;
}

@end
