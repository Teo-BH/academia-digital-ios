//
//  PlanetaTerraTests.m
//  DesafioPlanetaTerra
//
//  Created by Marcos Trovilho on 31/08/15.
//  Copyright (c) 2015 Marcos Trovilho. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "PlanetaTerra.h"

@interface PlanetaTerraTests : XCTestCase
@end



@implementation PlanetaTerraTests

#pragma mark - Continente

- (void)testListaContinentes {
    NSArray *continentes = [PlanetaTerra listaContinentes];
    
    XCTAssertNotNil(continentes, @"Lista nula");
    XCTAssert([continentes isKindOfClass:[NSArray class]], @"Classe invalida");
    XCTAssertGreaterThan([continentes count], 0, @"Lista vazia");
}

- (void)testSiglaContinente {
    NSString *sigla = [PlanetaTerra siglaContinente:@"Asia"];
    
    XCTAssertNotNil(sigla, @"Sigla nula");
    XCTAssert([sigla isKindOfClass:[NSString class]], @"Classe invalida");
    XCTAssertGreaterThan([sigla length], 0, @"Sigla vazia");
    XCTAssert([sigla isEqualToString:@"AS"], @"Sigla invalida");
}

#pragma mark - Paises

/*
 // Paises
 +(NSArray *)listaPaisesContinente:(NSString *)siglaContinente;
 +(NSString *)siglaPais:(NSString *)nome;
 +(NSUInteger)totalPaisesContinente:(NSString *)siglaContinente;
 +(UIImage *)bandeiraPais:(NSString *)nomePais;
 */

#pragma mark - Testes de Performance

/*
- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}
*/
@end
