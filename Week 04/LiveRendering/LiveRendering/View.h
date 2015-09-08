//
//  View.h
//  LiveRendering
//
//  Created by Teobaldo Mauro de Moura on 9/8/15.
//  Copyright © 2015 Teobaldo Mauro de Moura. All rights reserved.
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE // marca a classe renderizando no Storyboard
@interface View : UIView

// IBInspectable marca a propriedade 'inspecionável' aparecendo no menu inspector
@property (nonatomic) IBInspectable UIColor *fillColor;

@property (nonatomic) IBInspectable UIColor *borderColor;
@property (nonatomic) IBInspectable CGFloat borderWidth;

@end
