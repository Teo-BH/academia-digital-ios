//
//  PrimeiraViewController.m
//  PresentViewController
//
//  Created by Teobaldo Mauro de Moura on 8/25/15.
//  Copyright © 2015 Teobaldo Mauro de Moura. All rights reserved.
//

#import "PrimeiraViewController.h"


@interface PrimeiraViewController ()

@end

#define SECOND_VIEW_SEGUE_ID @"ShowSecondViewID"

@implementation PrimeiraViewController

- (IBAction)nextViewTouched:(UIButton *)sender {
    // trocando de tela via segue pelo StoryBoard
    [self performSegueWithIdentifier:SECOND_VIEW_SEGUE_ID sender:sender];
}


@end
