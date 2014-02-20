//
//  IRPDataTableViewController.h
//  FirebaseViewer
//
//  Created by Adam Shamblin on 2/15/14.
//  Copyright (c) 2014 Adam Shamblin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Firebase/Firebase.h>
#import "FirebaseAppData.h"
#import "IRPAppInfoCell.h"
#import "IRPLeafNodeCell.h"
#import "IRPSnapshotViewController.h"

#define APP_INFO_CELL_HEIGHT 202

@class Firebase;

typedef enum {
    IRPAppInfoArea,
    IRPPathsArea,
} DisplayAreas;

@interface IRPDataTableViewController : UITableViewController

@property (nonatomic) FirebaseApp *currentApp;
@property (nonatomic) FirebaseAppData *appData;

@end
