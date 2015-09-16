//
//  AppDelegate.m
//  DesafioFabric
//
//  Created by Teobaldo Mauro de Moura on 9/16/15.
//  Copyright © 2015 Teobaldo Mauro de Moura. All rights reserved.
//

#import "AppDelegate.h"
#import <Fabric/Fabric.h>
#import <Crashlytics/Crashlytics.h>
#import <DigitsKit/DigitsKit.h>
#import "AppDefine.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

/// 1) Carrega as funcionalidades Crashlytics e Digits do Fabric.io
/// 2) Define o ViewController de acordo com a sessão de usuário ativas
/// @see https://fabric.io/
/// @see https://docs.fabric.io/ios/index.html
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Inicializando o Fabric
    [Fabric with:@[[Crashlytics class], [Digits class]]];
    
    BOOL logado = [[Digits sharedInstance] session];
    NSString *view = logado? MAIN_VIEW_CONTROLLER : LOGIN_VIEW_CONTROLLER;
    
    // Define o RootViewController
    [self showRootViewController:view];
    
    return YES;
}

// Tip: Limpar a propriedade 'Main Storyboard file base name' no arquivo Info.plist
- (void)showRootViewController:(NSString *)viewName {
    self.window = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:STORYBOARD_NAME bundle: nil];
    UIViewController *viewController = [storyboard instantiateViewControllerWithIdentifier:viewName];
    
    self.window.rootViewController = viewController;
    [self.window makeKeyAndVisible];
}

@end
