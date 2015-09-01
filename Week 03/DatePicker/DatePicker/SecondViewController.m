//
//  SecondViewController.m
//  DatePicker
//
//  Created by Teobaldo Mauro de Moura on 9/1/15.
//  Copyright © 2015 Teobaldo Mauro de Moura. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController () {
    NSDateFormatter *_dateFormatter;
}

@property (weak, nonatomic) IBOutlet UITextField *dateTextField;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;

@end

@implementation SecondViewController

-(void)viewDidLoad {
    [super viewDidLoad];
    
    // Inicializações
    _dateFormatter = [[NSDateFormatter alloc] init];
}

- (IBAction)convertTouched:(UIButton *)sender {
    // Leitura da Data
    [self formatDateFormatterToRead];
    NSString *text = [[self dateTextField] text];
    NSDate *date = [_dateFormatter dateFromString:text];
    
    // Escreve DatePicker
    //[[self datePicker] setDate:date];
    [[self datePicker] setDate:date animated:YES];
}

- (IBAction)datePickerChanged:(UIDatePicker *)sender {
    [self formatDateFormatterToWrite];
    NSString *label = [_dateFormatter stringFromDate:[sender date]];
    [[self dateLabel] setText:label];
}

-(void)formatDateFormatterToRead {
    [_dateFormatter setDateFormat:@"yyyy/MM/dd hh:mm:ss Z"];
}

-(void)formatDateFormatterToWrite {
    [_dateFormatter setDateStyle:NSDateFormatterLongStyle];
    [_dateFormatter setTimeStyle:NSDateFormatterLongStyle];
}

@end
