//
//  AccountsViewController.m
//  iOS-Frameworks
//
//  Created by hzyuxiaohua on 8/18/16.
//  Copyright © 2016 hzyuxiaohua. All rights reserved.
//

#import "AccountsViewController.h"

#import <Accounts/Accounts.h>

@interface AccountsViewController ()

@end

@implementation AccountsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Accounts.framework";
    
    ACAccountStore* store = [[ACAccountStore alloc] init];
    ACAccountType* type = [store accountTypeWithAccountTypeIdentifier:ACAccountTypeIdentifierSinaWeibo];
    [store requestAccessToAccountsWithType:type options:nil completion:^(BOOL granted, NSError *error) {
        if (granted) {
            NSArray* accounts = [store accountsWithAccountType:type];
            UIAlertController* ac = [UIAlertController alertControllerWithTitle:@""
                                                                        message:@""
                                                                 preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction* action = [UIAlertAction actionWithTitle:@"OK"
                                                             style:UIAlertActionStyleCancel
                                                           handler:NULL];
            [ac addAction:action];
            if (accounts.count == 0) {
                ac.title = @"No Account Found";
            }
            else {
                ACAccount* account = accounts.firstObject;
                ac.title = account.accountDescription;
                ac.message = account.username;
            }
            
            [self presentViewController:ac animated:YES completion:NULL];
        }
    }];
}

@end
