//
// Created by tooyama on 2014/02/12.
// Copyright (c) 2014 vexus2. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AddressBook;


@interface AddressBookDao : NSObject
- (AddressBook*)add:(AddressBook*)addressBook;
- (NSArray*)books;
- (BOOL)remove:(NSInteger)id;
- (BOOL)update:(AddressBook*)addressBook;
@end