//
//  ItemStore.m
//  Homepwner
//
//  Created by Arek Bolton on 2/10/14.
//  Copyright (c) 2014 Arek Bolton. All rights reserved.
//

#import "ItemStore.h"

@class BNRItem;

@implementation ItemStore

- (id) init{
    self = [super init];
    if (self) {
        allItems = [[NSMutableArray alloc] init];
    }
    return self;
}

+ (ItemStore *) sharedStore {
    static ItemStore *sharedStore = nil;
    if( !sharedStore)
        sharedStore = [[super allocWithZone: nil] init];
    return sharedStore;
    
}

+ (id)allocWithZone:(struct _NSZone *)zone
{
    return [self sharedStore];
}

- (NSArray *) allItems {
    return allItems;
}

-(BNRItem *) createItem {
    BNRItem *p = [BNRItem randomItem];
    [allItems addObject:p];
    return p;
}

-(void) removeItem:(BNRItem *)p
{
    [allItems removeObjectIdenticalTo:p];
}

-(void)moveItemAtIndex:(int)from toIndex:(int)to
{
    if (from == to) {
        return;
    }
    BNRItem *p = [allItems objectAtIndex:from];
    [allItems removeObjectAtIndex:from];
    [allItems insertObject:p atIndex:to];
}

@end
