//
//  ViewController.m
//  JSON
//
//  Created by Teobaldo Mauro de Moura on 9/8/15.
//  Copyright © 2015 Teobaldo Mauro de Moura. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self readJSON];
    [self writeJSON];
}

-(void)readJSON {
    NSString *jsonText = @"{ \"chave\": \"valor\" }";
    
    NSData *jsonData = [jsonText dataUsingEncoding:NSUTF8StringEncoding];
    NSError *error = nil;
    NSDictionary *jsonDict =  [NSJSONSerialization JSONObjectWithData:jsonData
                                                              options:0 //(NSJSONReadingMutableContainers | NSJSONReadingMutableLeaves)
                                                                error:&error];
    
    NSLog(@"%@", jsonDict);
}

-(void)writeJSON {
    NSDictionary *jsonDict = @{ @"chave": @"valor" };
    
    NSError *error = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:jsonDict
                                                       options:0 // NSJSONWritingPrettyPrinted
                                                         error:&error];
    
    NSString *jsonText = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    
    NSLog(@"%@", jsonText);
}

@end
