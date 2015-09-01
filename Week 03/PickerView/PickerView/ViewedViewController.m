//
//  ViewedViewController.m
//  PickerView
//
//  Created by Teobaldo Mauro de Moura on 9/1/15.
//  Copyright (c) 2015 Teobaldo Mauro de Moura. All rights reserved.
//

#import "ViewedViewController.h"

#define IMAGE_FRAME CGRectMake(0, 0, 100, 100)

@interface ViewedViewController () <UIPickerViewDataSource, UIPickerViewDelegate>
@property (copy) NSArray *images; // copia 'automaticamente' imagens, mas deve ser acessar pelo [self setImages:xxx]
@end

@implementation ViewedViewController

-(void)viewDidLoad {
    [super viewDidLoad];
    
    NSMutableArray *images = [NSMutableArray array];
    
    for (int i = 1; i < 6; i++) {
        [images addObject:[NSString stringWithFormat:@"badge%d", i]];
    }
    
    [self setImages:images];
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return [[self images] count];
}

// Tip: Sobrepõe os métodos 'attributedTitleForRow' e 'titleForRow', podendo retornar qualquer View (imagens, ..)
-(UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view {
    
    // reutilizando a view
    UIImageView *imageView = (UIImageView *)view;
    
    if (!imageView) {
        imageView = [[UIImageView alloc] initWithFrame:IMAGE_FRAME];
        [imageView setContentMode:UIViewContentModeScaleAspectFit];
    }

    NSString *imageName = [[self images] objectAtIndex:row];
    UIImage *image = [UIImage imageNamed:imageName];
    [imageView setImage:image];

    return imageView;
}

-(CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component {
    return IMAGE_FRAME.size.height;
}

@end
