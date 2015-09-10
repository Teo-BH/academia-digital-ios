//
//  SMSViewController.m
//  Mensagens
//
//  Created by Teobaldo Mauro de Moura on 9/10/15.
//  Copyright © 2015 Teobaldo Mauro de Moura. All rights reserved.
//

#import "SMSViewController.h"
#import <ContactsUI/ContactsUI.h>
#import <MessageUI/MessageUI.h>

@interface SMSViewController () <CNContactPickerDelegate, MFMessageComposeViewControllerDelegate>

@property (weak, nonatomic) IBOutlet UILabel *contatoLabel;
@property (weak, nonatomic) IBOutlet UITextField *mensagemTextField;
@property (weak, nonatomic) IBOutlet UIButton *enviaMensagemButton;

@end

@implementation SMSViewController {
    NSArray *_phones;
}

-(void)viewDidLoad {
    [super viewDidLoad];
 
    [self enableControls];
}

-(void)enableControls {
    BOOL enabled = [MFMessageComposeViewController canSendText] && _phones && [_phones count] > 0;
    [[self enviaMensagemButton] setEnabled:enabled];
}

-(IBAction)selecionarContato:(UIButton *)sender {
    CNContactPickerViewController *contact;
    contact = [[CNContactPickerViewController alloc] init];
    [contact setDelegate:self];
    [contact setDisplayedPropertyKeys:@[ CNContactPhoneNumbersKey ]]; // define as informações do contato a serem exibidas
    
    [self enableControls];
    [self presentViewController:contact animated:YES completion:nil];
}

- (IBAction)enviarMensagem:(UIButton *)sender {
    MFMessageComposeViewController *message;
    message = [[MFMessageComposeViewController alloc] init];
    [message setMessageComposeDelegate:self];
    
    message.recipients = _phones;
    [message setBody:[[self mensagemTextField] text]];
    
    [self presentViewController:message animated:YES completion:nil];
}

#pragma mark - CNContactPickerDelegate

-(void)contactPickerDidCancel:(CNContactPickerViewController *)picker {
    NSLog(@"%@", NSStringFromSelector(_cmd));
}

-(void)contactPicker:(CNContactPickerViewController *)picker didSelectContactProperty:(CNContactProperty *)contactProperty {
    NSLog(@"%@", contactProperty);
    
    NSString *name = [NSString stringWithFormat:@"%@ %@", contactProperty.contact.givenName, contactProperty.contact.familyName];
    [[self contatoLabel] setText:name];
}

#pragma mark - MFMessageComposeViewControllerDelegate

-(void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result {
    NSLog(@"%d", result);
    
    // Retorna para a primeira tela
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
