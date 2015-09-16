//
//  ViewController.m
//  Fabricando
//
//  Created by Teobaldo Mauro de Moura on 9/16/15.
//  Copyright © 2015 Teobaldo Mauro de Moura. All rights reserved.
//

#import "ViewController.h"
#import <DigitsKit/DigitsKit.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    /* Login automático
    DGTAuthenticateButton *authenticateButton = [DGTAuthenticateButton buttonWithAuthenticationCompletion:^(DGTSession *session, NSError *error) {
        // play with Digits session
        if (session != nil) {
            NSLog(@"Phone number: %@", session.phoneNumber);
            NSLog(@"UserID: %@", session.userID);
            
        }
    }];
    
    authenticateButton.center = self.view.center;
    [self.view addSubview:authenticateButton];
    */
    
    // Logout
    // [[Digits sharedInstance] logOut];
}

- (IBAction)logarTouched:(UIButton *)sender {
    // Login mudando a aparência
    DGTAppearance *appearance = [DGTAppearance new];
    appearance.backgroundColor = [UIColor blackColor];
    appearance.accentColor = [UIColor orangeColor];

    [[Digits sharedInstance] authenticateWithDigitsAppearance:appearance
                                               viewController:nil
                                                        title:nil
                                                   completion:^(DGTSession *session, NSError *error) {
        if (session != nil) {
            NSLog(@"%@", session.phoneNumber);
        }
    }];
    
    
    /* Login Simples
    [[Digits sharedInstance] authenticateWithCompletion:^(DGTSession *session, NSError *error) {
        if (session != nil) {
            NSLog(@"%@", session.phoneNumber);
        }
    }];
    */
}

@end
