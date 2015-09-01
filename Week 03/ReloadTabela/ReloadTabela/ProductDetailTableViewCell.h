//
//  ProductDetailTableViewCell.h
//  ReloadTabela
//
//  Created by Teobaldo Mauro de Moura on 8/31/15.
//  Copyright (c) 2015 Teobaldo Mauro de Moura. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProductDetailTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *nomeLabel;
@property (weak, nonatomic) IBOutlet UILabel *skuLabel;
@property (weak, nonatomic) IBOutlet UIImageView *fotoImageView;

@end
