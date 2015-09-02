//
//  ViewController.m
//  DesafioEffectsVisuals
//
//  Created by Teobaldo Mauro de Moura on 9/1/15.
//  Copyright © 2015 Teobaldo Mauro de Moura. All rights reserved.
//

#import "ViewController.h"

/*

Barra de "Navegação":
- VisualEffects View com Blur e Vibrancy no Topo
- SegmentedControl com nome de algumas imagens dentro
- Botao para centralizar imagem
- Botao para aplicar um "AspectFit" manipulando o Zoom

ScrollView no fundo
- scrollView com zoom

Ao mudar o valor do segmento, troca a imagem no scrollView

*/

@interface ViewController () <UIScrollViewDelegate>

#define IMAGES @[ @"macarrao", @"pizza", @"churrasco", @"salada" ]

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imageViewHeightConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imageViewWidthConstraint;

@end

@implementation ViewController

-(void)viewDidLoad {
    [super viewDidLoad];
    
    // Inicialização
    [self deviceTouched:[self segmentedControl]];
    [self setupScrollViewZoom];
}

- (IBAction)deviceTouched:(UISegmentedControl *)sender {
    NSString *imageName = [IMAGES objectAtIndex:[sender selectedSegmentIndex]];
    UIImage *image = [UIImage imageNamed:imageName];
    
    [[self imageView] setImage:image];
    [[self imageViewHeightConstraint] setConstant:image.size.height];
    [[self imageViewWidthConstraint] setConstant:image.size.width];
}

-(void)setupScrollViewZoom {
    [[self scrollView] setMinimumZoomScale:1];
    [[self scrollView] setMaximumZoomScale:2];
}

- (IBAction)centerTouched:(UIButton *)sender {
    // TODO: Revisar os cálculos matemáticos
    CGRect center = CGRectMake(0, 0, 0, 0);
    center.origin.x = self.imageView.image.size.width / 2.0;
    center.origin.y = self.imageView.image.size.height / 2.0;
    center.origin.x -= self.scrollView.frame.size.width / 2.0;
    center.origin.y -= self.scrollView.frame.size.height / 2.0;
    center.size = self.scrollView.frame.size;
    
    [[self scrollView] scrollRectToVisible:center animated:YES];
}

- (IBAction)aspectFitTouched:(UIButton *)sender {
    // calcula o AspectFit
    float pw = self.scrollView.frame.size.width / self.imageView.image.size.width;
    float ph = self.scrollView.frame.size.height / self.imageView.image.size.height;
    //float zoom = MAX(pw, ph); // AspectFill
    float zoom = MIN(pw, ph); // AspectFit
    
    // Aplica o AspectFit
    [[self scrollView] setMinimumZoomScale:zoom];
    [[self scrollView] setZoomScale:zoom animated:YES];
}

#pragma mark - Zoom

-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return [self imageView];
}

-(void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(CGFloat)scale {
    // não requer código
}

@end
