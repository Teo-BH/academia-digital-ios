//
//  ViewController.m
//  Textos
//
//  Created by Teobaldo Mauro de Moura on 8/24/15.
//  Copyright © 2015 Teobaldo Mauro de Moura. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextView *chatTextView;
@property (weak, nonatomic) IBOutlet UITextField *msgTextField;

@end

@implementation ViewController


- (IBAction)send:(UIButton *)sender {
    NSLog(@"%@", self.chatTextView.text);
    NSLog(@"%@", self.msgTextField.text);
    
    // colocar a mensagem no chat
    if (self.msgTextField.text.length) {
        NSString *newline = [self.msgTextField.text stringByAppendingString:@"\n"];
        NSString *chat = [self.chatTextView.text stringByAppendingString:newline];
        self.chatTextView.text = chat;
    }
    
    // apagar a mensagem do campo
    self.msgTextField.text = nil; // ou @""
}

#pragma mark - View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // feito via storyboard
    //self.msgTextField.delegate = self;
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    // sempre abrir o teclado quando entrar na tela
    [self.msgTextField becomeFirstResponder];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}

#pragma mark - UITextFieldDelegate

// Executado no Return do teclado
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    // enviar a mensagem
    [self send:nil];
    
    // Este método deve ser utilizado para consulta, não devendo 'enviar a mensagem'
    // porém não deve-se chamar o 'resignFirstResponder'para utilizar o -textFieldDidEndEditing
    
    return YES;
}

@end
