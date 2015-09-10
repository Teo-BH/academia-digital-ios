//
//  AFNetworking.m
//  Networking
//
//  Created by Teobaldo Mauro de Moura on 9/10/15.
//  Copyright © 2015 Teobaldo Mauro de Moura. All rights reserved.
//

#import "AlamoFire.h"
#import <AFNetworking/AFNetworking.h>

@implementation AlamoFire

-(void)GET {
    NSString *urlText = [NSString stringWithFormat:@"%@/get", URL_BASE];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:urlText
      parameters:nil
         success:^(AFHTTPRequestOperation *operation, id responseObject) {
             NSLog(@"JSON: %@", responseObject);
         }
         failure:^(AFHTTPRequestOperation *operation, NSError *error) {
             NSLog(@"Error: %@", error);
         }];
}

-(void)POST {
    NSString *urlText = [NSString stringWithFormat:@"%@/post", URL_BASE];
    NSDictionary *body = @{ @"chave": @"valor " };

    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager POST:urlText
       parameters:body
          success:^(AFHTTPRequestOperation *operation, id responseObject) {
              NSLog(@"JSON: %@", responseObject);
          }
          failure:^(AFHTTPRequestOperation *operation, NSError *error) {
              NSLog(@"Error: %@", error);
          }];
}

@end
