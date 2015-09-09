//
//  ViewController.m
//  Mapas
//
//  Created by Teobaldo Mauro de Moura on 9/9/15.
//  Copyright © 2015 Teobaldo Mauro de Moura. All rights reserved.
//

#import "ViewController.h"
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

#define ANNOTATION_ID @"AnnotationIdentifier"

@interface ViewController () <MKMapViewDelegate, CLLocationManagerDelegate>

@property (weak, nonatomic) IBOutlet UISegmentedControl *mapTypeSegmentedControl;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@end

@implementation ViewController {
    CLLocationManager *locationManager;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    [[self mapTypeSegmentedControl] setSelectedSegmentIndex:1];
    [self mapTypeChanged:[self mapTypeSegmentedControl]];
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    // Habilita a leitura da localização (deve ser declarado no escopo da classe)
    if (!locationManager) {
        locationManager = [[CLLocationManager alloc] init];
        [locationManager setDelegate:self];
       
        // define a precisão da localização (quanto mais preciso => maior o consumo de bateria)
        [locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
        
        // NOTA: é preciso adicionar a chave 'NSLocationWhenInUseUsageDescription' no info.plist
        [locationManager requestWhenInUseAuthorization];
        
        // NOTA: é preciso adicionar a chave 'NSLocationAlwaysUsageDescription' no info.plist
        [locationManager requestAlwaysAuthorization];
    }
}

- (IBAction)mapTypeChanged:(UISegmentedControl *)sender {
    MKMapType mapType = (MKMapType)sender.selectedSegmentIndex;
    [[self mapView] setMapType:mapType];
}

// botão marcar
//  - criar MKPointAnnotation
//    qualquer coordenadas (sugestão: jack)
//  - mapView addAnnotation:
- (IBAction)marcarTouched:(UIButton *)sender {
    CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(-19.974913, -43.944930);
    
    // Anotação
    MKPointAnnotation *annotation = [[MKPointAnnotation alloc] init];
    [annotation setTitle:@"BH Shopping"];
    [annotation setSubtitle:@"Multiplan"];
    [annotation setCoordinate:coordinate];
    
    [[self mapView] removeAnnotations:[[self mapView] annotations]]; // Limpa todos os pins
    [[self mapView] addAnnotation:annotation];
    
    // Overload
    MKCircle *circle = [MKCircle circleWithCenterCoordinate:coordinate
                                                     radius:300];
    [[self mapView] removeOverlays:[[self mapView] overlays]];
    [[self mapView] addOverlay:circle];
    
    // Outros overlays
    // MKPolygon -> MKPolygonRenderer
    // MKPolyline -> MKPolylineRenderer
    
    // Monitorar Região
    CLCircularRegion *circleRegion = [[CLCircularRegion alloc] initWithCenter:coordinate
                                                                       radius:250 // (precisão 150 a 500 metros)
                                                                   identifier:@"BH Shopping"];
    [locationManager startMonitoringForRegion:circleRegion];
}

// botão centralizar
//  - centraliza o mapa na CI&T (CLLocationCoordinate2DMake)
- (IBAction)centralizarTouched:(UIButton *)sender {
    // CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(-19.928779, -43.931893); // CI&T
    // ou
    CLLocationCoordinate2D coordinate = [[[self mapView] userLocation] coordinate];
    
    //[[self mapView] setCenterCoordinate:coordinate];
    // ou
    MKCoordinateSpan span = MKCoordinateSpanMake(0.01, 0.01);
    MKCoordinateRegion region = MKCoordinateRegionMake(coordinate, span);
    [[self mapView] setRegion:region animated:YES];
}

#pragma mark - MKMapViewDelegate

//  criar MKPinAnnotationView somente se a anotação for MKPointAnnotation
//  resto retornar nil
-(MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation {
    if ([annotation isKindOfClass:[MKPointAnnotation class]]) {
        MKPinAnnotationView *pinView = (MKPinAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:ANNOTATION_ID];
        if (!pinView) {
            pinView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:ANNOTATION_ID];
        }

        [pinView setCanShowCallout:YES];
        [pinView setPinColor:MKPinAnnotationColorGreen];
        [pinView setAnimatesDrop:YES];
        
        UIImage *image = [UIImage imageNamed:@""];
        UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
        [pinView setLeftCalloutAccessoryView:imageView];
        
        UIButton *info = [UIButton buttonWithType:UIButtonTypeInfoLight];
        [pinView setRightCalloutAccessoryView:info];
        
        return pinView;
    } else {
        return nil;
    }
}

-(MKOverlayRenderer *)mapView:(MKMapView *)mapView rendererForOverlay:(id<MKOverlay>)overlay {
    if ([overlay isKindOfClass:[MKCircle class]]) {
        MKCircleRenderer *renderer = [[MKCircleRenderer alloc] initWithOverlay:overlay];
        // preenchimento
        [renderer setFillColor:[[UIColor redColor] colorWithAlphaComponent:0.3]];
        // borda
        [renderer setStrokeColor:[UIColor redColor]];
        [renderer setLineWidth:1];
        
        return renderer;
    } else {
        return nil;
    }
}

-(void)mapView:(MKMapView *)mapView didFailToLocateUserWithError:(NSError *)error {
    NSLog(@"%@", error);
}

-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation {
    NSLog(@"{%.3f, %.3f}", userLocation.coordinate.latitude, userLocation.coordinate.longitude);
}

#pragma mark - CLLocationManagerDelegate

-(void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status {
    switch (status) {
        case kCLAuthorizationStatusAuthorizedAlways:
        case kCLAuthorizationStatusAuthorizedWhenInUse:
            NSLog(@"Autorizado");
            break;
        case kCLAuthorizationStatusNotDetermined: // ainda não definido
            NSLog(@"Indeterminado");
            break;
        case kCLAuthorizationStatusDenied: // negou ou desabilitou
        case kCLAuthorizationStatusRestricted: // parental control, usuário não tem permissão para autorizar ou negar
            NSLog(@"Negado");
            break;
    }
}

-(void)locationManager:(CLLocationManager *)manager didEnterRegion:(CLRegion *)region {
    NSLog(@"%@", NSStringFromSelector(_cmd));
    
}

-(void)locationManager:(CLLocationManager *)manager didExitRegion:(CLRegion *)region {
    NSLog(@"%@", NSStringFromSelector(_cmd));
}

@end
