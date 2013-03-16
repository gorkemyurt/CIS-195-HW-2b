//
//  GSYOtherViewController.h
//  CIS196 Homework 2.b
//
//  Created by Gorkem Yurtseven on 3/14/13.
//  Copyright (c) 2013 Gorkem Yurtseven. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GSYOtherViewController : UIViewController
- (IBAction)doneButton:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UITextField *titleField;
@property (weak, nonatomic) IBOutlet UITextField *description;
@property (strong, nonatomic) NSMutableDictionary *mydict;
@property (strong, nonatomic) NSMutableArray *mydata;

@end
