//
//  ItemsViewController.h
//  Homepwner
//
//  Created by Arek Bolton on 2/10/14.
//  Copyright (c) 2014 Arek Bolton. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ItemsViewController : UITableViewController
{
    IBOutlet UIView *headerView;
}

-(UIView *) headerView;
-(IBAction)addNewItem:(id)sender;
-(IBAction)ToggleEditingMode:(id)sender;


@end
