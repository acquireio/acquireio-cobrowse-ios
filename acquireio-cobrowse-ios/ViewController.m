//
//  ViewController.m
//  acquireio-cobrowse-ios
//
//  Created by Raju Jangid on 9/17/2017.
//  Copyright © 2017 AcquireIO Inc. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import <AcquireIO/AcquireIO.h>

@interface ViewController ()<AcquireIODelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.stopSharingBtn.hidden = YES;
    self.connectBtn.layer.cornerRadius = 5.0f;
    self.showTextFormViewBtn.layer.cornerRadius = 5.0f;
    self.stopSharingBtn.layer.cornerRadius = 15.0f;
    [[AcquireIO support] addDelegate:self];
    
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    if([[AcquireIO support] getConnectionStatus] == AcquireIOConnectionStatusSessionStarted){
        NSInteger code = [[AcquireIO support] getCobrowseCode];
        self.cobrowseCodeLbl.text = [NSString stringWithFormat:@"%ld", (long)code];
    }
}

-(void)didReceiveTriggerEvent:(NSString *)eventName{
    NSLog(@"GOT Event : %@", eventName);
}

-(void) onCobrowseSessionRequestDecline{
    NSLog(@"Cobrowse Session Request Decline");
}

-(void) onCobrowseSessionRequestSucceeded{
    NSLog(@"Cobrowse Session Request Succeeded");
}

-(void) onAgentConnected{
    self.stopSharingBtn.hidden = NO;
    NSLog(@"Agent Connected");
}

-(void) onAgentEnded{
    NSLog(@"Agent Ended");
    self.stopSharingBtn.hidden = YES;
    //[[AcquireIO support] logoutVisitor];
}
-(void)  onSessionFailed{
    NSLog(@"Session Failed");
}
-(void) onError:(NSError *)error{
    NSLog(@"Session error %@", error);
}

- (void) didChangeAgentStatus:(NSString *)agentID
                    andStatus:(AcquireIOAgentStatus)status{
    
    NSLog(@"didChangeAgentStatus %@ ---- %ld", agentID, (long)status);
    
}

-(void)didChangeCobrowseCode:(NSInteger)session_code{
    self.cobrowseCodeLbl.text = [NSString stringWithFormat:@"%ld", (long)session_code];
}



-(void) didChangeConnectionStatus:(AcquireIOConnectionStatus)status{
    NSLog(@"didChangeConnectionStatus %ld", (long)status);
    if(status == AcquireIOConnectionStatusConnecting || status == AcquireIOConnectionStatusConnected){
        [self.connectBtn setTitle:@"Connecting..." forState:(UIControlStateNormal)];
        self.connectBtn.backgroundColor = [UIColor colorWithRed: 0.945 green: 0.498 blue: 0.318 alpha: 1];
        
        self.connectBtn.userInteractionEnabled = NO;
    }
    
    if(status == AcquireIOConnectionStatusSessionStarted){
        [self.connectBtn setTitle:@"Connected" forState:(UIControlStateNormal)];
        self.connectBtn.backgroundColor = [UIColor colorWithRed: 0.267 green: 0.58 blue: 0.345 alpha: 1];
        self.connectBtn.userInteractionEnabled = NO;
    }
    
    if(status == AcquireIOConnectionStatusDisconnected){
        [self.connectBtn setTitle:@"Start Again" forState:(UIControlStateNormal)];
        self.connectBtn.backgroundColor = [UIColor blackColor];
        self.connectBtn.userInteractionEnabled = YES;
    }
    
    //NSLog(@"didChangeConnectionStatus %ld", (long)status);
}

-(IBAction)supportOpen{
    [[AcquireIO support] showSupport:self];
}


- (IBAction)connectTouched:(id)sender {
    [((AppDelegate *)[UIApplication sharedApplication].delegate) setupAcquireIO];
    [[AcquireIO support] startSession];
}

- (IBAction)stopSharingTouched:(id)sender {
    self.stopSharingBtn.hidden = YES;
    //TODO: You can use endSharing:<SHOW_CONFIRMATION> or logoutVisitor. So if you are calling logoutVisitor then not need to call endSharing: method. Also you need to invoke logoutVisitor on AcquireIODelegate handle method onAgentEnded. see more in documentaion.
    [[AcquireIO support] endSharing:YES];
    
    //[[AcquireIO support] logoutVisitor];
}
@end
