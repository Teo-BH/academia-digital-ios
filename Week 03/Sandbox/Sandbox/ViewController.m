//
//  ViewController.m
//  Sandbox
//
//  Created by Teobaldo Mauro de Moura on 9/3/15.
//  Copyright © 2015 Teobaldo Mauro de Moura. All rights reserved.
//

#import "ViewController.h"

#define NOME_ARQUIVO @"data.json"

typedef NS_ENUM(NSUInteger, ArquivoStatus) {
    ArquivoStatusCarregado = 0,
    ArquivoStatusCopiado = 1
};

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *nomeArquivoLabel;
@property (weak, nonatomic) IBOutlet UILabel *statusArquivoLabel;
@property (weak, nonatomic) IBOutlet UILabel *statusCopiaLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *destinoSegment;
@property (weak, nonatomic) IBOutlet UIButton *carregarArquivoButton;
@property (weak, nonatomic) IBOutlet UIButton *copiarAquivoButton;
@property (weak, nonatomic) IBOutlet UIButton *apagarTudoButton;

@end

@implementation ViewController

#pragma mark - View Lifecycle


-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [[self nomeArquivoLabel] setText:NOME_ARQUIVO];

    [[self carregarArquivoButton] setEnabled:YES];
    [[self copiarAquivoButton] setEnabled:NO];
    [[self apagarTudoButton] setEnabled:NO];
}

#pragma mark - Actions

-(NSString *)bundlePath {
    // NSArray *nomeArquivoArray = [NOME_ARQUIVO componentsSeparatedByString:@"."];
    // NSString *resourceName = [[NSBundle mainBundle] pathForResource:nomeArquivoArray[0] ofType:nomeArquivoArray[1]];
    // ou
    NSString *resourceName = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:NOME_ARQUIVO];
    return resourceName;
}

- (IBAction)carregarArquivoTouched:(UIButton *)sender {
    NSString *resourceName = [self bundlePath];
    BOOL existFile = [[NSFileManager defaultManager] fileExistsAtPath:resourceName];
    ArquivoStatus status = existFile ? ArquivoStatusCarregado : ArquivoStatusCopiado;
    
    [self setCarregarLabel:status];
    [self setCopiarEnabled:status];
}

-(NSString *)pathForDirectory:(NSSearchPathDirectory)destino {
    // encontrando pasta de documentos ou cache
    //[NSFileManager defaultManager] URLsForDirectory:<#(NSSearchPathDirectory)#> inDomains:<#(NSSearchPathDomainMask)#>
    // ou
    NSArray *diretorios = NSSearchPathForDirectoriesInDomains(destino, NSUserDomainMask, YES);
    NSString *path = diretorios[0];
    
    // NOTA: é necessário concatenar o nome do arquivo antes de copiar para o destino
    NSString *pathDestino = [path stringByAppendingPathComponent:NOME_ARQUIVO];
    
    return pathDestino;
}



// SANDBOX: aplicações independentes
// TIP: para realizar comunicação de aplicativos deve ser realizado via url, veja detalhes em http://x-callback-url.com
//      Exemplo: O Facebook usa essa funcionalidade para fazer autenticação quando APP está instalada

- (IBAction)copiarArquivoTouched:(id)sender {
    // define a origem
    NSString *pathOrigem = [self bundlePath];
    
    // define o destino (documentos ou cache)
    NSSearchPathDirectory destino = [[self destinoSegment] selectedSegmentIndex] == 0 ? NSDocumentDirectory : NSCachesDirectory;
    NSString *pathDestino = [self pathForDirectory:destino];
    
    // copiando
    NSError *error = nil;
    BOOL statusCopia = [[NSFileManager defaultManager] copyItemAtPath:pathOrigem toPath:pathDestino error:&error];
    
    if (error) {
        NSLog(@"Erro na Copia: %@", error);
    }
    
    // TODO: Tratar falha de existe arquivo
    ArquivoStatus status = statusCopia ? ArquivoStatusCopiado : ArquivoStatusCarregado;

    [self setCopiarEnabled:status];
    [self setStatusCopiarLabel:status];
    [self setDeletarEnabled:status];
}

-(BOOL)apagarPath:(NSSearchPathDirectory)destino {
    // define o destino (documentos ou cache)
    NSString *pathDestino = [self pathForDirectory:destino];

    NSError *error = nil;
    BOOL status = [[NSFileManager defaultManager] removeItemAtPath:pathDestino error:&error];
    
    if (error) {
        NSLog(@"Erro ao apagar: %@", error);
    }
    
    return status;
}

- (IBAction)apagarTudoTouched:(UIButton *)sender {
    BOOL statusDocument = [self apagarPath:NSDocumentDirectory];
    BOOL statusCache = [self apagarPath:NSCachesDirectory];
    
    NSLog(@"Status Apagar: D[%d] - C[%d]", statusDocument, statusCache);
    
    [self setDeletarEnabled:ArquivoStatusCarregado];
}

#pragma mark - Helpers

// TODO: define com o nome do arquivo = ok
// no viewDidApper configurar interface (mostra nome na label) = ok
//   - botão carregar enabled e resto não = ok
// ação do botão carregar, checar se o arquivo existe no bundle = ok
// e atualizar interface

-(void)setCarregarLabel:(ArquivoStatus)status {
    // se status -> carregado = ok
    // set label text "Status: Carregado" = ok
    if (status == ArquivoStatusCarregado) {
        [[self statusArquivoLabel] setText:@"Status: Carregado"];
    }
}

-(void)setStatusCopiarLabel:(ArquivoStatus)status {
    // se status -> copiado = ok
    // set label text "Status: Copiado" = ok
    if (status == ArquivoStatusCopiado) {
        [[self statusArquivoLabel] setText:@"Status: Copiado"];
    }
}

-(void)setCopiarEnabled:(ArquivoStatus)status {
    // se status -> carregado = ok
    // set button text "Descarregado" = ok
    // set destinoSegment enabled = ok
    // set copiarButton enabled = ok
    if (status == ArquivoStatusCarregado) {
        [[self carregarArquivoButton] setTitle:@"Descarregado" forState:UIControlStateNormal];
        [[self destinoSegment] setEnabled:YES];
        [[self copiarAquivoButton] setEnabled:YES];
    }
}

-(void)setDeletarEnabled:(ArquivoStatus)status {
    // set apagarButton enabled = ok
    BOOL enabled = (status == ArquivoStatusCopiado);
    [[self apagarTudoButton] setEnabled:enabled];
}

@end
