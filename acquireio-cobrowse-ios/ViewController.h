//
//  ViewController.h
//  acquireio-cobrowse-ios
//
//  Created by Raju Jangid on 9/17/2017.
//  Copyright © 2017 AcquireIO Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIButton *connectBtn;
@property (strong, nonatomic) IBOutlet UILabel *cobrowseCodeLbl;
@property (strong, nonatomic) IBOutlet UIButton *showTextFormViewBtn;
@property (strong, nonatomic) IBOutlet UIButton *stopSharingBtn;
- (IBAction)connectTouched:(id)sender;
- (IBAction)stopSharingTouched:(id)sender;

@end

