//
//  main.m
//  Funcoes
//
//  Created by Teobaldo Mauro de Moura on 8/19/15.
//  Copyright (c) 2015 Teobaldo Mauro de Moura. All rights reserved.
//

#import <Foundation/Foundation.h>

// declarações das funções
double duplicarValor(double valor);
double imc(int peso, double altura);

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        double valor = 3.0;
        double result = duplicarValor(valor);
        printf("Valor %.1f -> Dobro: %.1f:\n", valor, result);
        
        // Exercício
        // função IMC
        // -> peso / alturaˆ2
        int peso = 80;
        double altura = 1.60;
        double resultado = imc(peso, altura);
        return printf("O peso %d kg e altura %.2f possui IMC igual a %.2f\n", peso, altura, resultado);
        
    }
    return 0;
}

// implementações das funções
double duplicarValor(double valor) {
    return valor * 2;
}

double imc(int peso, double altura) {
    return peso / pow(altura, 2);
}