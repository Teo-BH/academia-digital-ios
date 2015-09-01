//
//  ViewController.m
//  iCracha
//
//  Created by Teobaldo Mauro de Moura on 8/25/15.
//  Copyright © 2015 Teobaldo Mauro de Moura. All rights reserved.
//

#import "ViewController.h"
#import "Employee.h"
#import "EditViewController.h"

@interface ViewController () {
    int index;
}

@property (weak, nonatomic) IBOutlet UIImageView *photoImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *jobTitleLabel;

@property (weak, nonatomic) IBOutlet UIScrollView *badgeScrollView;

@end

#define EDIT_VIEW_CONTROLLER @"EditViewControllerID"
#define IMAGE_RECT CGRectMake(0, 0, 128, 128)
#define IMAGE_MARGIN 40

@implementation ViewController {
    NSMutableArray *employees;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // iCracha
    // Classe Funcionario/Pessoa (modelo)
    //  - nome, cargo, bio, foto, badges
    //
    // ViewController Exibir
    //  - mostrar dados. bagdes (scrollView)
    //                   bonus |) () (|
    //  - botão editar no chamado outro ViewController
    //
    // ViewController Editar
    //  - campos editáveis de texto com as mesmas informações da tela exibir
    //  - botão 'pronto'para voltar as informações para tela anterior
    
    
    // Preenche a lista de funcionários
    [self fillEmployees];
}

-(void)fillEmployees {
    employees = [[NSMutableArray alloc] init];
    
    // Teobaldo
    NSArray *b1 = @[[UIImage imageNamed:@"first"],
                    [UIImage imageNamed:@"second"],
                    [UIImage imageNamed:@"red"],
                    [UIImage imageNamed:@"blue"]];
    Employee *e1 = [[Employee alloc] initWithName:@"Teobaldo"
                                          withJob:@"Developer"
                                          withBio:@"Cabelo preto, 1,60 M"
                                        withPhoto:[UIImage imageNamed:@"tmoura"]
                                       withBadges:b1];
    [employees addObject:e1];
    
    // Wallace
    NSArray *b2 = @[[UIImage imageNamed:@"third"],
                    [UIImage imageNamed:@"pink"],
                    [UIImage imageNamed:@"green"]];
    Employee *e2 = [[Employee alloc] initWithName:@"Wallace"
                                          withJob:@"Developer"
                                          withBio:@"Cabelo preto, 1,75 M"
                                        withPhoto:[UIImage imageNamed:@"wgoncalves"]
                                       withBadges:b2];
    [employees addObject:e2];
    
    // Vivian
    NSArray *b3 = @[[UIImage imageNamed:@"first"],
                    [UIImage imageNamed:@"second"],
                    [UIImage imageNamed:@"third"],
                    [UIImage imageNamed:@"yellow"]];
    Employee *e3 = [[Employee alloc] initWithName:@"Vivian"
                                          withJob:@"Developer"
                                          withBio:@"ops"
                                        withPhoto:[UIImage imageNamed:@"vrosa"]
                                       withBadges:b3];
    [employees addObject:e3];
    
    // Define index inicial
    index = 0;
}

-(void)fillControls:(Employee *) employee {
    self.nameLabel.text = employee.name;
    self.jobTitleLabel.text = employee.jobTitle;
    self.photoImageView.image = employee.photo;
    
    
    // Limpa os Badges
    for (UIView *subview in self.badgeScrollView.subviews) {
        [subview removeFromSuperview];
    }
    
    // Criar o container com o tamanho total
    CGRect containerRect = IMAGE_RECT;
    containerRect.size.width =  (containerRect.size.width + IMAGE_MARGIN) * employee.badges.count;
    UIView *container = [[UIView alloc] initWithFrame:containerRect];
    
    // Cria as views dinamicamento (badges)
    for (int i = 0; i < employee.badges.count; i++) {
        CGRect imageViewRect = IMAGE_RECT;
        imageViewRect.origin.x = i * (IMAGE_RECT.size.width + IMAGE_MARGIN);
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:imageViewRect];
        [imageView setImage:employee.badges[i]];
        [imageView setContentMode:UIViewContentModeScaleAspectFit];
        //[imageView setClipsToBounds:YES]; // limita o desenho dentro do componente
        
        [container addSubview:imageView];
    }
    
    // adicionar a view no scrollView
    [self.badgeScrollView addSubview:container];
    
    // setar o 'contentSize' do scrollView para o 'frame' da view
    [self.badgeScrollView setContentSize:container.frame.size];
}

- (IBAction)editButtonTouched:(UIButton *)sender {
    // Criar a View pelo Storyboard
    EditViewController *editView = [[self storyboard] instantiateViewControllerWithIdentifier:EDIT_VIEW_CONTROLLER];
    // Define o Empregado
    [editView setEmployee:employees[index]];
    // Exibe a view
    [self presentViewController:editView animated:YES completion:nil];
}

- (void)viewDidAppear:(BOOL)animated {
    // Atualiza os dados sempre que a View for exibida (inicio ou editView)
    [self fillControls:employees[index]];
}

#pragma mark - index

- (IBAction)previousButtonTouched:(UIButton *)sender {
    if (index > 0) {
        index--;
        [self fillControls:employees[index]];
    }
}

- (IBAction)nextButtonTouched:(UIButton *)sender {
    if (index < employees.count - 1) {
        index++;
        [self fillControls:employees[index]];
    }
}

@end
