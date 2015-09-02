//
//  LoginViewController.m
//  DesafioGeral
//
//  Created by Teobaldo Mauro de Moura on 9/2/15.
//  Copyright © 2015 Teobaldo Mauro de Moura. All rights reserved.
//

#import "LoginViewController.h"
#import "SecurityHelper.h"

@interface LoginViewController ()

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *loginViewWidthConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *loginViewHeightConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *scrollViewBottomConstraint;

@property (weak, nonatomic) IBOutlet UITextField *loginNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *loginPasswordTextField;

@end

@interface LoginViewController (Notifications)

-(void)addNotifications;
-(void)removeNotifications;

@end

@interface LoginViewController (UITextFieldDelegate) <UITextFieldDelegate>

@end

@implementation LoginViewController

-(void)viewDidLoad {
    [[self loginNameTextField] becomeFirstResponder];
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self adjustLoginViewSize];
    [self addNotifications];
}

-(void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    
    [self removeNotifications];
}

-(void)adjustLoginViewSize {
    CGSize size = [[UIScreen mainScreen] bounds].size;
    CGFloat height = size.height;
    height -= [[UIApplication sharedApplication] statusBarFrame].size.height;
    height -= [[[self navigationController] navigationBar] frame].size.height;
    [[self loginViewHeightConstraint] setConstant:height];
    CGFloat width = size.width;
    [[self loginViewWidthConstraint] setConstant:width];
}

-(void)adjustScrollViewHeight:(CGFloat)keyboardHeight {
    [[self scrollViewBottomConstraint] setConstant:keyboardHeight];
}

- (IBAction)loginTouched:(UIButton *)sender {
    NSString *user = [[self loginNameTextField] text];
    NSString *password = [[self loginPasswordTextField] text];
    BOOL result = [SecurityHelper loginWithUser:user withPassword:password];
    if (!result) {
        UIAlertController * alert=   [UIAlertController alertControllerWithTitle:@"Autenticação"
                                                                         message:@"Usuário ou senha inválidos"
                                                                  preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK"
                                                           style:UIAlertActionStyleCancel
                                                         handler:^(UIAlertAction *action) {
                                                             // Posiciona no nome do usuário
                                                             [[self loginNameTextField] becomeFirstResponder];
                                                         }];
        [alert addAction:okAction];
        [self presentViewController:alert animated:YES completion:nil];
    } else {
        // TODO: próxima view...
    }
}

@end

@implementation LoginViewController (Notifications)

-(void)addNotifications {
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    
    [nc addObserver:self
           selector:@selector(keyboardDidShow:)
               name:UIKeyboardDidShowNotification
             object:nil];
    
    [nc addObserver:self
           selector:@selector(keyboardDidHide:)
               name:UIKeyboardDidHideNotification
             object:nil];
    
    [nc addObserver:self
           selector:@selector(orientationDidChange:)
               name:UIDeviceOrientationDidChangeNotification
             object:nil];
}

-(void)removeNotifications {
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    [nc removeObserver:self name:UIKeyboardDidShowNotification object:nil];
    [nc removeObserver:self name:UIKeyboardDidHideNotification object:nil];
    [nc removeObserver:self name:UIDeviceOrientationDidChangeNotification object:nil];
}

-(void)orientationDidChange:notification {
    [self adjustLoginViewSize];
}

-(void)keyboardDidShow:notification {
    // Calcula o tamanho do teclado
    NSValue *value = [[notification userInfo] objectForKey:UIKeyboardFrameBeginUserInfoKey];
    CGFloat keyboardHeight = [value CGRectValue].size.height;
    [self adjustScrollViewHeight:keyboardHeight];
}

-(void)keyboardDidHide:(NSNotification *) notification {
    [self adjustScrollViewHeight:0];
}

@end

@implementation LoginViewController (UITextFieldDelegate)

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (textField == [self loginNameTextField]) {
        return [[self loginPasswordTextField] becomeFirstResponder];
    } if (textField == [self loginPasswordTextField]) {
        BOOL result =  [textField resignFirstResponder];
        [self loginTouched:nil];
        return result;
    } else {
        return NO;
    }
}


@end