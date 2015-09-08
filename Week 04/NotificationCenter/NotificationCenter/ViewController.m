//
//  ViewController.m
//  NotificationCenter
//
//  Created by Teobaldo Mauro de Moura on 9/8/15.
//  Copyright © 2015 Teobaldo Mauro de Moura. All rights reserved.
//

#import "ViewController.h"
#import "Notification.h"

@interface ViewController () {
    NSMutableArray *_notifications;
}

@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    _notifications = [NSMutableArray array];
    
    // escutar notificações do notificador
    [[NSNotificationCenter defaultCenter] addObserverForName:NotificationName
                                                      object:nil
                                                       queue:[NSOperationQueue mainQueue]
                                                  usingBlock:^(NSNotification *notification)
    {
        NSLog(@"%@", notification);
    }];
}

- (IBAction)createObject:(UIButton *)sender {
    Notification *n = [Notification new];
    
    if (_notifications.count == 0) {
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(notificacaoExclusiva:)
                                                     name:NotificationName
                                                   object:n]; // Filtro: define o objeto 'sender' que deseja escutar a notificação
    }
    
    [_notifications addObject:n];
}

- (IBAction)shootOne:(UIButton *)sender {
    Notification *notification = [_notifications lastObject];
    [notification notificar];
}

- (IBAction)shootAll:(UIButton *)sender {
//    for (Notification *notification in _notifications) {
//        [notification notificar];
//    }
//   ou
    [_notifications makeObjectsPerformSelector:@selector(notificar)];
}


-(void)notificacaoExclusiva:(NSNotification *)notification {
    NSLog(@"%@ %@", NSStringFromSelector(_cmd), notification);
}

@end
