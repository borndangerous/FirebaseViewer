//
//  IRPLeafNodeCell.h
//  FirebaseViewer
//
//  Created by Adam Shamblin on 2/19/14.
//  Copyright (c) 2014 Adam Shamblin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FirebaseAppData.h"

@interface IRPLeafNodeCell : UITableViewCell

@property (nonatomic) FDataSnapshot *snapshot;

- (void) setInfo: (FDataSnapshot *) currentField;

@end
