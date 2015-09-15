//
//  ViewController.m
//  LocalNotification
//
//  Created by Teobaldo Mauro de Moura on 9/15/15.
//  Copyright © 2015 Teobaldo Mauro de Moura. All rights reserved.
//

#import "ViewController.h"

#define NOTIFICATION_CATEGORY_ID @"category-ID"
#define NOTIFICATION_ACTION_1 @"action1-ID"
#define NOTIFICATION_ACTION_2 @"action2-ID"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@end

@implementation ViewController

#pragma mark - Life Cycle

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    // 1.1: categorias (ações da notificações)
    UIUserNotificationCategory *category = [self notificationCategory];
    NSSet *categories = [NSSet setWithObject:category];
    
    // 1.2: configurar pedido ao usuário
    UIUserNotificationType types = (UIUserNotificationTypeAlert |
                                    UIUserNotificationTypeBadge |
                                    UIUserNotificationTypeSound);
    
    UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:types
                                                                             categories:categories];
    
    // 2: pedir autorização
    [[UIApplication sharedApplication] registerUserNotificationSettings:settings];
}

-(UIUserNotificationCategory *)notificationCategory {
    // 1*: Categorias
    
    // Ação 1
    UIMutableUserNotificationAction *action1 = [[UIMutableUserNotificationAction alloc] init];
    action1.identifier = NOTIFICATION_ACTION_1;
    action1.title = @"Ação 1";
    action1.activationMode = UIUserNotificationActivationModeBackground; // segundo plano
    
    // Ação 2
    UIMutableUserNotificationAction *action2 = [[UIMutableUserNotificationAction alloc] init];
    action2.identifier = NOTIFICATION_ACTION_2;
    action2.title = @"Ação 2";
    action2.activationMode = UIUserNotificationActivationModeForeground; // primeiro plano quando usar authenticationRequired
    action2.authenticationRequired = YES; // requer desbloquear o usuário (ex: acesso ao keychain)
    action2.destructive = YES;
    
    // categoria
    UIMutableUserNotificationCategory *category = [[UIMutableUserNotificationCategory alloc] init];
    category.identifier = NOTIFICATION_CATEGORY_ID;
    [category setActions:@[action1, action2]
              forContext:UIUserNotificationActionContextMinimal]; // TIP: - Minimal 2 botões em todos devices
                                                                  //      - Default 4 botões em alguns devices
    
    return category;
}

#pragma mark - Actions

-(void)configNotificacaoWithDate:(NSDate *)date {
    // 1: Configura Notificação
    UILocalNotification *notification = [[UILocalNotification alloc] init];
    
    // título (Apple Watch)
    notification.alertTitle = @"[Watch] Notificação Local";
    
    // corpo (iOS)
    notification.alertBody = @"[iOS] Corpo da Notificação, \
aparece em todos os dispositivos";
    
    // data de agendamento
    // NOTA: estou agendando somente para testar, para enviar imediatamente
    //       não é necessário adicionar 'fireDate'
    notification.fireDate = [[NSDate date] dateByAddingTimeInterval:15];
    
    
    // caso queira, podemos modificar a badge
    notification.applicationIconBadgeNumber = 1;
    
    // caso utilize categoria (ações na notificações)
    notification.category = NOTIFICATION_CATEGORY_ID;
    
    // 2: Envia a Notificação
    // enviando
    [[UIApplication sharedApplication] scheduleLocalNotification:notification];
    
    // enviando na hora
    // [[UIApplication sharedApplication] presentLocalNotificationNow:notification]
}

- (IBAction)dispararNotificacaoTouched:(UIButton *)sender {
    NSDate *fireDate = [[NSDate date] dateByAddingTimeInterval:15];
    [self configNotificacaoWithDate:fireDate];
}

- (IBAction)agendarNotificacaoTouched:(UIButton *)sender {
    NSDate *fireDate = [[self datePicker] date];
    [self configNotificacaoWithDate:fireDate];
}

@end
