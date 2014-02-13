//
//  MasterTableViewController.m
//  AddressBook2
//
//  Created by tooyama on 2014/02/10.
//  Copyright (c) 2014 vexus2. All rights reserved.
//

#import "MasterTableViewController.h"
#import "ModalFormViewController.h"
#import "AddressBookDao.h"
#import "AddressBook.h"

@interface MasterTableViewController ()

@end

@implementation MasterTableViewController

- (void)awakeFromNib
{
    [super awakeFromNib];
    //TODO: DBから全データ取ってくる
    self.addressList = [[NSMutableArray alloc] init];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.dao = [[AddressBookDao alloc] init];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)done:(UIStoryboardSegue *)segue
{
    if ([[segue identifier] isEqualToString:@"ReturnInput"]) {
        ModalFormViewController *modalFormViewController = [segue
                sourceViewController];

        AddressBook *addressBook = [[AddressBook alloc] initWithEmail:[[segue sourceViewController] emailField].text tel:[[segue sourceViewController] telField].text name:[[segue sourceViewController] nameField].text];
        addressBook = [self.dao add:addressBook];

        [self.addressList addObject:addressBook];
        [[self tableView] reloadData];

        //TODO: 各データのバリデーション
        [self dismissViewControllerAnimated:YES completion:NULL];
    }
}


- (IBAction)cancel:(UIStoryboardSegue *)segue
{
    if ([[segue identifier] isEqualToString:@"CancelInput"]) {
        [self dismissViewControllerAnimated:YES completion:NULL];
    }
}


#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.addressList count];

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"AddressBookCell";

    static NSDateFormatter *formatter = nil;

    if (formatter == nil) {
        formatter = [[NSDateFormatter alloc] init];
        [formatter setDateStyle:NSDateFormatterMediumStyle];
    }

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];

    AddressBook *addressBook = [self.addressList objectAtIndex:indexPath.row];

    [[cell textLabel] setText:addressBook.name];

    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return NO;
}


@end
