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

- (instancetype)initWithId:(NSInteger *)id name:(NSString *)name tel:(NSString *)tel email:(NSString *)email
{
    self = [super init];
    if (self) {
        self.id = id;
        self.name = name;
        self.tel = tel;
        self.email = email;
    }

    return self;
}


@end