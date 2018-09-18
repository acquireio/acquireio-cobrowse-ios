//
//  SampleFormViewController.m
//  acquireio-cobrowse-ios
//
//  Created by Raju Jangid on 9/18/18.
//  Copyright © 2018 AcquireIO Inc. All rights reserved.
//

#import "SampleFormViewController.h"
#import <AcquireIO/AcquireIO.h>

@interface SampleFormViewController ()

@end

@implementation SampleFormViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[AcquireIO support] addMaskedView:self.passwordTxt];
    
    tapAnywhere = [[UITapGestureRecognizer alloc]
              initWithTarget:self action:@selector(handleSingleTap:)];
    tapAnywhere.cancelsTouchesInView = NO;
    [self.view addGestureRecognizer:tapAnywhere];
}

- (void)handleSingleTap:(UITapGestureRecognizer *) sender{
    [self.view endEditing:YES];
}

@end
