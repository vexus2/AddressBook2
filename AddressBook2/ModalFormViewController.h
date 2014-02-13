//
//  ModalFormViewController.h
//  AddressBook2
//
//  Created by tooyama on 2014/02/10.
//  Copyright (c) 2014 vexus2. All rights reserved.
//



@interface ModalFormViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *telField;
@property (weak, nonatomic) IBOutlet UITextField *emailField;
- (IBAction)doneAction:(id)sender;

@end
