//
//  ViewController.m
//  Networking
//
//  Created by Teobaldo Mauro de Moura on 9/10/15.
//  Copyright © 2015 Teobaldo Mauro de Moura. All rights reserved.
//

#import "ViewController.h"
#import "Connection.h"
#import "Session.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;

@end

@implementation ViewController {
    id <Networking> _net[2];
    // ou
    //NSArray<Networking> *_array;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _net[0] = [Connection new];
    _net[1] = [Session new];
}

-(id<Networking>) networkingSelected {
    NSInteger index = [[self segmentedControl] selectedSegmentIndex];
    id<Networking> result = _net[index];
    return result;
}

- (IBAction)getTouched:(UIButton *)sender {
    id<Networking> networking = [self networkingSelected];
    [networking GET];
}

- (IBAction)postTouched:(UIButton *)sender {
    id<Networking> networking = [self networkingSelected];
    [networking POST];
}


@end
