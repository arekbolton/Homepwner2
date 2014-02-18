//
//  ItemsViewController.m
//  Homepwner
//
//  Created by Arek Bolton on 2/10/14.
//  Copyright (c) 2014 Arek Bolton. All rights reserved.
//

#import "ItemsViewController.h"
#import "ItemStore.h"
#import "BNRItem.h"

@implementation ItemsViewController

-(id)init {
    self = [super initWithStyle:UITableViewStyleGrouped];
    if(self){
        for (int i=0; i<5; i++) {
            [[ItemStore sharedStore] createItem];
        }
    }
    return self;
}

- (id) initWithStyle:(UITableViewStyle)style {
    return [self init];
}


- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger) section
{
    return [[[ItemStore sharedStore] allItems] count];
}

- (UITableViewCell *) tableView:(UITableView *) tableView cellForRowAtIndexPath:(NSIndexPath *) indexPath {

    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"];
    
    BNRItem *p = [[[ItemStore sharedStore] allItems] objectAtIndex:[indexPath row]];
    
    [[cell textLabel] setText:[p description]];
    
    if(!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"];
    }
        

    return cell;
}

-(UIView *) headerView
{
    if (!headerView) {
        [[NSBundle mainBundle] loadNibNamed:@"HeaderView" owner:self options:nil];
    }
    return headerView;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger) section {
    return [self headerView];
}

-(CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return [[self headerView] bounds].size.height;
}

-(void) tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle) editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        ItemStore *ps = [ItemStore sharedStore];
        NSArray *items = [ps allItems];
        BNRItem *p = [items objectAtIndex:[indexPath row]];
        [ps removeItem:p];
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

-(void)tableView:(UITableView *) tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
{
    [[ItemStore sharedStore] moveItemAtIndex:[sourceIndexPath row] toIndex:[destinationIndexPath row]];
}



#pragma mark - Button Methods

-(IBAction) ToggleEditingMode: (id) sender {
    if ([self isEditing]) {
        [sender setTitle:@"Edit" forState:UIControlStateNormal];
        [self setEditing:NO];
    }else{
        [sender setTitle:@"Done" forState:UIControlStateNormal];
        [self setEditing:YES animated:YES];
    }
}

-(IBAction)addNewItem:(id)sender{
    BNRItem *newItem = [[ItemStore sharedStore] createItem];
    int lastRow = [[[ItemStore sharedStore] allItems] indexOfObject:newItem];
    NSIndexPath *ip = [NSIndexPath indexPathForRow:lastRow inSection:0];
    [[self tableView] insertRowsAtIndexPaths:[NSArray arrayWithObject:ip]withRowAnimation:UITableViewRowAnimationTop];
    
}
@end
