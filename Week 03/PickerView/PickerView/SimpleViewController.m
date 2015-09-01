//
//  ViewController.m
//  PickerView
//
//  Created by Teobaldo Mauro de Moura on 9/1/15.
//  Copyright (c) 2015 Teobaldo Mauro de Moura. All rights reserved.
//

#import "SimpleViewController.h"

// Tip: - Não funciona a altura e propriedade 'Show Behavior Selection'
//      - Só funciona com o delegate DataSource

#define DATA @[ @"SP", @"RJ", @"MG" ]

// Criar um dicionário
// - Estados
// - Cidades
// ligar estados em um componente e trocar (delegate)
// mostrar cidades no outro (-reloadComponent:)

#define ESTADOS @{ \
    @"RS": @[ @"Porto Alegre" ], \
    @"SP": @[ @"São Paulo", @"Campinas"], \
    @"MG": @[ @"Belo Horizonte", @"Uberlândia", @"Juiz de Fora"], \
    @"RJ": @[ @"Rio de Janeiro", @"Petropólis" ] \
}

typedef NS_ENUM(NSUInteger, PickerComponent) {
    PickerComponentEstados = 0,
    PickerComponentCidades,
    
    PickerComponentMax
};

@interface SimpleViewController () <UIPickerViewDataSource, UIPickerViewDelegate>

@end

@implementation SimpleViewController

#pragma mark - UIPickerViewDataSource

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return PickerComponentMax;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    switch ((PickerComponent)component) {
        case PickerComponentCidades: {
            NSArray *cidade = [self cidadeDoEstadoSelecionadoNoPickerView:pickerView];
            return [cidade count];
        }
        default:
            return [[ESTADOS allKeys] count];
    }
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    switch ((PickerComponent)component) {
        case PickerComponentCidades: {
            NSArray *cidade = [self cidadeDoEstadoSelecionadoNoPickerView:pickerView];
            return [cidade objectAtIndex:row];
        }
        default:
            return [[ESTADOS allKeys]objectAtIndex:row];
    }
}

-(NSArray *)cidadeDoEstadoSelecionadoNoPickerView:(UIPickerView *)pickerView {
    NSInteger indiceEstadoSelecionado = [pickerView selectedRowInComponent:PickerComponentEstados];
    NSString *estadoSelecionado = [[ESTADOS allKeys] objectAtIndex:indiceEstadoSelecionado];
    NSArray *cidades = [ESTADOS objectForKey:estadoSelecionado];
    return cidades;
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    if (component == PickerComponentEstados)
        [pickerView reloadComponent:PickerComponentCidades];
}

@end
