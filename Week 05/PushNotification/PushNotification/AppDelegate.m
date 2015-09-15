//
//  AppDelegate.m
//  PushNotification
//
//  Created by Teobaldo Mauro de Moura on 9/15/15.
//  Copyright © 2015 Teobaldo Mauro de Moura. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    // 1: configurar push
    // Tip: Para atualizar somente o Badge use:
    //      a) somente o tipo UIUserNotificationTypeBadge
    //      b) envie um Push Notification sem mensagem (texto)
    UIUserNotificationType types = (UIUserNotificationTypeAlert |
                                    UIUserNotificationTypeBadge |
                                    UIUserNotificationTypeSound);
    
    UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:types categories:nil];
    
    // 2: pedir autorização
    [[UIApplication sharedApplication] registerUserNotificationSettings:settings];
    
    // 3: registrar push com a Apple
    [application registerForRemoteNotifications];
    
    return YES;
}

-(void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {
    NSLog(@"%@", error);
}

-(void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    // Obtém o deviceToken
    NSLog(@"Device Token: %@", deviceToken);
}

#pragma mark - Categoria

-(void)application:(UIApplication *)application handleActionWithIdentifier:(NSString *)identifier
                                                     forRemoteNotification:(NSDictionary *)userInfo
                                                         completionHandler:(void (^)())completionHandler {
// TODO: Implementar ação da categoria
}

-(void)application:(UIApplication *)application handleActionWithIdentifier:(NSString *)identifier
                                                     forRemoteNotification:(NSDictionary *)userInfo
                                                          withResponseInfo:(NSDictionary *)responseInfo
                                                         completionHandler:(void (^)())completionHandler {
    // TODO: Implementar ação da categoria
}

// EXTRA

-(void)application:(UIApplication *)application handleEventsForBackgroundURLSession:(NSString *)identifier completionHandler:(void (^)())completionHandler {
    // Realiza uma chamada 'silenciosa'
    // ex: 1 - faça download silencioso aqui e
    //     2 - emita um Push Notification Local
}

@end
