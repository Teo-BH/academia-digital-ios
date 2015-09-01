//
//  ViewController.m
//  Calculadora
//
//  Created by Teobaldo Mauro de Moura on 8/27/15.
//  Copyright © 2015 Teobaldo Mauro de Moura. All rights reserved.
//

#import "ViewController.h"
#import "OperationType.h"


@interface ViewController () {
    OperationType _operator;
    int _value2;
    int _value;
    
    // opções para execução de operações
    //SEL operacoes[5];
    
}

@property (weak, nonatomic) IBOutlet UILabel *resultLabel;
@property (weak, nonatomic) IBOutlet UIButton *acButton;

@end

// Calculadora
// Tela com AutoLayout para os botões
// 0-9 com mesmo tamanho
// botões + - x =
//
// textView para mostrar os valores
//
// toda vez que executar alguma operação
// empilha o  resultado numa variável

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Inicialização
    [self acTouched:nil];
}

-(void)setValue:(int)value withUpdateLabel:(BOOL)updateLabel {
    _value = value;
    if (updateLabel) {
        self.resultLabel.text = [NSString stringWithFormat:@"%d", value];
    }
}

- (IBAction)numberTouched:(UIButton *)sender {
    NSString *valueText = [[NSString stringWithFormat:@"%d", _value] stringByAppendingString:sender.currentTitle];
    int valueTouched = valueText.intValue;
    [self setValue:valueTouched withUpdateLabel:true];
    [self.acButton setTitle:@"C" forState:UIControlStateNormal];
}

- (IBAction)acTouched:(UIButton *)sender {
    if ([sender.currentTitle isEqualToString:@"C"])
    {
        [self setValue:0 withUpdateLabel:true];
        [sender setTitle:@"AC" forState:UIControlStateNormal];
    } else {
        [self setValue:0 withUpdateLabel:true];
        _value2 = 0;
        _operator = OperationTypeNone;
    }
}

- (IBAction)inverseTouched:(UIButton *)sender {
    [self setValue:-_value withUpdateLabel:true];
}

- (IBAction)operatorTouched:(UIButton *)sender {
    _value2 = _value;
    _operator = OperationTextMake([sender.currentTitle characterAtIndex:0]);
    [self setValue:0 withUpdateLabel:NO];
}

- (IBAction)percentageTouched:(id)sender {
    int result = [self calculator:_value withOperator:OperationTypeMultiplication withValue2:_value2];
    result = result / 100;
    [self setValue:result withUpdateLabel:YES];
}

- (IBAction)equalTouched:(UIButton *)sender {
    int result = [self calculator:_value withOperator:_operator withValue2:_value2];
    [self setValue:result withUpdateLabel:YES];
}

- (int)calculator:(int)value withOperator:(OperationType)operator withValue2:(int)value2 {
    switch (operator) {
        case OperationTypeAddition:
            return value2 + value;
        case OperationTypeSubtraction:
            return value2 - value;
        case OperationTypeMultiplication:
            return value2 * value;
        case OperationTypeDivision:
            return value2 / value;
        default:
            return value;
    }
}

- (IBAction)pointTouched:(UIButton *)sender {
    // TODO: implementar ponto decimal
    @throw ([NSException exceptionWithName:@"NotImplement" reason:@"Funcionalidade não implementada" userInfo:nil]);
}

@end
