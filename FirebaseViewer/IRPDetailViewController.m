//
//  IRPDetailViewController.m
//  FirebaseViewer
//
//  Created by Adam Shamblin on 2/11/14.
//  Copyright (c) 2014 Adam Shamblin. All rights reserved.
//

#import "IRPDetailViewController.h"

@interface IRPDetailViewController ()

@property (weak, nonatomic) IBOutlet UITextView *detailJSONView;

@end

@implementation IRPDetailViewController

#pragma mark - Managing the detail item

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    Firebase *dbRef = [self connect];
    if(dbRef != nil)
    {
        [self observeConnection:dbRef];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (Firebase *) connect
{
    Firebase *dbRef = [[Firebase alloc] initWithUrl:self.detailItem.appURL];

    [dbRef authWithCredential:self.detailItem.appSecret withCompletionBlock:
     ^(NSError *error, id authData){
         if(error != nil)
         {
             NSLog(@"Login failed: %@", error);
         } else {
             NSLog(@"Login succeeded!");
         }
     } withCancelBlock:^(NSError *error) {
         NSLog(@"Authentication cancelled: %@", error);
     }];
    
    return dbRef;
}

- (void) observeConnection: (Firebase *) dbRef
{
    [dbRef observeEventType:FEventTypeValue withBlock:^(FDataSnapshot *snapshot) {
        NSLog(@"%@ -> %@", snapshot.name, snapshot.value);
        self.detailJSONView.text = [NSString stringWithFormat:@"%@", snapshot.value];
    }];
}

@end
