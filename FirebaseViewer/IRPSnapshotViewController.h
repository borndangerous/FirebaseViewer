//
//  IRPSnapshotViewController.h
//  FirebaseViewer
//
//  Created by Adam Shamblin on 2/20/14.
//  Copyright (c) 2014 Adam Shamblin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Firebase/Firebase.h>
#import "IRPLeafNodeCell.h"

@interface IRPSnapshotViewController : UITableViewController

@property (nonatomic) FDataSnapshot * snapshot;

@end
