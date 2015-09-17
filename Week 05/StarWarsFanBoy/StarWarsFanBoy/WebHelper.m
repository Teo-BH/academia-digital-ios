//
//  WebHelper.m
//  StarWarsFanBoy
//
//  Created by Teobaldo Mauro de Moura on 9/16/15.
//  Copyright © 2015 Teobaldo Mauro de Moura. All rights reserved.
//

#import "WebHelper.h"

@implementation WebHelper

+(NSDictionary *)requestUrl:(NSString *) urlText  {
    NSURL *url = [NSURL URLWithString:urlText];
    
    NSData *data = [NSData dataWithContentsOfURL:url];
    
    NSError *error = nil;
    NSDictionary *result = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
    
    if (error) {
        NSLog(@"Falha na leitura da url: %@, conforme descrito: %@", url, error);
        return nil;
    } else {
        return result;
    }
}
@end
