//
//  ViewController.m
//  QuickLookTests
//
//  Created by Teobaldo Mauro de Moura on 9/8/15.
//  Copyright © 2015 Teobaldo Mauro de Moura. All rights reserved.
//

#import "ViewController.h"
#import <QuickLook/QuickLook.h>

// TIP: Suporta pacote Office, PDF e zip (simples)

@interface ViewController () <QLPreviewControllerDataSource, QLPreviewControllerDelegate> {
    NSArray *_itens;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Define a lista de arquivos a sereme exibidos
    _itens = @[
               [[NSBundle mainBundle] URLForResource:@"iOS Human Interface Guide" withExtension:@"pdf"],
               [[NSBundle mainBundle] URLForResource:@"Icons and Graphics" withExtension:@"pdf"]
    ];

}

- (IBAction)openQuickLook:(UIButton *)sender {
    // Verifica se o arquivo pode ser aberto no QuickLook
    if ([QLPreviewController canPreviewItem:_itens[0]]) {
        NSLog(@"PDF pode ser visualizado");
    }
    
    QLPreviewController *controller = [[QLPreviewController alloc] init];
    [controller setDataSource:self];
    [self presentViewController:controller animated:YES completion:nil];
}

#pragma mark - QLPreviewControllerDataSource

-(NSInteger)numberOfPreviewItemsInPreviewController:(QLPreviewController *)controller {
    return [_itens count];
}

-(id<QLPreviewItem>)previewController:(QLPreviewController *)controller previewItemAtIndex:(NSInteger)index {
    return [_itens objectAtIndex:index];
}

@end
