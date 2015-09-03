//
//  ViewController.m
//  KitDynamics
//
//  Created by Teobaldo Mauro de Moura on 9/3/15.
//  Copyright © 2015 Teobaldo Mauro de Moura. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController {
    // elementos
    NSMutableArray *_circulos;
    // animator
    UIDynamicAnimator *_animator;
    // comportamentos
    //UIDynamicBehavior -> simula classe abstrata
    UIGravityBehavior *_gravity;
    UICollisionBehavior *_collision;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _circulos = [NSMutableArray array];
    [self criarCirculo:CGRectMake(10, 50, 50, 50)];
    [self criarCirculo:CGRectMake(self.view.frame.size.width-60, 50, 50, 50)];
    [self criarAnimator];
    
    [self criaBotao];
}

-(void)criaBotao {
    // Snap Button
    UIButton *snapButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [snapButton setTitle:@"Snap!" forState:UIControlStateNormal];
    [snapButton addTarget:self
               action:@selector(snap)
     forControlEvents:UIControlEventTouchUpInside];
    [snapButton setFrame:CGRectMake(0, 0, 100, 30)];
    [snapButton setCenter:self.view.center];
    
    [[self view] addSubview:snapButton];
}

-(void)snap {
    UISnapBehavior *snap = [[UISnapBehavior alloc]
                            initWithItem:_circulos[1]
                            snapToPoint:self.view.center];
    [snap setDamping:0.2];
    [_animator addBehavior:snap];
}

-(void)criarCirculo:(CGRect)rect {
    UIView *view = [[UIView alloc] initWithFrame:rect];
    [view setBackgroundColor:[UIColor redColor]];
    [[view layer] setCornerRadius:rect.size.width / 2.0];
    [_circulos addObject:view];
    
    [self.view addSubview:view];
}

-(void)criarAnimator {
    // Inicializado com View de conteúdo
    _animator = [[UIDynamicAnimator alloc] initWithReferenceView:[self view]];
    
    // prepara os comportamentos
    _gravity = [[UIGravityBehavior alloc] init];
    //[_gravity setGravityDirection:CGVectorMake(1, 2)];
    [_gravity addItem:_circulos[0]];
    
    _collision = [[UICollisionBehavior alloc] init];
    [_collision setTranslatesReferenceBoundsIntoBoundary:YES];
    [_collision addItem:_circulos[0]];
    
    // adiciona behavior
    [_animator addBehavior:_gravity];
    [_animator addBehavior:_collision];
    
}

@end
