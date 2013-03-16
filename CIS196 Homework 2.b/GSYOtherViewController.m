//
//  GSYOtherViewController.m
//  CIS196 Homework 2.b
//
//  Created by Gorkem Yurtseven on 3/14/13.
//  Copyright (c) 2013 Gorkem Yurtseven. All rights reserved.
//

#import "GSYOtherViewController.h"

@interface GSYOtherViewController ()

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
     self.mydict = [[NSMutableDictionary alloc] init];
     self.mydata = [[NSMutableArray alloc] init];
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue
                 sender:(id)sender {
    if ([segue.identifier isEqualToString:@"backtonotes"]) {
        NSString *title = _titleField.text;
        NSString *description = _description.text;
        [self.mydata addObject:description];
        [self.mydict setObject:self.mydata forKey:title];
        
        }
        
}



@end
