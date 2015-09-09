//
//  ViewController.m
//  Social
//
//  Created by Teobaldo Mauro de Moura on 9/9/15.
//  Copyright © 2015 Teobaldo Mauro de Moura. All rights reserved.
//

#import "ViewController.h"
#import <Social/Social.h>

@interface ViewController () <UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@property (weak, nonatomic) IBOutlet UITextField *legendaTextField;
@property (weak, nonatomic) IBOutlet UIButton *botaoTwitter;
@property (weak, nonatomic) IBOutlet UIButton *botaoFacebook;
@property (weak, nonatomic) IBOutlet UIImageView *fotoImageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Habilitar os botões
    [[self botaoFacebook] setEnabled:[SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook]];
    [[self botaoTwitter] setEnabled:[SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter]];
}

- (IBAction)carregarImagem:(UIButton *)sender {
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    [picker setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    [picker setDelegate:self];
    [self presentViewController:picker animated:YES completion:nil];
}

-(IBAction)shareTwitter:(UIButton *)sender {
    [self share:SLServiceTypeTwitter];
}

-(IBAction)shareFacebook:(UIButton *)sender {
    [self share:SLServiceTypeFacebook];
}

-(void)share:(NSString *)serviceType {
    SLComposeViewController *share = [SLComposeViewController composeViewControllerForServiceType:serviceType];
    
    // texto
    [share setInitialText:@"CI&T - Academia Digital - Teste"];
    
    // imagem
    if ([[self fotoImageView] image])
        [share addImage:[[self fotoImageView] image]];
    
    // url
    [share addURL:nil];

    // Como receber resposta do share ?
    share.completionHandler = ^(SLComposeViewControllerResult result) {
        NSLog(@"Status do Compartilhamento = %@", result == SLComposeViewControllerResultDone ? @"OK" : @"Cancelado");
    };

    [self presentViewController:share animated:YES completion:nil];
}

#pragma mark - UIImagePickerControllerDelegate

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    [[self fotoImageView] setImage:image];
    [[self fotoImageView] setContentMode:UIViewContentModeScaleAspectFill];
    // Fecha o ImagePicker
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
