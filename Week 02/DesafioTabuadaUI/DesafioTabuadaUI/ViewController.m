//
//  ViewController.m
//  DesafioTabuadaUI
//
//  Created by Teobaldo Mauro de Moura on 8/24/15.
//  Copyright © 2015 Teobaldo Mauro de Moura. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () {
    /* UILabel *valorLabels[100]; */
    UILabel *valorLabels[10][10];
}

@property (weak, nonatomic) IBOutlet UISegmentedControl *numberSegment;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // criar linhas
    for (int l = 1; l <= 10; l++) {
        CGRect r = CGRectMake(16, 70 + (25 * l), 30, 25);
        UILabel *label = [[UILabel alloc] initWithFrame:r];
        [label setText:[NSString stringWithFormat:@"%d", l]];
        [label setTextAlignment:NSTextAlignmentCenter];
        [[label layer] setBorderWidth:1];
        [label setBackgroundColor:[UIColor grayColor]];
        
        // adiciona o label na tela
        [[self view] addSubview:label];
    }
    
    // criar colunas
    for (int c = 1; c <= 10; c++) {
        CGRect r = CGRectMake(16 + (30 * c), 70, 30, 25);
        UILabel *label = [[UILabel alloc] initWithFrame:r];
        [label setText:[NSString stringWithFormat:@"%d", c]];
        [label setTextAlignment:NSTextAlignmentCenter];
        [[label layer] setBorderWidth:1];
        [label setBackgroundColor:[UIColor grayColor]];
        
        // adiciona o label na tela
        [[self view] addSubview:label];
    }
    
    // cria linhas x colunas
    for (int l = 1; l <= 10; l++) {
        for (int c = 1; c <= 10; c++) {
            CGRect r = CGRectMake(16 + (30 * c), 70 + (25 * l), 30, 25);
            UILabel *label = [[UILabel alloc] initWithFrame:r];
            [label setText:[NSString stringWithFormat:@"%d", l * c]];
            [label setTextAlignment:NSTextAlignmentCenter];
            [[label layer] setBorderWidth:1];
            
            // adiciona o label na tela
            [[self view] addSubview:label];
            /* valorLabels[l - 1 + (c - 1) * 10] = label; */
            valorLabels[l - 1][c - 1] = label;
        }
    }
    
    // força o preenchimento
    [self numberChanged:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)numberChanged:(UISegmentedControl *)sender {
    for (int l = 1; l <= 10; l++) {
        for (int c = 1; c <= 10; c++) {
            /* int index = l - 1 + (c - 1) * 10; */
            int selected = (int)sender.selectedSegmentIndex + 1;
            
            if (l == selected || c == selected) {
                /* valorLabels[index].backgroundColor = [UIColor yellowColor]; */
                valorLabels[l - 1][c - 1].backgroundColor = UIColor.yellowColor;
            } else {
                /* valorLabels[index].backgroundColor = [UIColor clearColor]; */
                valorLabels[l - 1][c - 1].backgroundColor = UIColor.clearColor;
            }
        }
    }
}


@end
