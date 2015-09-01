//
//  NSDictionary+KeyForObject.m
//  DesafioPlanetaTerra
//
//  Created by Marcos Trovilho on 31/08/15.
//  Copyright (c) 2015 Marcos Trovilho. All rights reserved.
//

#import "NSDictionary+KeyForObject.h"

@implementation NSDictionary (KeyForObject)

-(id<NSCopying>)keyForObject:(id)object {
    for (id<NSCopying> key in self) {
        if ([[self objectForKey:key] isEqual:object]) {
            return key;
        }
    }
    
    return nil;
}

@end
