//
//  ViewController.m
//  Mensagens
//
//  Created by Teobaldo Mauro de Moura on 9/9/15.
//  Copyright © 2015 Teobaldo Mauro de Moura. All rights reserved.
//

#import "EmailViewController.h"
#import <MessageUI/MessageUI.h>

@interface EmailViewController () <MFMailComposeViewControllerDelegate>

@property (weak, nonatomic) IBOutlet UIButton *sendEmailButton;

@end

@implementation EmailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Email disponível ?
    [[self sendEmailButton] setEnabled:[MFMailComposeViewController canSendMail]];
}

- (IBAction)sendEmail:(UIButton *)sender {

    MFMailComposeViewController *email = [[MFMailComposeViewController alloc] init];
    
    // delegate
    [email setMailComposeDelegate:self];

    // assunto
    [email setSubject:@"CI&T - Academia Digital - Teste"];
    
    // destinatarios
    [email setToRecipients:@[ @"teobaldo.bh@hotmail.com" ]];
    
    // copia e copia oculta
    // [email setCcRecipients:[NSArray array]];
    // [email setBccRecipients:[NSArray array]];
    
    // mensagem
    [email setMessageBody:@"CI&T - Academia Digital - Teste" isHTML:NO];
    
    // anexo
    // [email addAttachmentData:[[NSData alloc] init]
    //                 mimeType:[NSString string]
    //                 fileName:[NSString string]];
    
    // envia o email
    [self presentViewController:email animated:YES completion:nil];
}

#pragma mark - MFMailComposeViewControllerDelegate

-(void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error {
    NSLog(@"%d - %@", result, error);
    
    // Retorna para a primeira tela
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
