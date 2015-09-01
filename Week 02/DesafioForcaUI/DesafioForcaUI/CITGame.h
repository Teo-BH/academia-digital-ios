//
//  CITGame.h
//  Forca
//
//  Created by Teobaldo Mauro de Moura on 8/21/15.
//  Copyright (c) 2015 Teobaldo Mauro de Moura. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CITGame : NSObject

@property (readonly) NSUInteger tries;
@property (readonly) NSString *answer;
@property (readonly) NSMutableString *word;
@property (readonly) NSUInteger lifes;

- (instancetype)initWithWord:(NSString *)value fromTry:(NSUInteger)tries;
- (BOOL)play:(NSString *)letter;

@end
