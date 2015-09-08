//
//  View.m
//  LiveRendering
//
//  Created by Teobaldo Mauro de Moura on 9/8/15.
//  Copyright © 2015 Teobaldo Mauro de Moura. All rights reserved.
//

#import "View.h"

@implementation View

-(void)drawRect:(CGRect)rect {
    UIBezierPath *oval = [UIBezierPath bezierPathWithOvalInRect:rect];
    
    [[self borderColor] setStroke];
    [oval setLineWidth:[self borderWidth]];
    [oval setLineCapStyle:kCGLineCapRound];
    [oval stroke];
    
    [[self fillColor] setFill]; // Preenche o contexto globol através da propriedade 'fillColor'
    [oval fill];
}

@end
