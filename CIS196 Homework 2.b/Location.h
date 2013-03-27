//
//  Location.h
//  CIS196 Homework 2.b
//
//  Created by Gorkem Yurtseven on 3/25/13.
//  Copyright (c) 2013 Gorkem Yurtseven. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Notes;

@interface Location : NSManagedObject

@property (nonatomic, retain) NSNumber * lat;
@property (nonatomic, retain) NSNumber * log;
@property (nonatomic, retain) NSSet *note;
@end

@interface Location (CoreDataGeneratedAccessors)

- (void)addNoteObject:(Notes *)value;
- (void)removeNoteObject:(Notes *)value;
- (void)addNote:(NSSet *)values;
- (void)removeNote:(NSSet *)values;

@end
