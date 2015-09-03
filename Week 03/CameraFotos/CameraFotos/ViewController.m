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

#pragma mark - View Lifecycle

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

#pragma mark - Buttons

- (IBAction)escolherImagem:(UIButton *)sender {
    UIAlertController *alert = [self alertSheetController];
    
    UIImagePickerControllerSourceType sourceTypes[] = {
        UIImagePickerControllerSourceTypeCamera,
        UIImagePickerControllerSourceTypePhotoLibrary,
        UIImagePickerControllerSourceTypeSavedPhotosAlbum
    };
    
    for (int i = 0; i < 3; i++) {
        UIImagePickerControllerSourceType sourceType = sourceTypes[i];
        if ([UIImagePickerController isSourceTypeAvailable:sourceType]) {
            UIAlertAction *action = [self alertActionForSourceType:sourceTypes[i]];
            [alert addAction:action];
        }
    }
    
    // Exibe o alert
    [self presentViewController:alert animated:YES completion:nil];
}


-(UIAlertAction *)alertActionForSourceType:(UIImagePickerControllerSourceType)sourceType {
    void (^handler)(UIAlertAction *) = ^(UIAlertAction *action) {
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        [picker setSourceType:sourceType];
        [picker setDelegate:self];
        [picker setAllowsEditing:YES];
        [self presentViewController:picker animated:YES completion:nil];
    };
    
    NSString *sheetTitle = [self titleForSheetWithSourceType:sourceType];
    
    return [UIAlertAction actionWithTitle:sheetTitle
                                    style:UIAlertActionStyleDefault
                                  handler:handler];
}

-(UIAlertController *)alertSheetController {
    UIAlertController *result = [UIAlertController
                                 alertControllerWithTitle:@"Escolha a origem"
                                 message:nil
                                 preferredStyle:UIAlertControllerStyleActionSheet];
    return result;
}

-(NSString *)titleForSheetWithSourceType:(UIImagePickerControllerSourceType)sourceType {
    switch (sourceType) {
        case UIImagePickerControllerSourceTypeCamera:
            return @"Camera";
        case UIImagePickerControllerSourceTypePhotoLibrary:
            return @"Biblioteca de fotos";
        case UIImagePickerControllerSourceTypeSavedPhotosAlbum:
            return @"Álbum de fotos";
        default:
            return nil;
    }
}

#pragma mark - UIImageViewPickerController Delegate

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    UIImage *image = [info objectForKey:UIImagePickerControllerEditedImage];
    [[self imageView] setImage:image];
    
    // Fecha o ImagePicker
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    // Fecha o ImagePicker
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
