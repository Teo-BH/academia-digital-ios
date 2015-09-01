//
//  ViewController.m
//  DatePicker
//
//  Created by Teobaldo Mauro de Moura on 9/1/15.
//  Copyright © 2015 Teobaldo Mauro de Moura. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () {
    NSDateFormatter *_dateFormatter;
}

@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;

@end

@implementation ViewController

-(void)viewDidLoad {
    [super viewDidLoad];
    
    _dateFormatter = [[NSDateFormatter alloc] init];
    
    // formatando data para string:
    [_dateFormatter setDateFormat:@"yyyy/MM/dd HH:mm"];
    // ou
    //[_dateFormatter setDateStyle:NSDateFormatterShortStyle];
    [_dateFormatter setTimeStyle:NSDateFormatterShortStyle];
    
    // TimeZone
    //[_dateFormatter setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"PDT"]];
    
    // locale
    [_dateFormatter setLocale:[NSLocale localeWithLocaleIdentifier:@"fr_BR"]];
    
    //[[self datePicker] setMinimumDate:[NSDate date]];
    //[[self datePicker] setMaximumDate:[NSDate date]];
    
    // Adicionando NSDate (1 dia)
    //NSDate *date = [NSDate date];
    //[date dateByAddingTimeInterval:60*60*1];
    
}

- (IBAction)datePickerChanged:(UIDatePicker *)sender {
    NSLog(@"%@", [sender date]);
    // usando o formatador
    NSLog(@"%@", [_dateFormatter stringFromDate:[sender date]]);
}

@end
