//
//  TabBarController.m
//  Contador
//
//  Created by Teobaldo Mauro de Moura on 8/28/15.
//  Copyright © 2015 Teobaldo Mauro de Moura. All rights reserved.
//

#import "TabBarController.h"
#import "Count.h"

@interface TabBarController ()

@end

@implementation TabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _count = [[Count alloc] init];
}

@end
