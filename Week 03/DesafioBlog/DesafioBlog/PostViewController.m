//
//  ViewController.m
//  DesafioBlog
//
//  Created by Teobaldo Mauro de Moura on 9/4/15.
//  Copyright © 2015 Teobaldo Mauro de Moura. All rights reserved.
//

#import "PostViewController.h"
#import "PostTableViewCell.h"
#import "CommentViewController.h"
#import "PostRepository.h"
#import "Post.h"

#define CELL_ID @"PostCellID"

@interface PostViewController ()

@property (strong, nonatomic) NSArray *posts;

@end

@implementation PostViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Carregando os dados
    [self setPosts:[PostRepository getAll]];
}

#pragma mark - UITableViewDelegate

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[self posts] count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PostTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CELL_ID];
    
    Post *post = [[self posts] objectAtIndex:[indexPath row]];
    [cell setPost:post];
    
    return cell;
}

#pragma mark - Segue

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    CommentViewController *view = [segue destinationViewController];
    
    NSIndexPath *indexPath = [[self tableView] indexPathForSelectedRow];
    Post *post = [[self posts] objectAtIndex:[indexPath row]];
    NSArray *comments = [PostRepository getCommentsWithPost:[post postId]];
    
    [view setPost:post];
    [view setComments:comments];
}

@end
