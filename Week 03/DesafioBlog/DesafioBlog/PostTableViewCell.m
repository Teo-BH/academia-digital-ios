//
//  PostTableViewCell.m
//  DesafioBlog
//
//  Created by Teobaldo Mauro de Moura on 9/4/15.
//  Copyright © 2015 Teobaldo Mauro de Moura. All rights reserved.
//

#import "PostTableViewCell.h"

@interface PostTableViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *bodyLabel;

@end

@implementation PostTableViewCell

-(void)setPost:(Post *)post {
    [[self titleLabel] setText:[post title]];
    [[self bodyLabel] setText:[post body]];
    _post = post;
}

@end
