//
//  ModelBase.h
//  StarWarsFanBoy
//
//  Created by Teobaldo Mauro de Moura on 9/16/15.
//  Copyright © 2015 Teobaldo Mauro de Moura. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ModelBase : NSObject

@property (strong, nonatomic) NSDate *created;
@property (strong, nonatomic) NSDate *edited;
@property (strong, nonatomic) NSURL *url;

- (instancetype)initWithDictionary:(NSDictionary *)properties;
- (instancetype)initWithDictionary:(NSDictionary *)properties withDescriptionName:(NSString *)descriptionName;

@end
