//
//  CommentTableViewCell.m
//  DesafioBlog
//
//  Created by Teobaldo Mauro de Moura on 9/4/15.
//  Copyright © 2015 Teobaldo Mauro de Moura. All rights reserved.
//

#import "CommentTableViewCell.h"
#import "Comment.h"

@interface CommentTableViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UITextView *bodyTextView;
@property (weak, nonatomic) IBOutlet UILabel *emailLabel;

@end

@implementation CommentTableViewCell

-(void)setComment:(Comment *)comment {
    [[self nameLabel] setText:[comment name]];
    [[self bodyTextView] setText:[comment body]];
    [[self emailLabel] setText:[comment email]];
    
    _comment = comment;
}

@end
