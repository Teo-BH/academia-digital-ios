//
//  ViewController.m
//  CameraFotos
//
//  Created by Teobaldo Mauro de Moura on 9/3/15.
//  Copyright © 2015 Teobaldo Mauro de Moura. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // checando se temos camera disponível
    BOOL hasCameraFront = [UIImagePickerController
                           isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceFront];
    
    BOOL hasCameraRear = [UIImagePickerController
                          isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceRear];
    
    NSLog(@"%@", hasCameraFront ? @"Camera Frontal" : @"Sem Camera Frontal");
    NSLog(@"%@", hasCameraRear ? @"Camera Transeira" : @"Sem Camera Transeira");

    // checando se temos flash
    BOOL hasFlashFront = [UIImagePickerController
                          isFlashAvailableForCameraDevice:UIImagePickerControllerCameraDeviceFront];
    BOOL hasFlashRear = [UIImagePickerController
                         isFlashAvailableForCameraDevice:UIImagePickerControllerCameraDeviceRear];
    
    NSLog(@"%@", hasFlashFront ? @"Flash Frontal" : @"Sem Flash Frontal");
    NSLog(@"%@", hasFlashRear ? @"Flash Transeira" : @"Sem Flash Transeira");
    
    // checando os tipos de mídia
    NSArray *cameraType = [UIImagePickerController
                           availableMediaTypesForSourceType:UIImagePickerControllerSourceTypeCamera];
    
    NSArray *libraryType = [UIImagePickerController
                           availableMediaTypesForSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    
    NSArray *albumType = [UIImagePickerController
                          availableMediaTypesForSourceType:UIImagePickerControllerSourceTypeSavedPhotosAlbum];
    
    NSLog(@"Tipos de mídia na Camera: %@", cameraType);
    NSLog(@"Tipos de mídia na Biblioteca: %@", libraryType);
    NSLog(@"Tipos de mídia no Albúm de fotos tiradas: %@", albumType);
    
}
- (IBAction)escolherImagem:(UIButton *)sender {
    UIAlertController *alert = [UIAlertController
                                alertControllerWithTitle:@"Escolha a origem"
                                message:nil
                                preferredStyle:UIAlertControllerStyleActionSheet];
    
    // camera
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"Camera"
                                                         style:UIAlertActionStyleDefault
                                                                handler:^(UIAlertAction * action)
        {
            UIImagePickerController *picker = [[UIImagePickerController alloc] init];
            [picker setSourceType:UIImagePickerControllerSourceTypeCamera];
            [picker setDelegate:self];
            [picker setAllowsEditing:YES];
            [self presentViewController:picker animated:YES completion:nil];
        }];
        
        [alert addAction:action];
    }

    // Photo Library
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"Biblioteca de fotos"
                                                         style:UIAlertActionStyleDefault
                                                       handler:^(UIAlertAction * action)
                                 {
                                     UIImagePickerController *picker = [[UIImagePickerController alloc] init];
                                     [picker setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
                                     [picker setDelegate:self];
                                     [picker setAllowsEditing:YES];
                                     [self presentViewController:picker animated:YES completion:nil];
                                 }];
        
        [alert addAction:action];
    }

    // Saved Photos Album
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeSavedPhotosAlbum]) {
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"Álbum de fotos"
                                                         style:UIAlertActionStyleDefault
                                                       handler:^(UIAlertAction * action)
                                 {
                                     UIImagePickerController *picker = [[UIImagePickerController alloc] init];
                                     [picker setSourceType:UIImagePickerControllerSourceTypeSavedPhotosAlbum];
                                     [picker setDelegate:self];
                                     [picker setAllowsEditing:YES];
                                     [self presentViewController:picker animated:YES completion:nil];
                                 }];
        
        [alert addAction:action];
    }
    
    // Exibe o alert
    [self presentViewController:alert animated:YES completion:nil];
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    UIImage *image = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
    [[self imageView] setImage:image];
}

@end
