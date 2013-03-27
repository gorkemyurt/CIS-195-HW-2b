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
#import "GSYDataManager.h"

@interface GSYTableViewController : UITableViewController <CLLocationManagerDelegate, UISearchBarDelegate, UISearchDisplayDelegate> {
    GSYDataManager *manager;
}
@property (weak, nonatomic) IBOutlet UITextField *noteField;
@property (strong,nonatomic) NSMutableArray *filteredNotesArray;
@property IBOutlet UISearchBar *notesSearchBar;


//- (IBAction)notebutton:(UIButton *)sender;

@end
