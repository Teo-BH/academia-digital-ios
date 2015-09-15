//
//  Operacao.h
//  Operation
//
//  Created by Teobaldo Mauro de Moura on 9/15/15.
//  Copyright © 2015 Teobaldo Mauro de Moura. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol OperacaoDelegate <NSObject>
-(void)OperacaoResult:(UIImage *)image;
@end

typedef void(^OperacaoResultHandler)(UIImage *image);

@interface Operacao : NSOperation

- (instancetype)initWithURL:(NSURL *)url;
- (instancetype)initWithURL:(NSURL *)url withDelegate:(id<OperacaoDelegate>) delegate;

@property (nonatomic, copy) OperacaoResultHandler resultHandler;
@property (nonatomic, weak) id<OperacaoDelegate> delegate;

@end
