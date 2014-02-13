//
// Created by tooyama on 2014/02/12.
// Copyright (c) 2014 vexus2. All rights reserved.
//

#import "AddressBook.h"


@implementation AddressBook
{

}
- (instancetype)initWithEmail:(NSString *)email tel:(NSString *)tel name:(NSString *)name
{
    self = [super init];
    if (self) {
        self.email = email;
        self.tel = tel;
        self.name = name;
    }

    return self;
}

@end