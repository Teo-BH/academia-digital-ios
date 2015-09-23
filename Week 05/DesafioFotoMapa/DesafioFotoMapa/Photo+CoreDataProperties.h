//
//  Photo+CoreDataProperties.h
//  DesafioFotoMapa
//
//  Created by Teobaldo Mauro de Moura on 9/23/15.
//  Copyright © 2015 Teobaldo Mauro de Moura. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Photo.h"

NS_ASSUME_NONNULL_BEGIN

@interface Photo (CoreDataProperties)

@property (nullable, nonatomic, retain) NSNumber *latitude;
@property (nullable, nonatomic, retain) NSNumber *longitude;
@property (nullable, nonatomic, retain) NSData *image;
@property (nullable, nonatomic, retain) NSDate *created;

@end

NS_ASSUME_NONNULL_END
