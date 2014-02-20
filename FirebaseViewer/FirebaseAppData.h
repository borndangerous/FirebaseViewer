//
//  FirebaseAppData.h
//  FirebaseViewer
//
//  Created by Adam Shamblin on 2/17/14.
//  Copyright (c) 2014 Adam Shamblin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Firebase/Firebase.h>
#import "FirebaseApp.h"

@interface FirebaseAppData : NSObject

@property (nonatomic, readonly, getter = getAppName) NSString *appName;
@property (nonatomic, readonly, getter = getAppURL) NSString *appURL;

- (id) initWithFirebaseApp: (FirebaseApp *) app;
- (void) connect;
- (void) onDataUpdate: (void (^)(id)) block;

@end
