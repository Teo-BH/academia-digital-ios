//
//  Photo+CoreDataProperties.swift
//  DesafioFotoMapa
//
//  Created by Teobaldo Mauro de Moura on 9/23/15.
//  Copyright © 2015 Teobaldo Mauro de Moura. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Photo {

    @NSManaged var latitude: NSNumber?
    @NSManaged var longitude: NSNumber?
    @NSManaged var image: NSData?
    @NSManaged var created: NSDate?

}
