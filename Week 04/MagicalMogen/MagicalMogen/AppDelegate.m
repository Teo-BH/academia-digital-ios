//
//  AppDelegate.m
//  MagicalMogen
//
//  Created by Teobaldo Mauro de Moura on 9/11/15.
//  Copyright © 2015 Teobaldo Mauro de Moura. All rights reserved.
//

#import "AppDelegate.h"
#import <MagicalRecord/MagicalRecord.h>

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Detalhes em: https://github.com/magicalpanda/MagicalRecord/blob/master/Docs/Getting-Started.md
    [MagicalRecord setupAutoMigratingCoreDataStack];
    return YES;
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Detalhes em: https://github.com/magicalpanda/MagicalRecord/blob/master/Docs/Getting-Started.md
    [MagicalRecord cleanUp];
}

@end
