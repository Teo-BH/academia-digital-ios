//
//  ViewController.m
//  DesafioForcaUI
//
//  Created by Teobaldo Mauro de Moura on 8/24/15.
//  Copyright © 2015 Teobaldo Mauro de Moura. All rights reserved.
//

#import "ViewController.h"
#import "CITGame.h"

@interface ViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UILabel *vidasLabel;
@property (weak, nonatomic) IBOutlet UILabel *palavraLabel;
@property (weak, nonatomic) IBOutlet UITextField *chuteTextField;

@property (nonatomic) CITGame *forca;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [[self chuteTextField] becomeFirstResponder];
    [self reset:nil];
}

- (IBAction)reset:(id)sender {
    NSArray *palavras = @[ @"Putz", @"Hello", @"World"];
    
    int index = arc4random_uniform((int)palavras.count);
    NSString *palavra = [palavras objectAtIndex:index];
    self.forca = [[CITGame alloc] initWithWord:palavra fromTry:6];
}

-(void)setLifes:(NSUInteger)count {
    NSMutableString *v = [NSMutableString string];
    for (int i = 1; i <= count; i++) {
        [v appendString:@"♥️"];
    }
    self.vidasLabel.text = v;
}

-(void)setWord:(NSString *)word {
    self.palavraLabel.text = word;
}

-(void)play:(NSString *)letter {
    // chutar
    [self.forca play:letter];
    
    // atualizar interface
    [self setLifes:self.forca.lifes];
    [self setWord:self.forca.word];
}

#pragma mark - UITextFieldDelegate

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    NSLog(@"%@ - %@", textField.text, string);
    textField.text = string;
    [self play:string];
    
    return NO;
}


@end
