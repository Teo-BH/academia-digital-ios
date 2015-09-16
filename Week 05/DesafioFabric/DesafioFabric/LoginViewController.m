//
//  ViewController.m
//  DesafioFabric
//
//  Created by Teobaldo Mauro de Moura on 9/16/15.
//  Copyright © 2015 Teobaldo Mauro de Moura. All rights reserved.
//

#import "LoginViewController.h"
#import <DigitsKit/DigitsKit.h>
#import "AppDefine.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    // Login mudando a aparência
    DGTAppearance *appearance = [DGTAppearance new];
    appearance.backgroundColor = [UIColor whiteColor];
    appearance.accentColor = [UIColor blueColor];
    
    // Realiza Login
    [[Digits sharedInstance] authenticateWithPhoneNumber:@"+55"
                                        digitsAppearance:appearance viewController:nil
                                                   title:nil
                                              completion:^(DGTSession *session, NSError *error) {
                                                  NSLog(@"%@", session.phoneNumber);
                                                  [self showMainViewController];
                                                  
                                              }];
}

-(void)showMainViewController {
    UIViewController *view = [self.storyboard instantiateViewControllerWithIdentifier:MAIN_VIEW_CONTROLLER];
    [self presentViewController:view animated:YES completion:nil];
}

@end
