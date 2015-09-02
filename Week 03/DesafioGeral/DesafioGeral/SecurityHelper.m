//
//  SecurityHelper.m
//  DesafioGeral
//
//  Created by Teobaldo Mauro de Moura on 9/2/15.
//  Copyright © 2015 Teobaldo Mauro de Moura. All rights reserved.
//

#import "SecurityHelper.h"

@implementation SecurityHelper

#define SECURITY_URL @"http://%@:%@@httpbin.org/basic-auth/%@/%@"
#define SECURTIY_USER @"teo"
#define SECURITY_PASSWORD @"praque12"

+(BOOL)loginWithUser:(NSString *)user withPassword:(NSString *)password {
    NSString *urlText = [NSString stringWithFormat:SECURITY_URL, user, password, SECURTIY_USER, SECURITY_PASSWORD];
    
    NSURL *url = [NSURL URLWithString:urlText];

    // TODO: Remover o uso de cache com NSURLConnection (configurar o cache policy no init)
    NSData *data = [NSData dataWithContentsOfURL:url];
    
    NSError *error = nil;
    NSDictionary *result = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
    
    if (error) {
        NSLog(@"Falha de autenticação: %@", error);
        return NO;
    } else {
        NSNumber *flag = [result objectForKey:@"authenticated"];
        return [flag boolValue];
    }
}

@end
