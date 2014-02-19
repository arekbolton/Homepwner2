//
//  DetailViewController.h
//  Homepwner2
//
//  Created by Arek Bolton on 2/17/14.
//  Copyright (c) 2014 Arek Bolton. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BNRItem;

@interface DetailViewController : UIViewController
{
    
    __weak IBOutlet UITextField *nameField;
    __weak IBOutlet UITextField *serialNumberField;
    __weak IBOutlet UITextField *valueField;
    __weak IBOutlet UILabel *dateLabel;
    __weak IBOutlet UIImageView *imageView;
    
}

@property (nonatomic, strong) BNRItem *item;

- (IBAction)takePicture:(id)sender;

@end
