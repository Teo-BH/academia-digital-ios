//
//  ViewController.m
//  Videos
//
//  Created by Teobaldo Mauro de Moura on 9/14/15.
//  Copyright © 2015 Teobaldo Mauro de Moura. All rights reserved.
//

#import "ViewController.h"

//@import AVKit;
@import MediaPlayer;

// Nota: formatos suportados
//       M4V, MOV, MP4, 3GP, h264

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIView *playerView;
@property (nonatomic) MPMoviePlayerController *player;

@property (weak, nonatomic) IBOutlet UIToolbar *toolbar;
@property (strong, nonatomic) IBOutletCollection(UIBarButtonItem) NSArray *toolbarButtons;

@end

@implementation ViewController

#pragma mark - Life Cycle

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"microondas" withExtension:@"mp4"];
    self.player = [[MPMoviePlayerController alloc] initWithContentURL:url];
    // "esticar" o vídeo
    self.player.scalingMode = MPMovieScalingModeAspectFit;
    // controles do vídeo (como criamos os controles podemos desabilitar aqui)
    self.player.controlStyle = MPMovieControlStyleNone;
    // tamanho do vídeo
    self.player.view.frame = self.playerView.bounds;
    // adiciona o vídeo na tela
    [self.playerView addSubview:self.player.view];

}

#pragma mark - Button Actions

- (IBAction)voltar:(UIBarButtonItem *)sender {
    self.player.currentPlaybackTime = MAX(0,
                                          self.player.currentPlaybackTime - 3);
}

- (IBAction)tocar:(UIBarButtonItem *)sender {
    UIBarButtonSystemItem buttonType;
    if (self.player.playbackState != MPMoviePlaybackStatePlaying) {
        [self.player play];
        buttonType = UIBarButtonSystemItemPause;
    } else {
        [self.player pause];
        buttonType = UIBarButtonSystemItemPlay;
    }
    
    // Modifica o botão Play/Pause
    UIBarButtonItem *playPause = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:buttonType
                                                                               target:self
                                                                               action:@selector(tocar:)];
    NSMutableArray *buttons = [self.toolbarButtons mutableCopy];
    [buttons insertObject:playPause atIndex:(buttons.count / 2)];
    self.toolbar.items = buttons;
    
}

- (IBAction)avancar:(UIBarButtonItem *)sender {
    self.player.currentPlaybackTime = MIN(self.player.duration,
                                          self.player.currentPlaybackTime + 3);
}


@end
