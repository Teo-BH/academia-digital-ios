//
//  UserAccess+CoreDataProperties.h
//  StarWarsFanBoy
//
//  Created by Teobaldo Mauro de Moura on 9/18/15.
//  Copyright © 2015 Teobaldo Mauro de Moura. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "UserAccess.h"

NS_ASSUME_NONNULL_BEGIN

@interface UserAccess (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *entityname;
@property (nullable, nonatomic, retain) NSString *url;
@property (nullable, nonatomic, retain) NSDate *accessdate;

@end

NS_ASSUME_NONNULL_END
