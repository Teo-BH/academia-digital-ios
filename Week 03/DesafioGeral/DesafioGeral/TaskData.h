//
//  TaskData.h
//  DesafioGeral
//
//  Created by Teobaldo Mauro de Moura on 9/2/15.
//  Copyright © 2015 Teobaldo Mauro de Moura. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TaskData : NSObject

@property NSString *name;
@property BOOL done;


- (instancetype)initWitName:(NSString *)name;

@end
