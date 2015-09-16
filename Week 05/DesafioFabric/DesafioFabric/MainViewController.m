//
//  MainViewController.m
//  DesafioFabric
//
//  Created by Teobaldo Mauro de Moura on 9/16/15.
//  Copyright © 2015 Teobaldo Mauro de Moura. All rights reserved.
//

#import "MainViewController.h"
#import <DigitsKit/DigitsKit.h>
#import "AppDefine.h"

@interface MainViewController ()

@property (weak, nonatomic) IBOutlet UILabel *userLabel;

@end

@implementation MainViewController

-(void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *userText = [NSString stringWithFormat:@"User ID: %@", [[[Digits sharedInstance] session] userID]];
    [[self userLabel] setText:userText];
}

- (IBAction)logoffTouched:(UIButton *)sender {
    // Logout
    [[Digits sharedInstance] logOut];
    
    // Retorna para o Login
    UIViewController *view = [self.storyboard instantiateViewControllerWithIdentifier:LOGIN_VIEW_CONTROLLER];
    [self presentViewController:view animated:YES completion:nil];
}

@end
