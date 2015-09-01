//
//  Count.h
//  Contador
//
//  Created by Teobaldo Mauro de Moura on 8/28/15.
//  Copyright © 2015 Teobaldo Mauro de Moura. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Count : NSObject

@property (readonly, nonatomic) NSUInteger value;
@property (readonly, nonatomic) NSMutableArray *history;

-(void)reset;
-(void)increment;

@end
