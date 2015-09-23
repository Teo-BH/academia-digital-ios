//
//  ViewController.swift
//  DesafioFotoMapa
//
//  Created by Teobaldo Mauro de Moura on 9/23/15.
//  Copyright © 2015 Teobaldo Mauro de Moura. All rights reserved.
//

import UIKit
import MapKit
import CoreData

class PhotoViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    
    // MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.newLocationManager()
    }
    
    // MARK: Photo
    
    @IBAction func cameraButtonTouched(sender: UIButton) {
        // solicita a localização
        manager.requestLocation();
        
        // Tira a foto
        self.takePhoto()
    }
    
    func takePhoto() {
        let picker = UIImagePickerController()
        picker.sourceType = .Camera
        picker.delegate = self
        picker.allowsEditing = true;
        self.presentViewController(picker, animated: true, completion: nil);
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        let image:UIImage? = info[UIImagePickerControllerEditedImage] as? UIImage
        self.imageView.image = image;
        
        if let img = image, coordinate = lastCoordinate {
            self.saveData(coordinate, image: img);
        }

        self.dismissViewControllerAnimated(true, completion: nil);
    }
    
    
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        self.dismissViewControllerAnimated(true, completion: nil);
    }
    
    // MARK: GPS
    
    var manager = CLLocationManager()
    
    func newLocationManager() {
        // Define o delegate
        manager.delegate = self;
        
        // Solicitando autorização do usuário
        manager.requestAlwaysAuthorization();
        
        // Determina a precisão do GPS
        manager.desiredAccuracy = kCLLocationAccuracyBest;
        
        // Solicita a localização
        manager.requestLocation()
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations.last;
        
        if let myLocation = location {
             print(myLocation.coordinate);
            lastCoordinate = myLocation.coordinate;
        }
    }
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        print(error);
    }
    
    var lastCoordinate:CLLocationCoordinate2D? = nil;
    
    // MARK: CoreData
    
    func saveData(coordinate:CLLocationCoordinate2D, image:UIImage)  {
        let entity:NSEntityDescription = NSEntityDescription.entityForName("Photo", inManagedObjectContext: self.context)!
        
        let photo = Photo(entity: entity, insertIntoManagedObjectContext: self.context)
        
        photo.latitude = coordinate.latitude
        photo.longitude = coordinate.longitude
        photo.created = NSDate()
        photo.image = UIImagePNGRepresentation(image)
        
        self.appDelegate.saveContext();
    }
    
    var appDelegate: AppDelegate {
        get {
            let result:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate;
            return result;
        }
    }
    
    var context:NSManagedObjectContext {
        get {
            let result:NSManagedObjectContext = self.appDelegate.managedObjectContext;
            return result;
        }
    }
}

