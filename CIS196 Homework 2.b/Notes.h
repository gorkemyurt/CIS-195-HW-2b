//
//  Notes.h
//  CIS196 Homework 2.b
//
//  Created by Gorkem Yurtseven on 3/25/13.
//  Copyright (c) 2013 Gorkem Yurtseven. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Notes : NSManagedObject

@property (nonatomic, retain) NSString * detail;
@property (nonatomic, retain) NSDate * timeStamp;
@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSNumber * latt;
@property (nonatomic, retain) NSNumber * longg;

@end
