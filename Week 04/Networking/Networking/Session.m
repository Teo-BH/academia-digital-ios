//
//  Session.m
//  Networking
//
//  Created by Teobaldo Mauro de Moura on 9/10/15.
//  Copyright © 2015 Teobaldo Mauro de Moura. All rights reserved.
//

#import "Session.h"

@interface Session () <NSURLSessionDataDelegate> // base: NSURLSessionDelegate

@end

@implementation Session {
    NSURLSession *_session;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
        
        _session = [NSURLSession sessionWithConfiguration:config
                                                 delegate:self
                                            delegateQueue:[NSOperationQueue mainQueue]];
        
    }
    return self;
}

-(void)GET {
    NSString *urlText = [NSString stringWithFormat:@"%@/get", URL_BASE];
    NSURL *url = [NSURL URLWithString:urlText];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    // NSURLSession por delegate
    //NSURLSessionDataTask *task = [_session dataTaskWithRequest:request];
    //[task resume];
    // ou
    // NSURLSession por block
    [[_session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        [self sessionLog:data];
    }] resume];
}

-(void)POST {
    NSString *urlText = [NSString stringWithFormat:@"%@/post", URL_BASE];
    NSURL *url = [NSURL URLWithString:urlText];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    request.HTTPMethod = @"POST";
    
    NSString *body = @"{\"chave\": \"valor\"}";
    request.HTTPBody = [body dataUsingEncoding:NSUTF8StringEncoding];
    
    [[_session dataTaskWithRequest:request] resume];
}

-(void)sessionLog:(NSData *)data {
    NSString *body = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"%@", body);
}

#pragma mark - NSURLSessionDataDelegate

-(void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveData:(NSData *)data {
    [self sessionLog:data];
}


@end
