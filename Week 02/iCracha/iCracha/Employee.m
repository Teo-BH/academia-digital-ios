//
//  Employee.m
//  iCracha
//
//  Created by Teobaldo Mauro de Moura on 8/25/15.
//  Copyright © 2015 Teobaldo Mauro de Moura. All rights reserved.
//

#import "Employee.h"

@implementation Employee

- (instancetype)init
{
    return [self initWithName:[NSString string] withJob:[NSString string] withBio:[NSString string] withPhoto:nil withBadges:nil];
}


- (instancetype)initWithName:(NSString *)name
                     withJob:(NSString *)jobTitle
                     withBio:(NSString *)bio
                   withPhoto:(UIImage *)photo
                  withBadges:(NSArray *)badges;

{
    self = [super init];
    if (self) {
        _name = name;
        _jobTitle = jobTitle;
        _bio = bio;
        _photo = photo;
        _badges = badges;
    }
    return self;
}

@end
