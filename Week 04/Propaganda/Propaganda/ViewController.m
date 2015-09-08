//
//  ViewController.m
//  Propaganda
//
//  Created by Teobaldo Mauro de Moura on 9/8/15.
//  Copyright © 2015 Teobaldo Mauro de Moura. All rights reserved.
//

#import "ViewController.h"
#import <iAd/iAd.h>

@interface ViewController () <ADBannerViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error {
    NSLog(@"%@ %@", NSStringFromSelector(_cmd), error);
}

-(void)bannerViewDidLoadAd:(ADBannerView *)banner {
    NSLog(@"%@", NSStringFromSelector(_cmd));
}

-(BOOL)bannerViewActionShouldBegin:(ADBannerView *)banner willLeaveApplication:(BOOL)willLeave {
    // Permite sair da aplicação no clique da propaganda
    return YES;
}

@end
