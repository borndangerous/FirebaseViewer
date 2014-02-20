//
//  IRPAppInfoCell.m
//  FirebaseViewer
//
//  Created by Adam Shamblin on 2/17/14.
//  Copyright (c) 2014 Adam Shamblin. All rights reserved.
//

#import "IRPAppInfoCell.h"

@implementation IRPAppInfoCell

- (id) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void) setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void) setCurrentApp:(FirebaseAppData *)currentApp
{
    self.appNameLabel.text = currentApp.appName;
    self.appURLLabel.text = currentApp.appURL;
}

@end
