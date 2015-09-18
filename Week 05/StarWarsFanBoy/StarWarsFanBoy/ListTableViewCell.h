//
//  ListTableViewCell.h
//  StarWarsFanBoy
//
//  Created by Teobaldo Mauro de Moura on 9/18/15.
//  Copyright © 2015 Teobaldo Mauro de Moura. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ListTableViewCell : UITableViewCell

-(void)setName:(NSString *)name withLastAccess:(NSDate *)lastAccess;

@end
