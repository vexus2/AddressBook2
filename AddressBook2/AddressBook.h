//
// Created by tooyama on 2014/02/12.
// Copyright (c) 2014 vexus2. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface AddressBook : NSObject
@property(nonatomic) NSInteger *id;
@property(nonatomic, strong) NSString *name;
@property(nonatomic, strong) NSString *tel;
@property(nonatomic, strong) NSString *email;

- (instancetype)initWithEmail:(NSString *)email tel:(NSString *)tel name:(NSString *)name;

@end