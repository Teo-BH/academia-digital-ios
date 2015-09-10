//
//  ViewController.m
//  GCD
//
//  Created by Teobaldo Mauro de Moura on 9/10/15.
//  Copyright © 2015 Teobaldo Mauro de Moura. All rights reserved.
//

#import "ViewController.h"

typedef void (^TipoBloco)(NSString *, NSError *);
typedef void (^TipoBlocoNomeado)(NSString *nome, NSError *error);

@interface ViewController ()
@property (nonatomic, copy) TipoBlocoNomeado handler;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // GCD (Grand Central Dispatch)
    // Sistema de "Threads" (pensar em queue)
    // - baseado em blocks (callbacks, lambdas, closures)
    // - threads são automaticamente criadas e destruídas quando necessário e possível
    // - não necessariamente um bloco rodará em uma thread separada, mas serão concorrentes
    
    // buscando uma queue do sistema
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0);
    
    // 1 - execução assincrona
    dispatch_async(queue, ^{
        NSLog(@"rodando em background");
        
        // na hora de atualizar interface *devemos* fazer em main_queue
        // (sync - retorna para thread principal imediatamente)
        dispatch_sync(dispatch_get_main_queue(), ^{
            NSLog(@"rodando em main");
        });
    });
    
    // 2 - acessando variáveis dentro do block
    NSString *nome = @"João"; // acesso normal
    __block NSInteger valor = 5;      // para alterar precisamos marcar a variável com __block
    __block NSNumber *preco;
    dispatch_async(queue, ^{
        valor += 9;
        preco = @(100);

        NSLog(@"Nome: %@", nome);
        NSLog(@"Valor: %ld", (long)valor);
        NSLog(@"Preço: %@", preco);
    });
    
    // 3 - rodando um loop em background
    dispatch_apply(10, queue, ^(size_t i) {
        // NOTA: não use logs aqui dentro => NSLog, printf, puts, etc
        //       todos os logs vão fazer um LOCK para escrever com isso os blocos não executará em paralelo
        //
        // * em swift pode user print() => ThreadSafe
    });
    
    // 4 - disparando bloco depois de um tempo (use a opção snippet)
    
    //dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(<#delayInSeconds#> * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
    //});
    // ou
    dispatch_time_t tempo = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC));
    dispatch_after(tempo, dispatch_get_main_queue(), ^{
        NSLog(@"Executado após 3 segundos");
    });
    
    // TIP: declarando blocks em http://fuckingblocksyntax.com/
    
    // tipoRetorno (^nomeBloco)(tipoParametros) = ^tipoRetorno(parametros) {
    // };
    void (^myBlock)(NSString *, NSError *) = ^(NSString *s, NSError *e) {
        NSLog(@"%@ - %@", s, e);
    };
    myBlock(@"Meu bloco...", nil);
    
    // usando o typedef
    TipoBloco outroBloco = ^(NSString *s, NSError *e) {
        NSLog(@"%@ - %@", s, e);
    };
    outroBloco(@"Meu outro bloco..", nil);
    
    // função com block
    [self executar:^(NSString *nome, NSError *error) {
        NSLog(@"%@ - %@", nome, error);
    }];
    
    // executando bloco vazio
    [self bloco]();
    
    // block em property
    [self setHandler:outroBloco]; // ou self.handler = outroBloco;
    [self handler](@"Meu bloco com propriedade", nil);
 
    NSLog(@"fim do viewDidLoad");
}

#pragma mark - função com block

-(void)executar:(TipoBlocoNomeado)bloco {
    bloco(@"executando...", nil);
}

-(void (^)(void))bloco {
    return ^{ NSLog(@"Bloco vazio"); };
}

@end
