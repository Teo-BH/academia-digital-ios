//
//  ListTableViewCell.m
//  StarWarsFanBoy
//
//  Created by Teobaldo Mauro de Moura on 9/18/15.
//  Copyright © 2015 Teobaldo Mauro de Moura. All rights reserved.
//

#import "ListTableViewCell.h"
#import "NSObject+Extension.h"

@interface ListTableViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *lastAccessLabel;
@property (weak, nonatomic) IBOutlet UILabel *lastAcessTitleLabel;

@end

@implementation ListTableViewCell

-(void)setName:(NSString *)name withLastAccess:(NSDate *)lastAccess {
    [[self nameLabel] setText:name];
    [[self lastAccessLabel] setText:[lastAccess displayText]];
    [[self lastAcessTitleLabel] setHidden:!(lastAccess)];
}


@end
