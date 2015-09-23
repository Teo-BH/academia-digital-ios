//
//  Photo.swift
//  DesafioFotoMapa
//
//  Created by Teobaldo Mauro de Moura on 9/23/15.
//  Copyright © 2015 Teobaldo Mauro de Moura. All rights reserved.
//

import Foundation
import CoreData

class Photo: NSManagedObject {

// Insert code here to add functionality to your managed object subclass

    override init(entity: NSEntityDescription, insertIntoManagedObjectContext context: NSManagedObjectContext?) {
        super.init(entity: entity, insertIntoManagedObjectContext: context)
    }

}
