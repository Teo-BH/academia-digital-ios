//
//  EntityMetadata.h
//  StarWarsFanBoy
//
//  Created by Teobaldo Mauro de Moura on 9/16/15.
//  Copyright © 2015 Teobaldo Mauro de Moura. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EntityMetadata : NSObject

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSURL *url;

- (instancetype)initWithName:(NSString *) name withURL:(NSURL *)url;

@end
