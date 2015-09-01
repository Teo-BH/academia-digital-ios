//
//  Employee.h
//  iCracha
//
//  Created by Teobaldo Mauro de Moura on 8/25/15.
//  Copyright © 2015 Teobaldo Mauro de Moura. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Employee : NSObject

@property NSString *name;
@property NSString *jobTitle;
@property NSString *bio;
@property UIImage *photo;
@property NSArray *badges;

- (instancetype)initWithName:(NSString *)name
                     withJob:(NSString *)jobTitle
                     withBio:(NSString *)bio
                   withPhoto:(UIImage *)photo
                  withBadges:(NSArray *)badges;

@end
