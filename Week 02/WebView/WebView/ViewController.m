//
//  ViewController.m
//  WebView
//
//  Created by Teobaldo Mauro de Moura on 8/26/15.
//  Copyright © 2015 Teobaldo Mauro de Moura. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *URLTextField;
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UIToolbar *toolbar;

@end

@interface ViewController (WebViewDelegate) <UIWebViewDelegate>
@end

@interface ViewController (TextFieldDelegate) <UITextFieldDelegate>
@end

@implementation ViewController

-(void)viewDidLoad {
    [super viewDidLoad];
    
    // colocando o conteúdo
    UIEdgeInsets inset = UIEdgeInsetsMake(0, 0, self.toolbar.frame.size.height, 0);
    [[[self webView] scrollView] setContentInset:inset];
    [[[self webView] scrollView] setScrollIndicatorInsets:inset];
}

-(void)viewDidAppear:(BOOL)animated {
    //[self viewDidAppear:animated];
    
    // carrega na 1˚ execução
    //[self carregaPagina:@"https://wwww.google.com"];
}

// TIP: Ligar as ações do WebView nos botões dentro da Storyboard

-(void)carregaPagina:(NSString *)address {
    // carregar a página
    NSURL *url = [NSURL URLWithString:address];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    [[self webView] loadRequest:request];
}

@end

@implementation ViewController (WebViewDelegate)

-(void)webViewDidStartLoad:(UIWebView *)webView {
    NSLog(@"%@", NSStringFromSelector(_cmd));
}

-(void)webViewDidFinishLoad:(UIWebView *)webView {
    // Obtém a url em javascript
    NSString *href = [webView stringByEvaluatingJavaScriptFromString:@"window.location.href"];
    [[self URLTextField] setText:href];
    
    NSLog(@"%@ %@", NSStringFromSelector(_cmd), href);
}

-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    NSLog(@"%@ %@", NSStringFromSelector(_cmd), error);
}

-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    return YES;
}

@end

@implementation ViewController (TextFieldDelegate)

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    // carrega a página
    [self carregaPagina:textField.text];
    
    // perca o foco e feche o teclado
    return [textField resignFirstResponder];
}

@end