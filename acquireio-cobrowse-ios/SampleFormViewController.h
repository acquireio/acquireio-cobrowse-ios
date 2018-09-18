//
//  SampleFormViewController.h
//  acquireio-cobrowse-ios
//
//  Created by Raju Jangid on 9/18/18.
//  Copyright © 2018 AcquireIO Inc. All rights reserved.
//

#import "ViewController.h"

@interface SampleFormViewController : ViewController{
    UIGestureRecognizer *tapAnywhere;
}
@property (strong, nonatomic) IBOutlet UITextField *emailAddress;
@property (strong, nonatomic) IBOutlet UITextField *passwordTxt;

@end
