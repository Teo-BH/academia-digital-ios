//
//  AttributedViewController.m
//  PickerView
//
//  Created by Teobaldo Mauro de Moura on 9/1/15.
//  Copyright (c) 2015 Teobaldo Mauro de Moura. All rights reserved.
//

#import "AttributedViewController.h"

#define DATA @[ @"Brasil", @"Argentina", @"Paraguai" ]

@interface AttributedViewController () <UIPickerViewDataSource, UIPickerViewDelegate>

@end

@implementation AttributedViewController

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return [DATA count];
}

// Tip: Sobrepõe o método 'titleForRow', podendo retornar qualquer View (imagens, ..)
-(NSAttributedString *)pickerView:(UIPickerView *)pickerView attributedTitleForRow:(NSInteger)row forComponent:(NSInteger)component {
    // Inicialização
    NSString *data = [DATA objectAtIndex:row];
    NSMutableAttributedString *nomePais = [[NSMutableAttributedString alloc] initWithString:data];
    
    // fundo
    [nomePais addAttribute:NSBackgroundColorAttributeName
                     value:[UIColor lightGrayColor]
                     range:NSMakeRange(0, [nomePais length])];
    
    /* if ([data isEqual:@"Brasil"]) */ {
        // brasil em verde
        NSRange range = NSMakeRange(0, [nomePais length] / 3);
        [nomePais addAttribute:NSForegroundColorAttributeName
                         value:[UIColor greenColor]
                         range:range];
        
        // brasil em amarelo
        range.location += [nomePais length] / 3;
        [nomePais addAttribute:NSForegroundColorAttributeName
                         value:[UIColor yellowColor]
                         range:range];
        
        // brasil em blueColor
        range.location += [nomePais length] / 3;
        [nomePais addAttribute:NSForegroundColorAttributeName
                         value:[UIColor blueColor]
                         range:range];
    }

    return nomePais;
}

@end
