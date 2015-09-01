//
//  ImagensViewController.m
//  Imagens
//
//  Created by Teobaldo Mauro de Moura on 8/25/15.
//  Copyright © 2015 Teobaldo Mauro de Moura. All rights reserved.
//

#import "ImagensViewController.h"

// É cópiado para o código (NÃO USE ; e =)
#define IMAGE_ARRAY @[ @"donald", @"pluto", @"mickey", @"mine", @"pateta"]
#define IMAGE_RECT CGRectMake(0, 0, 375, 667)


@interface ImagensViewController ()

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;

@end

@interface ImagensViewController (ScrollViewDelegate) <UIScrollViewDelegate>

@end


@implementation ImagensViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 1) Pegar umas 5 imagens = OK
    //NSArray *IMAGE_ARRAY =  @[ @"donald", @"pluto", @"mickey", @"mine", @"pateta"];
    
    // 2) colocar os nome em um array (pode ser #define) = OK
    CGRect containerRect = IMAGE_RECT;
    containerRect.size.width =  containerRect.size.width * IMAGE_ARRAY.count;
    UIView *container = [[UIView alloc] initWithFrame:containerRect];

    // 3) criar os imageViews dinamicamente
    for (int i = 0; i < IMAGE_ARRAY.count; i++) {
        CGRect imageViewRect = IMAGE_RECT;
        imageViewRect.origin.x = i * IMAGE_RECT.size.width;
        
        UIImage *image = [UIImage imageNamed:IMAGE_ARRAY[i]];
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:imageViewRect];
        [imageView setContentMode:UIViewContentModeScaleAspectFit];
        [imageView setClipsToBounds:YES];
        [imageView setImage:image];
        
        [container addSubview:imageView];
    }
    
    // 4) adiciona-los numa view horizontalmente

    // 5) adicionar a view no scrollView
    [[self scrollView] addSubview:container];
    
    // 6) setar o 'contentSize' do scrollView para o 'frame' da view
    [[self scrollView] setContentSize:container.frame.size];
    
    // 7) habilitar a paginação no scrollview (nunca para no meio da imagem)
    [[self scrollView] setPagingEnabled:YES];
    
    // 8) page Control por delegate
    [[self pageControl] setNumberOfPages:[IMAGE_ARRAY count]]; // define a quantidade de páginas
    [[self scrollView]setShowsHorizontalScrollIndicator:NO]; // desliga o scroll horizontal
}

- (IBAction)pageControlChanged:(UIPageControl *)sender {
    // encontrar o contentOffset baseado na página tual
    int x = self.pageControl.currentPage * self.scrollView.frame.size.width;
    CGPoint point = self.scrollView.contentOffset;
    point.x = x;
  
    // mover para a página (com animação)
    [self.scrollView setContentOffset:point animated:YES];
}

@end

@implementation ImagensViewController (ScrollViewDelegate)

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSLog(@"%@", NSStringFromCGPoint(scrollView.contentOffset));
    
    // descobrir a página atual
    NSUInteger i = scrollView.contentOffset.x / scrollView.frame.size.width;
    
    // setar o 'currentPage' do 'pageControl'
    self.pageControl.currentPage = i;
}

@end