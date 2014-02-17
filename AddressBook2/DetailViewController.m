//
//  DetailViewController.m
//  AddressBook2
//
//  Created by tooyama on 2014/02/10.
//  Copyright (c) 2014 vexus2. All rights reserved.
//

#import "DetailViewController.h"
#import "AddressBook.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

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
    if (self.addressBook) {
        self.nameLabel.text = self.addressBook.name;
        self.telLabel.text = self.addressBook.tel;
        self.emailLabel.text = self.addressBook.email;
    }

    // スワイプジェスチャーを作成して、登録する。
    UISwipeGestureRecognizer *swipe
            = [[UISwipeGestureRecognizer alloc]
                    initWithTarget:self action:@selector(swipeBack:)];
    // スワイプの方向は右方向を指定する。
    swipe.direction = UISwipeGestureRecognizerDirectionRight;
    // スワイプ動作に必要な指は1本と指定する。
    swipe.numberOfTouchesRequired = 1;
    [self.view addGestureRecognizer:swipe];
}

- (void)swipeBack:(UISwipeGestureRecognizer *)gesture
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
