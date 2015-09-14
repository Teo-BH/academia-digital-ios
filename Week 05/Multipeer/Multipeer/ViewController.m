//
//  ViewController.m
//  Multipeer
//
//  Created by Teobaldo Mauro de Moura on 9/14/15.
//  Copyright © 2015 Teobaldo Mauro de Moura. All rights reserved.
//

#import "ViewController.h"
@import MultipeerConnectivity;

#define SERVICE_TYPE @"service-chat"

@interface ViewController ()

@property MCBrowserViewController *browser;
@property MCAdvertiserAssistant *advertiser;
@property MCSession *session;
@property MCPeerID *peerID;
// storyboard
@property (weak, nonatomic) IBOutlet UITextView *chatTextView;
@property (weak, nonatomic) IBOutlet UITextField *messageTextField;

@end

@interface ViewController (SessionDelegate) <MCSessionDelegate>
@end

@interface ViewController (BrowserDelegate) <MCBrowserViewControllerDelegate>
@end

@implementation ViewController

#pragma mark - Actions

- (IBAction)sendMessageTouched:(UIButton *)sender {
    // 1: mensagem => NSData
    NSString *message = self.messageTextField.text;
    NSData *data = [message dataUsingEncoding:NSUTF8StringEncoding];
    // 2: enviar data para session
    NSError *error = nil;
    [self.session sendData:data
                   toPeers:self.session.connectedPeers
                  withMode:MCSessionSendDataReliable
                     error:&error];
    // 3: atualizar o chatView com sua mensagem
    self.chatTextView.text = [NSString stringWithFormat:@"%@: %@\n%@", @"Eu", message, self.chatTextView.text];
}

- (IBAction)findFriendsTouched:(UIButton *)sender {
    // presentVC no browser
    [self presentViewController:self.browser animated:YES completion:nil];
}

#pragma mark - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Peer ID
    NSString *nomeAparelho;
#if (TARGET_IPHONE_SIMULATOR)
   nomeAparelho = @"Teo-iphone"; // TODO: pegar dinamicamente (UIDevice)
#else
    nomeAparelho = [[UIDevice currentDevice] name];
#endif
    self.peerID = [[MCPeerID alloc] initWithDisplayName:nomeAparelho];
    
    // Session
    self.session = [[MCSession alloc] initWithPeer:self.peerID];
    self.session.delegate = self;
    
    // Browser
    self.browser = [[MCBrowserViewController alloc] initWithServiceType:SERVICE_TYPE
                                                                session:self.session];
    self.browser.delegate = self;
    
    // Advertiser
    self.advertiser = [[MCAdvertiserAssistant alloc] initWithServiceType:SERVICE_TYPE
                                                           discoveryInfo:nil
                                                                 session:self.session];
    
    // Começa a fazer broadcast
    [self.advertiser start];
}


@end

#pragma mark - MCSessionDelegate
@implementation ViewController (SessionDelegate)

-(void)session:(MCSession *)session didReceiveData:(NSData *)data fromPeer:(MCPeerID *)peerID {
    NSString *message = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"%@ %@", peerID, message);
    
    dispatch_async(dispatch_get_main_queue(), ^{
        self.chatTextView.text = [NSString stringWithFormat:@"%@: %@\n%@", peerID.displayName, message, self.chatTextView.text];
    });
}

-(void)session:(MCSession *)session peer:(MCPeerID *)peerID didChangeState:(MCSessionState)state {
    
}

-(void)           session:(MCSession *)session
         didReceiveStream:(NSInputStream *)stream
                 withName:(NSString *)streamName
                 fromPeer:(MCPeerID *)peerID {
    
}


-(void)                  session:(MCSession *)session
didStartReceivingResourceWithName:(NSString *)resourceName
                        fromPeer:(MCPeerID *)peerID
                    withProgress:(NSProgress *)progress {
    
}

-(void)                    session:(MCSession *)session
didFinishReceivingResourceWithName:(NSString *)resourceName
                          fromPeer:(MCPeerID *)peerID
                             atURL:(NSURL *)localURL
                         withError:(NSError *)error {
    
}


@end

#pragma mark - MCBrowserViewControllerDelegate
@implementation ViewController (BrowserDelegate)

-(void)browserViewControllerWasCancelled:(MCBrowserViewController *)browserViewController {
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)browserViewControllerDidFinish:(MCBrowserViewController *)browserViewController {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end