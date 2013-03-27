//
//  GSYTableViewController.m
//  CIS196 Homework 2.b
//
//  Created by Gorkem Yurtseven on 3/14/13.
//  Copyright (c) 2013 Gorkem Yurtseven. All rights reserved.
//

#import "GSYTableViewController.h"
#import "GSYOtherViewController.h"
#import "GSYDetailedViewController.h"
#import "GSYDataManager.h"
#import "Notes.h"

#define GSYCellIdentifier @"Cell"


@interface GSYTableViewController ()
@property (strong, nonatomic) NSArray *mynotes;
//@property (strong, nonatomic) NSMutableArray *mystr;
@property (strong, nonatomic) CLLocation *currentlocation;
@property (strong, nonatomic) CLLocationManager *locationManager;


@end

@implementation GSYTableViewController


//- (GSYDataManager *)manager
//{
//    if (!manager) 
//    return manager;
//}



- (IBAction)backNotes:(UIStoryboardSegue *)segue {
    
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
    manager = [[GSYDataManager alloc] init];
    self.mynotes = [[NSArray alloc] init];
    self.mynotes = manager.getAllNotes;
    self.filteredNotesArray = [NSMutableArray arrayWithCapacity:[self.mynotes count]];
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    [self.locationManager startMonitoringSignificantLocationChanges];
    [self.tableView reloadData];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - location delegate methods

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    self.currentlocation = [locations lastObject];
    
}


#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    // Check to see whether the normal table or search results table is being displayed and return the count from the appropriate array
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        return [self.filteredNotesArray count];
    } else {
        return [self.mynotes count];
    }
    
//    return [manager.getAllNotes count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:GSYCellIdentifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:GSYCellIdentifier];
    }
    
//     Notes *note = manager.getAllNotes[indexPath.row];
    Notes *note;
    // Check to see whether the normal table or search results table is being displayed and set the Candy object from the appropriate array
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        note = [self.filteredNotesArray objectAtIndex:indexPath.row];
    } else {
        note = [self.mynotes objectAtIndex:indexPath.row];
    }
    
    cell.textLabel.text = note.title;
     return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    
}

#pragma mark - Segue

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"detailedview"]){
//        UITableViewCell *cell = (UITableViewCell *)sender;
//        NSString *cellkey = cell.textLabel.text;
        
        GSYDetailedViewController *dvc =  segue.destinationViewController;
        if ([dvc view]) {
            
            NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
            Notes *note = manager.getAllNotes[indexPath.row];
            
            dvc.descriptionlabel.text = note.detail;
            dvc.titlelabel.text = note.title;
            
            CLLocationCoordinate2D local;
            
            local.latitude = [note.latt doubleValue];
            local.longitude = [note.longg doubleValue];
            MKPointAnnotation *pin = [[MKPointAnnotation alloc] init];
            pin.coordinate = local;
            [dvc.mapview addAnnotation:pin];
        }
    
    }
}

#pragma mark Content Filtering
-(void)filterContentForSearchText:(NSString*)searchText scope:(NSString*)scope {
    // Update the filtered array based on the search text and scope.
    // Remove all objects from the filtered search array
    [self.filteredNotesArray removeAllObjects];
    // Filter the array using NSPredicate
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF.title contains[c] %@",searchText];
    self.filteredNotesArray = [NSMutableArray arrayWithArray:[self.mynotes filteredArrayUsingPredicate:predicate]];
}

#pragma mark - UISearchDisplayController Delegate Methods
-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString {
    
    NSLog(@"hey");
    // Tells the table data source to reload when text changes
    [self filterContentForSearchText:searchString scope:
     [[self.searchDisplayController.searchBar scopeButtonTitles] objectAtIndex:[self.searchDisplayController.searchBar selectedScopeButtonIndex]]];
    // Return YES to cause the search result table view to be reloaded.
    return YES;
}

-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchScope:(NSInteger)searchOption {
    // Tells the table data source to reload when scope bar selection changes
    [self filterContentForSearchText:self.searchDisplayController.searchBar.text scope:
     [[self.searchDisplayController.searchBar scopeButtonTitles] objectAtIndex:searchOption]];
    // Return YES to cause the search result table view to be reloaded.
    return YES;
}




@end
