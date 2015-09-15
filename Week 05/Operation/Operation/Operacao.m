//
//  Operacao.m
//  Operation
//
//  Created by Teobaldo Mauro de Moura on 9/15/15.
//  Copyright © 2015 Teobaldo Mauro de Moura. All rights reserved.
//

#import "Operacao.h"

@interface Operacao ()
@property (strong, nonatomic) NSURL *URL;
@end

@implementation Operacao

- (instancetype)init
{
    return [self initWithURL:nil withDelegate:nil];
}

-(instancetype)initWithURL:(NSURL *)url {
    return [self initWithURL:url withDelegate:nil];
}

- (instancetype)initWithURL:(NSURL *)url withDelegate:(id<OperacaoDelegate>)delegate
{
    self = [super init];
    if (self) {
        _URL = url;
        _delegate = delegate;
    }
    return self;
}

// deve ser sobrescrito no NSOperation
-(void)main {
    NSData *imageData = [NSData dataWithContentsOfURL:[self URL]];
    
    UIImage *image = [UIImage imageWithData:imageData];
    NSLog(@"Download da url '%@'realizado.", [self URL]);
    
    // Retornando o resultado
    // opção 1:
   
    // if (self.delegate)
    if (self.delegate) {
        SEL selector = @selector(OperacaoResult:);
        [(NSObject *)self.delegate performSelectorOnMainThread:selector withObject:image waitUntilDone:NO];
    }
    
    // opção 2:
    // property operationHandler
    if (self.resultHandler) {
        // dispatch main operation (altera VIEW)
        dispatch_async(dispatch_get_main_queue(), ^{
            self.resultHandler(image);
        });
    }
}

@end
