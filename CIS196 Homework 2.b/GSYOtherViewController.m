//
//  GSYOtherViewController.m
//  CIS196 Homework 2.b
//
//  Created by Gorkem Yurtseven on 3/14/13.
//  Copyright (c) 2013 Gorkem Yurtseven. All rights reserved.
//

#import "GSYOtherViewController.h"
#import "Notes.h"
#import "GSYDataManager.h"

@interface GSYOtherViewController ()


@property (strong, nonatomic) CLLocation *currentLocation;
@property (strong, nonatomic) CLLocationManager *locationManager;

@end
@implementation GSYOtherViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    
    [super viewDidLoad];
    manager = [[GSYDataManager alloc] init];
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    [self.locationManager startMonitoringSignificantLocationChanges];

    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - location delegate methods

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    self.currentLocation = [locations lastObject];
    
}



- (void)prepareForSegue:(UIStoryboardSegue *)segue
                 sender:(id)sender {
    if ([segue.identifier isEqualToString:@"backtonotes"]) {
        [manager addNoteWithTitleAndDetail:_titleField.text detail:_description.text lat:[NSNumber numberWithDouble:self.currentLocation.coordinate.latitude] longg:[NSNumber numberWithDouble:self.currentLocation.coordinate.longitude]];
        
    }
        
}



@end
