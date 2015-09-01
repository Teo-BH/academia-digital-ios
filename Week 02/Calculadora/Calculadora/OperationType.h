//
//  OperatorEnum.h
//  Calculadora
//
//  Created by Teobaldo Mauro de Moura on 8/27/15.
//  Copyright © 2015 Teobaldo Mauro de Moura. All rights reserved.
//


typedef NS_ENUM(NSUInteger, OperationType) {
    OperationTypeNone = 0,
    OperationTypeAddition = 1,
    OperationTypeSubtraction = 2,
    OperationTypeMultiplication = 3,
    OperationTypeDivision = 4
};

OperationType OperationMake(NSInteger value) {
    if (value >= 0 && value <= 4)
        return (OperationType)value;
    else
        return OperationTypeNone;
}

OperationType OperationTextMake(char text) {
    OperationType result = OperationTypeNone;
    if (text == '+') {
        result = OperationTypeAddition;
    } else if (text == '-') {
        result = OperationTypeSubtraction;
    } else if (text == '*') {
        result = OperationTypeMultiplication;
    } else if (text == '/') {
        result = OperationTypeDivision;
    }
    return result;
    
}

