//
//  ViewController.m
//  ScrollView
//
//  Created by Teobaldo Mauro de Moura on 8/25/15.
//  Copyright © 2015 Teobaldo Mauro de Moura. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (nonatomic) UIImageView *imageView;

@end

#define IMAGE_NAME @"disney"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // adicionar imagem
    UIImage *image = [UIImage imageNamed:IMAGE_NAME];
    self.imageView = [[UIImageView alloc] initWithImage:image];
    [self.scrollView addSubview:self.imageView];
    
    // setar contentSize
    self.scrollView.contentSize = self.imageView.frame.size;
    
    // habilizar o zoom
    // - propriedades min/max zoom com valores diferentes
    [self.scrollView setMinimumZoomScale:1]; // 1 => 100%
    [self.scrollView setMaximumZoomScale:2];
    
    // - implementar métodos de delegate
    // Lembretes
    // 1) Ligue o delegate do ScrollView no StoryBoard
    // 2) Para simular o Scroll clique no botão option do teclado
}

#pragma mark - UIScrollViewDelegate

// a documentação determina a implementação deste método, porém funcionando sem ele no iOS 8
-(void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(CGFloat)scale {
    NSLog(@"Terminou Zoom em: %.1f", scale);
}

// determina a View que será realizado zoom (mapas, imagens, ...)
-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return self.imageView;
}

@end
