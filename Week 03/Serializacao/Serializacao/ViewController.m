//
//  ViewController.m
//  Serializacao
//
//  Created by Teobaldo Mauro de Moura on 9/4/15.
//  Copyright © 2015 Teobaldo Mauro de Moura. All rights reserved.
//

#import "ViewController.h"
#import "Post.h"

#define FILENAME @"post.data"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Criação do objeto
    Post *p = [Post new];
    p.titulo = @"Teste";
    p.conteudo = @"Lorem Ipsum Sit Amet";
    p.data = [NSDate new];
    
    
    // TODO: pegar path do Documents ou Cache
    NSString *path = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)[0];
    path = [path stringByAppendingPathComponent:FILENAME];
    
#pragma mark - ESCREVENDO
    
    // Serialização em memória
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:p];
    [data writeToFile:path atomically:YES];
    
    // OU
    
    // Serialização para arquivo
    BOOL status = [NSKeyedArchiver archiveRootObject:p toFile:path];
    
#pragma mark - LENDO
    
    // TODO: pegar o path de Documents ou Cache
    // NSString *path;
    
    // - deserializando o objeto
    NSData *dataBin = [NSData dataWithContentsOfFile:path];
    Post *post = [NSKeyedUnarchiver unarchiveObjectWithData:dataBin];
    
    // OU
    
    post = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    
}


@end
