//
//  GSYOtherViewController.h
//  CIS196 Homework 2.b
//
//  Created by Gorkem Yurtseven on 3/14/13.
//  Copyright (c) 2013 Gorkem Yurtseven. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>
#import "GSYDataManager.h"

@interface GSYOtherViewController : UIViewController <CLLocationManagerDelegate>{
    GSYDataManager *manager;
}

@property (weak,nonatomic) NSArray *mynotes;
@property (weak, nonatomic) IBOutlet UITextField *titleField;
@property (weak, nonatomic) IBOutlet UITextField *description;
//@property (strong, nonatomic) NSMutableDictionary *mydict;
//@property (strong, nonatomic) NSMutableArray *mydata;

@end
