//
//  MasterTableViewController.h
//  AddressBook2
//
//  Created by tooyama on 2014/02/10.
//  Copyright (c) 2014 vexus2. All rights reserved.
//

@class AddressBookDao;

@interface MasterTableViewController : UITableViewController

@property (nonatomic, strong) AddressBookDao *dao;
@property (nonatomic, strong) NSMutableArray *addressList;

- (IBAction)done:(UIStoryboardSegue *)segue;
- (IBAction)cancel:(UIStoryboardSegue *)segue;

@end
