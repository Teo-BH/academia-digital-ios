//
//  ViewController.swift
//  GPS
//
//  Created by Teobaldo Mauro de Moura on 9/23/15.
//  Copyright © 2015 Teobaldo Mauro de Moura. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {

    // Tip: Adicionar a mensagem para o usuário na propriedade NSLocationAlwaysUsageDescription do Info.plist
    
    var manager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // define o delegate
        manager.delegate = self
        
        // Solicitando autorização do usuário
        manager.requestAlwaysAuthorization()
        
        // Determina a precisão do GPS
        manager.desiredAccuracy = kCLLocationAccuracyBest;
        
        // Inicia o GPS
        //manager.startUpdatingLocation()
    }
    
    @IBAction func whereTouched(sender: UIButton) {
        manager.requestLocation()
    }

    // mark: CLLocationManagerDelegate
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        print(error)
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations.last;
        
        if let myLocation = location {
            print(myLocation.coordinate.latitude)
            print(myLocation.coordinate.longitude);
        }
    }
    
    
}

