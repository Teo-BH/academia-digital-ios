//
//  CommentViewController.h
//  DesafioBlog
//
//  Created by Teobaldo Mauro de Moura on 9/4/15.
//  Copyright © 2015 Teobaldo Mauro de Moura. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Post.h"

@interface CommentViewController : UIViewController

@property (strong, nonatomic) Post *post;
@property (strong, nonatomic) NSArray *comments;

@end
