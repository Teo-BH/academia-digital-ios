//
//  SettingAPI.h
//  StarWarsFanBoy
//
//  Created by Teobaldo Mauro de Moura on 9/17/15.
//  Copyright © 2015 Teobaldo Mauro de Moura. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingAPI : UITableViewController

+(NSArray *)getActiveSetting:(NSString *)fileName;
+(BOOL)saveActiveSetting:(NSArray *)settings withFileName:(NSString *)fileName;

@end
