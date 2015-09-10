//
//  Connection.m
//  Networking
//
//  Created by Teobaldo Mauro de Moura on 9/10/15.
//  Copyright © 2015 Teobaldo Mauro de Moura. All rights reserved.
//

#import "Connection.h"

// NSURLConnection DEPRECATED => somente como referência de código legado
@implementation Connection

- (void)GET {
    NSString *urlText = [NSString stringWithFormat:@"%@/get", URL_BASE];
    NSURL *url = [NSURL URLWithString:urlText];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    NSURLResponse *response = nil;
    NSError *error = nil;
    
    NSData *data = [NSURLConnection sendSynchronousRequest:request
                                         returningResponse:&response
                                                     error:&error];
    NSString *body = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    
    NSLog(@"%@", body);
}

-(void)POST {
    NSString *urlText = [NSString stringWithFormat:@"%@/post", URL_BASE];
    NSURL *url = [NSURL URLWithString:urlText];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    request.HTTPMethod = @"POST";
    
    NSString *body = @"{\"chave\": \"valor\"}";
    request.HTTPBody = [body dataUsingEncoding:NSUTF8StringEncoding];
    
    void (^handler)(NSURLResponse *, NSData *, NSError *) = ^(NSURLResponse *response, NSData *data, NSError *error)
    {
        NSString *body = [[NSString alloc] initWithData:data
                                               encoding:NSUTF8StringEncoding];
        
        NSLog(@"%@", body);
    };
    
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue] // onde será executado o bloco 'completionHandler'
                           completionHandler:handler];
}

@end
