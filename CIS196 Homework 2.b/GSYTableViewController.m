//
//  GSYTableViewController.m
//  CIS196 Homework 2.b
//
//  Created by Gorkem Yurtseven on 3/14/13.
//  Copyright (c) 2013 Gorkem Yurtseven. All rights reserved.
//

#import "GSYTableViewController.h"
#import "GSYOtherViewController.h"
#import "GSYViewController.h"
#define GSYCellIdentifier @"Cell"
NSMutableArray *mystr;


@interface GSYTableViewController ()
@property (strong, nonatomic) NSMutableArray *mystr;
@property (strong, nonatomic) NSMutableDictionary *notesdict;
@property (strong, nonatomic) CLLocation *currentlocation;
@property (strong, nonatomic) CLLocationManager *locationManager;


@end

@implementation GSYTableViewController

- (IBAction)backNotes:(UIStoryboardSegue *)segue {
    NSLog(@"%@", self.currentlocation);
    GSYOtherViewController *sNotesVC = segue.sourceViewController;
    NSArray*keys=[sNotesVC.mydict allKeys];
    [sNotesVC.mydict[[keys objectAtIndex:0]] addObject:self.currentlocation];    
    [self.notesdict addEntriesFromDictionary: sNotesVC.mydict];
//    NSLog(@"%@", self.notesdict);
    [self.tableView reloadData];
    
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    [self.locationManager startMonitoringSignificantLocationChanges];
    self.mystr = [[NSMutableArray alloc] init];
    self.notesdict = [[NSMutableDictionary alloc] init];
//    [self.notesdict setObject:@"value" forKey:@"key"];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - location delegate methods

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    self.currentlocation = [locations lastObject];
    NSLog(@"%@", self.currentlocation);
    
}


#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return [self.notesdict count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:GSYCellIdentifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:GSYCellIdentifier];
    }
    
    NSArray*keys=[self.notesdict allKeys];
    cell.textLabel.text = keys[indexPath.row];
        
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
}

#pragma mark - Segue

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"detailedview"]){
        UITableViewCell *cell = (UITableViewCell *)sender;
        NSString *cellkey = cell.textLabel.text;
        
        GSYViewController *dvc =  segue.destinationViewController;
        if ([dvc view]) {
            dvc.descriptionlabel.text = [self.notesdict[cellkey] objectAtIndex:0];
            CLLocation *postlocation = [self.notesdict[cellkey] objectAtIndex:1];
            dvc.titlelabel.text = cellkey;
            MKPointAnnotation *pin = [[MKPointAnnotation alloc] init];
            pin.coordinate = postlocation.coordinate;
            [dvc.mapview addAnnotation:pin];
        }
    
    }
}



@end
