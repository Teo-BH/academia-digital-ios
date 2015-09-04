//
//  CommentViewController.m
//  DesafioBlog
//
//  Created by Teobaldo Mauro de Moura on 9/4/15.
//  Copyright © 2015 Teobaldo Mauro de Moura. All rights reserved.
//

#import "CommentViewController.h"
#import "CommentTableViewCell.h"
#import "Post.h"
#import "Comment.h"

#define CELL_ID @"CommentCellID"

@interface CommentViewController () <UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UITextView *bodyTextView;

@end

@implementation CommentViewController

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];

    // Carrega os Posts
    [[self titleTextField] setText:[[self post] title]];
    [[self bodyTextView] setText:[[self post] body] ];
}

#pragma mark - UITableViewDataSource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[self comments] count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CommentTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CELL_ID];
    
    Comment *comment = [[self comments] objectAtIndex:[indexPath row]];
    [cell setComment:comment];
    
    return cell;
}

@end
