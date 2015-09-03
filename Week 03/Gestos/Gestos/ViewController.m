//
//  ViewController.m
//  Gestos
//
//  Created by Teobaldo Mauro de Moura on 9/3/15.
//  Copyright © 2015 Teobaldo Mauro de Moura. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic) UIView *quadrado;
@property (weak, nonatomic) IBOutlet UIView *retangulo;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(150, 150, 100, 100)];
    view.layer.borderColor = [[UIColor redColor] CGColor];
    view.layer.borderWidth = 1;
    [self setQuadrado:view];
    [[self view] addSubview:view];
    
    // Adicionando um detector de Toques
    // UIGestureRecognizer => super classe (Tip: Objective-C não existe classe abstrata)
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(tapGesture:)];
    [tap setNumberOfTapsRequired:3]; // Toque na tela com => dois toques
    [tap setNumberOfTouchesRequired:2]; // Toque na tela com => três dedos
    [[self quadrado] addGestureRecognizer:tap];
}

-(void)tapGesture:(UITapGestureRecognizer *)gesture {
    NSLog(@"%@", NSStringFromSelector(_cmd));
}

- (IBAction)swipeGesture:(UISwipeGestureRecognizer *)sender {
    NSLog(@"%@", NSStringFromSelector(_cmd));
}

- (IBAction)pinchGesture:(UIPinchGestureRecognizer *)sender {
    /*
    CGRect tamanho = self.retangulo.frame;
    tamanho.size.width += sender.scale;
    tamanho.size.height += sender.scale;
    
    CGPoint centro = self.retangulo.center;
    self.retangulo.frame = tamanho;
    self.retangulo.center. = centro;
    */
    
    self.retangulo.transform = CGAffineTransformMakeScale(sender.scale, sender.scale);
}

@end
