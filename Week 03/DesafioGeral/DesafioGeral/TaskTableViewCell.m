//
//  TaskTableViewCell.m
//  DesafioGeral
//
//  Created by Teobaldo Mauro de Moura on 9/2/15.
//  Copyright © 2015 Teobaldo Mauro de Moura. All rights reserved.
//

#import "TaskTableViewCell.h"

@interface TaskTableViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *taskNameLabel;
@property (weak, nonatomic) IBOutlet UISwitch *taskDoneSwitch;

@end

@implementation TaskTableViewCell

-(void)setTask:(TaskData *)task {
    [[self taskNameLabel] setText:[task name]];
    [[self taskDoneSwitch] setOn:[task done]];
    _task = task;
}

- (IBAction)taskDoneChanged:(UISwitch *)sender {
    if ([self task]) {
        [[self task] setDone:sender.isOn];
    }
}

@end
