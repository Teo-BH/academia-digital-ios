//
//  ListTableViewController.h
//  StarWarsFanBoy
//
//  Created by Teobaldo Mauro de Moura on 9/16/15.
//  Copyright © 2015 Teobaldo Mauro de Moura. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EntityMetadata.h"

@interface ListTableViewController : UITableViewController

@property (nonatomic, strong) EntityMetadata *entity;

@end
