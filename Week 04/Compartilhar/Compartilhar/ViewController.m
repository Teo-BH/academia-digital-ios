//
//  ViewController.m
//  Compartilhar
//
//  Created by Teobaldo Mauro de Moura on 9/10/15.
//  Copyright © 2015 Teobaldo Mauro de Moura. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

-(IBAction)compartilhar:(UIButton *)sender {
    
    NSURL *url = [NSURL URLWithString:@"https://google.com"];
    NSArray *items = @[ url ];
    
    UIActivityViewController *share = [[UIActivityViewController alloc] initWithActivityItems:items
                                                                        applicationActivities:nil];
    
    // excluindo atividades
    share.excludedActivityTypes = @[ UIActivityTypePostToFacebook ];
    
    // Define Popover para ipad
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        share.modalPresentationStyle = UIModalPresentationPopover;
        share.popoverPresentationController.sourceView = sender;
        share.popoverPresentationController.sourceRect = sender.bounds;
    }
    
    [self presentViewController:share animated:YES completion:nil];
}

@end
