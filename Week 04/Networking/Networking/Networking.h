//
//  NetworkingProtocol.h
//  Networking
//
//  Created by Teobaldo Mauro de Moura on 9/10/15.
//  Copyright © 2015 Teobaldo Mauro de Moura. All rights reserved.
//

#import <Foundation/Foundation.h>

#define URL_BASE @"http://httpbin.org"

@protocol Networking <NSObject>

-(void)GET;
-(void)POST;

@end
