//
//  ItemStore.h
//  Homepwner
//
//  Created by Arek Bolton on 2/10/14.
//  Copyright (c) 2014 Arek Bolton. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNRItem.h"

@interface ItemStore : NSObject {
    NSMutableArray *allItems;
}

+ (ItemStore *) sharedStore;
-(NSArray *) allItems;
-(BNRItem *) createItem;
-(void)removeItem:(BNRItem *) p;
-(void)moveItemAtIndex:(int)from toIndex:(int) to;


@end
