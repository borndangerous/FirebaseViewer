//
//  IRPAppInfoCell.h
//  FirebaseViewer
//
//  Created by Adam Shamblin on 2/17/14.
//  Copyright (c) 2014 Adam Shamblin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FirebaseAppData.h"

@interface IRPAppInfoCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *appNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *appURLLabel;

- (void) setCurrentApp: (FirebaseAppData *) currentApp;

@end
