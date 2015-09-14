//
//  ViewController.m
//  Audio
//
//  Created by Teobaldo Mauro de Moura on 9/14/15.
//  Copyright © 2015 Teobaldo Mauro de Moura. All rights reserved.
//

#import "ViewController.h"
// #import <AVFoundation/AVFoundation.h> // necessário importar o framework no projeto
// ou
@import AVFoundation; // não é necessário adicionar (pesquisa em módulos - Apple já contido)

#define SOM_TRILHA @"trilha"
#define SOM_GAIVOTAS @"gaivota"
#define SOM_TELEPORT @"teleport"
#define SOM_TECLADO @"teclado"
#define SOM_ZUUUM @"zuuum"
#define EXTENSAO @"mp3"

#define SOMS @[ SOM_GAIVOTAS, SOM_TELEPORT, SOM_TECLADO, SOM_ZUUUM ]

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIButton *trillhaButton;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *efeitoButtons;

// AudioPlayer
@property (nonatomic) AVAudioPlayer *trilhaPlayer;
@property (nonatomic) NSMutableArray<AVAudioPlayer *> *efeitoPlayers;

@end

@implementation ViewController

#pragma mark - Cycle Life

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self carregarTrilha];
    [self carregarEfeitos];
}

#pragma mark - AudioPlayers

-(AVAudioPlayer *)audioPlayerForSoundName:(NSString *)soundName {
    NSURL *url = [[NSBundle mainBundle] URLForResource:soundName withExtension:EXTENSAO];
    AVAudioPlayer *player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    [player prepareToPlay];
    return player;
}

-(void)carregarTrilha {
    self.trilhaPlayer = [self audioPlayerForSoundName:SOM_TRILHA];
}

-(void)carregarEfeitos {
    self.efeitoPlayers = [[NSMutableArray alloc] init];
    for (NSString *som in SOMS) {
        AVAudioPlayer *player = [self audioPlayerForSoundName:som];
        [self.efeitoPlayers addObject:player];
    }
}

-(void)runActionFor:(AVAudioPlayer *)player {
    // se está tocando, pausa, senão toca
    if ([player isPlaying]) {
        [player pause];
    } else {
        [player play];
    }
    
}

#pragma mark - Actions

- (IBAction)trilhaTouched:(UIButton *)sender {
    [self runActionFor:self.trilhaPlayer];
}

- (IBAction)efeitoTouched:(UIButton *)sender {
    NSInteger index = [sender tag] - 1;
    AVAudioPlayer *player = [self.efeitoPlayers objectAtIndex:index];
    [self runActionFor:player];
}


@end
