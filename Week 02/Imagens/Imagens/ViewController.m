//
//  ViewController.m
//  Imagens
//
//  Created by Teobaldo Mauro de Moura on 8/25/15.
//  Copyright © 2015 Teobaldo Mauro de Moura. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () {
    UIImageView *_imageView;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    // ImageView do Storyboard
    
    
    // Pesquisa os componentes com a Tag definida (acessando pela Tag)
    UIImageView *imageView = (UIImageView *)[[self view] viewWithTag:10];
    NSLog(@"%@", imageView);
    
    // A propriedade subview retorna todos os controles da tela
    for (UIView *v in [[self view] subviews]) {
        NSLog(@"%@", v);
    }
    
    // ImageView via código
    CGRect rect = CGRectMake(0, 400, 300, 300);
    _imageView = [[UIImageView alloc] initWithFrame:rect];
    // também podemos inicializar com imagem, assim o tamanho já é inferido pelo tamanho
    //_imageView = [[UIImageView alloc] initWithImage:<#(nullable UIImage *)#>]
    
    // contentMode: como vai ser desenhada (AspectFill/Fit, Scale)
    [_imageView setContentMode:UIViewContentModeScaleAspectFit];
    
    // UIImage
    UIImage *image = [UIImage imageNamed:@"queijo"];
    [_imageView setImage:image];
    
    // adicionar na tela
    [[self view] addSubview:_imageView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
