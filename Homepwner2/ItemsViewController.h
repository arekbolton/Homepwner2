//
//  ItemsViewController.h
//  Homepwner
//
//  Created by Arek Bolton on 2/10/14.
//  Copyright (c) 2014 Arek Bolton. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DetailViewController.h"

@interface ItemsViewController : UITableViewController
{
    IBOutlet UIView *headerView;
}

-(IBAction)addNewItem:(id)sender;

@end
