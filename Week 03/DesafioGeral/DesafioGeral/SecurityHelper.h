//
//  SecurityHelper.h
//  DesafioGeral
//
//  Created by Teobaldo Mauro de Moura on 9/2/15.
//  Copyright © 2015 Teobaldo Mauro de Moura. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SecurityHelper : NSObject

+(BOOL)loginWithUser:(NSString *)user withPassword:(NSString *)password;

@end
