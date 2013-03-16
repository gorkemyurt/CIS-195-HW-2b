//
//  GSYTableViewController.h
//  CIS196 Homework 2.b
//
//  Created by Gorkem Yurtseven on 3/14/13.
//  Copyright (c) 2013 Gorkem Yurtseven. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface GSYTableViewController : UITableViewController <CLLocationManagerDelegate>
@property (weak, nonatomic) IBOutlet UITextField *noteField;
- (IBAction)notebutton:(UIButton *)sender;

@end
