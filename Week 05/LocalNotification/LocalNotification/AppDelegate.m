//
//  AppDelegate.m
//  LocalNotification
//
//  Created by Teobaldo Mauro de Moura on 9/15/15.
//  Copyright © 2015 Teobaldo Mauro de Moura. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

-(BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Limpa o número de badge => application == [UIApplication sharedApplication]
    // ex: - WhatsApp sempre limpa
    //     - Telegram controla as mensagens não lidas
    [application setApplicationIconBadgeNumber:0];
    
    return YES;
}

-(void)applicationDidBecomeActive:(UIApplication *)application {

}

-(void)application:(UIApplication *)application handleActionWithIdentifier:(NSString *)identifier
                                                      forLocalNotification:(UILocalNotification *)notification
                                                        completionHandler:(void (^)())completionHandler {
    NSLog(@"[%@] %@ %@", NSStringFromSelector(_cmd), identifier, notification);
    
    application.applicationIconBadgeNumber = application.applicationIconBadgeNumber +
                                             notification.applicationIconBadgeNumber;
    
    // IMPORTANTE: sempre que existir um 'completionHandler' ele deverá ser chamado assim que acabar o processamento
    if (completionHandler)
        completionHandler();
}

-(void)application:(UIApplication *)application handleActionWithIdentifier:(NSString *)identifier
                                                      forLocalNotification:(UILocalNotification *)notification
                                                          withResponseInfo:(NSDictionary *)responseInfo
                                                         completionHandler:(void (^)())completionHandler {
    NSLog(@"[%@] %@ %@", NSStringFromSelector(_cmd), identifier, notification);
    NSLog(@"%@", responseInfo);

    application.applicationIconBadgeNumber = application.applicationIconBadgeNumber +
    notification.applicationIconBadgeNumber;
    

    // IMPORTANTE: sempre que existir um 'completionHandler' ele deverá ser chamado assim que acabar o processamento
    if (completionHandler)
        completionHandler();
}

@end
