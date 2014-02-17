//
//  DetailViewController.h
//  AddressBook2
//
//  Created by tooyama on 2014/02/10.
//  Copyright (c) 2014 vexus2. All rights reserved.
//



@class AddressBook;

@interface DetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *telLabel;
@property (weak, nonatomic) IBOutlet UILabel *emailLabel;

@property(nonatomic, strong) AddressBook * addressBook;
@end
