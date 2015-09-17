//
//  ModelBase.m
//  StarWarsFanBoy
//
//  Created by Teobaldo Mauro de Moura on 9/16/15.
//  Copyright © 2015 Teobaldo Mauro de Moura. All rights reserved.
//

#import "ModelBase.h"
#import "NSString+Extension.h"

@implementation ModelBase {
    NSString *_description;
}

- (instancetype)init
{
    return [self initWithDictionary:nil];
}

- (instancetype)initWithDictionary:(NSDictionary *)properties
{
    return [self initWithDictionary:properties withDescriptionName:nil];
}

- (instancetype)initWithDictionary:(NSDictionary *)properties withDescriptionName:(NSString *)descriptionName {
    self = [super init];
    if (self && properties) {
        // Propriedades comuns
        _created = [properties[@"created"] jsonDateValue];
        _edited = [properties[@"edited"] jsonDateValue];
        _url = [NSURL URLWithString:properties[@"url"]];
        
        // Description
        if (descriptionName) {
            _description = properties[descriptionName];
        }
    }
    return self;
}

-(NSString *)description {
    return _description;
}

@end
