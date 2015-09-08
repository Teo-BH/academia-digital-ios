//
//  Notification.m
//  NotificationCenter
//
//  Created by Teobaldo Mauro de Moura on 9/8/15.
//  Copyright © 2015 Teobaldo Mauro de Moura. All rights reserved.
//

#import "Notification.h"

#define INTERNAL_NOTIFICATION @"NotificacaoInterna"
NSString *const NotificationName = @"NotificationName";

@implementation Notification

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self turnOnNotification];
    }
    return self;
}

- (void)dealloc
{
    [self turnOffNotification];
}

-(void)turnOnNotification {
    NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
    [notificationCenter addObserver:self
                           selector:@selector(receiveNotification)
                               name:INTERNAL_NOTIFICATION
                             object:nil];
}

-(void)turnOffNotification {
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:INTERNAL_NOTIFICATION
                                                  object:nil];
}

-(void)receiveNotification {
    NSLog(@"%@", NSStringFromSelector(_cmd));
}

-(void)notificar {
    // aviso interno
    [[NSNotificationCenter defaultCenter] postNotificationName:INTERNAL_NOTIFICATION object:nil];
    
    // aviso externo
    [[NSNotificationCenter defaultCenter] postNotificationName:NotificationName object:self];
}

@end
