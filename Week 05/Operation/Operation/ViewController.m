//
//  ViewController.m
//  Operation
//
//  Created by Teobaldo Mauro de Moura on 9/15/15.
//  Copyright © 2015 Teobaldo Mauro de Moura. All rights reserved.
//

#import "ViewController.h"
#import "Operacao.h"

#define DATASOURCE_URL @"http://www.raywenderlich.com/downloads/ClassicPhotosDictionary.plist"
#define CELL_ID @"CellID"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UILabel *downloadRestantesLabel;

@property (strong, nonatomic) NSDictionary *dataSource;
@property (strong, nonatomic) NSOperationQueue *queue;

@property (strong, nonatomic) NSMutableArray<UIImage *> *images;

@end

@interface ViewController (TableViewDataSource) <UITableViewDataSource>
@end

@interface ViewController (OperacaoDelegate) <OperacaoDelegate>
@end

@implementation ViewController {
    NSInteger total;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSURL *dataSourceUrl = [NSURL URLWithString:DATASOURCE_URL];
    NSDictionary *data = [NSDictionary dictionaryWithContentsOfURL:dataSourceUrl];
    [self setDataSource:data];
    
    [self setImages:[NSMutableArray array]];
}

- (IBAction)createOperationTouched:(UIButton *)sender {
    // 1) Cria a queue de operação
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    queue.name = @"Queue Download";
    
    // restringindo concorrência
    queue.maxConcurrentOperationCount = 3;
    
    // 2) Cria as operações
    total = 0;
    for (NSString *key in [[self dataSource] allKeys]) {
        // Define url
        NSString *urlText = [[self dataSource] objectForKey:key];
        if ([urlText isEqual: @"NO URL"]) {
            continue;
        }
        NSURL *url = [NSURL URLWithString:urlText];
        
        // Cria operação
        Operacao *op = [[Operacao alloc] initWithURL:url withDelegate:self];
        // ou
        // Operacao *op = [[Operacao alloc] initWithURL:url];
        // op.delegate = self;
        
        // dependencia
        // [op addDependency:(nonnull NSOperation *)]
        
        // prioridade
        [op setQueuePriority:NSOperationQueuePriorityVeryLow];
        
        // completion block
        [op setCompletionBlock:^{
            NSLog(@"op terminou");
        }];
        
        // adicionando operações
        [queue addOperation:op];
        
        // [Result] Opção 1: Handler
        [op setResultHandler:^void(UIImage *image) {
            /* [self syncDownloadImage:image]; */
        }];
        
        total += 1;
    }

    // listando as operações futuras
    NSLog(@"[%lu] %@", queue.operationCount, queue.operations);
    
    // pause
    // [queue setSuspended:YES];
    
    // cancela
    // [queue cancelAllOperations];
    
    [self setQueue:queue];
}

-(void)syncDownloadImage:(UIImage *)image {
    // Adiciona a image no TableView
    [[self images] addObject:image];
    [[self tableView] reloadData];

    // Atualiza a quantidade restante de downloads
    NSInteger pendings = total - self.images.count;
    NSString *message = [NSString stringWithFormat:@"Download restantes: %ld", pendings];
    [[self downloadRestantesLabel] setText:message];
}

@end

@implementation ViewController (TableViewDataSource)

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[self images] count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CELL_ID];
    
    UIImage *image = [[self images] objectAtIndex:[indexPath row]];
    [[cell imageView] setImage:image];
    
    return cell;
}

@end

@implementation ViewController (OperacaoDelegate)

// [Result] Opção 2: Delegate
-(void)OperacaoResult:(UIImage *)image {
    [self syncDownloadImage:image];
}

@end
