//
//  ModeloTableViewCell.m
//  JornalDoCarro
//
//  Created by Rafael Reis Achcar Zanin on 22/09/15.
//  Copyright © 2015 Rafael Reis Achcar Zanin. All rights reserved.
//

#import "ModeloTableViewCell.h"

@interface ModeloTableViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *marcaLabel;
@property (weak, nonatomic) IBOutlet UILabel *anoLabel;
@property (weak, nonatomic) IBOutlet UILabel *combustivelLabel;
@property (weak, nonatomic) IBOutlet UILabel *referenciaLabel;
@property (weak, nonatomic) IBOutlet UILabel *precoLabel;

@end

@implementation ModeloTableViewCell

- (void)setModelo:(Modelo *)modelo {
    _modelo = modelo;
    
    self.marcaLabel.text = modelo.marca;
    self.anoLabel.text = modelo.ano_modelo;
    self.combustivelLabel.text = modelo.combustivel;
    self.referenciaLabel.text = modelo.referencia;
    self.precoLabel.text = modelo.preco;
}

@end
