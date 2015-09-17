//
//  DetailTableViewController.h
//  StarWarsFanBoy
//
//  Created by Teobaldo Mauro de Moura on 9/17/15.
//  Copyright © 2015 Teobaldo Mauro de Moura. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ModelBase.h"

@interface DetailTableViewController : UITableViewController

@property (nonatomic, strong) ModelBase *data;

@end
