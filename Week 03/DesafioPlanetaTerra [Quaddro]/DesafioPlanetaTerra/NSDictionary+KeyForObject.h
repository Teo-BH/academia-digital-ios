//
//  NSDictionary+KeyForObject.h
//  DesafioPlanetaTerra
//
//  Created by Marcos Trovilho on 31/08/15.
//  Copyright (c) 2015 Marcos Trovilho. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (KeyForObject)
-(id<NSCopying>)keyForObject:(id)object;
@end
