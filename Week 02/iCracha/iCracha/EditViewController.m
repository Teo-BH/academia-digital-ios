//
//  EditViewController.m
//  iCracha
//
//  Created by Teobaldo Mauro de Moura on 8/25/15.
//  Copyright © 2015 Teobaldo Mauro de Moura. All rights reserved.
//

#import "EditViewController.h"

@interface EditViewController ()

@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *jobTitleTextField;
@property (weak, nonatomic) IBOutlet UITextField *bioTextField;

@end

@implementation EditViewController

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self fillControls];
}

-(void)setEmployee:(Employee *)employee {
    _employee = employee;
    
    // Controles devem ser preenchidos no viewDidApper
    //[self fillControls];
}

-(void)fillControls {
    self.nameTextField.text = self.employee.name;
    self.jobTitleTextField.text = self.employee.jobTitle;
    self.bioTextField.text = self.employee.bio;
}

- (IBAction)nameEdited:(UITextField *)sender {
    self.employee.name = sender.text;
}

- (IBAction)jobTitleEdited:(UITextField *)sender {
    self.employee.jobTitle = sender.text;
}
- (IBAction)bioEdited:(UITextField *)sender {
    self.employee.bio = sender.text;
}

- (IBAction)okButtonTouched:(UIButton *)sender {
  [self dismissViewControllerAnimated:YES completion:nil];
}

@end
