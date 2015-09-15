//
//  ViewController.m
//  LocalNotification
//
//  Created by Teobaldo Mauro de Moura on 9/15/15.
//  Copyright © 2015 Teobaldo Mauro de Moura. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@end

@implementation ViewController

#pragma mark - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 1: configurar pedido ao usuário
    UIUserNotificationType types = (UIUserNotificationTypeAlert |
                                    UIUserNotificationTypeBadge |
                                    UIUserNotificationTypeSound);
    UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:types
                                                                             categories:nil]; // categorias são ações na notificações
    
    
    // 2: pedir autorização
    [[UIApplication sharedApplication] registerUserNotificationSettings:settings];
    
    
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
    //notification.applicationIconBadgeNumber = 5;
    
    // caso utilize categoria (ações na notificações)
    // notification.category = ...
    
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
