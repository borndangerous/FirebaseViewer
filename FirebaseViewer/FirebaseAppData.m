//
//  FirebaseAppData.m
//  FirebaseViewer
//
//  Created by Adam Shamblin on 2/17/14.
//  Copyright (c) 2014 Adam Shamblin. All rights reserved.
//

#import "FirebaseAppData.h"

@interface FirebaseAppData ()

@property (nonatomic) FirebaseApp* app;
@property (nonatomic) Firebase* dbRef;

@end

@implementation FirebaseAppData

- (id) initWithFirebaseApp:(FirebaseApp *)app
{
    if ((self = [super init]) && app)
    {
        self.app = app;
        return self;
    }

    return nil;
}

- (NSString *) getAppName
{
    return self.app.appName;
}

- (NSString *) getAppURL
{
    return self.app.appURL;
}

- (void) connect
{
    self.dbRef = [[Firebase alloc] initWithUrl:self.app.appURL];
    
    [self.dbRef authWithCredential:self.app.appSecret withCompletionBlock:
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
}

- (void) onDataUpdate:(void (^)(id))block
{
    [self.dbRef observeEventType:FEventTypeValue withBlock:^(FDataSnapshot * snapshot) {
        block(snapshot);
    }];
}

@end
