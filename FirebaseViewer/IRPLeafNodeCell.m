//
//  IRPLeafNodeCell.m
//  FirebaseViewer
//
//  Created by Adam Shamblin on 2/19/14.
//  Copyright (c) 2014 Adam Shamblin. All rights reserved.
//

#import "IRPLeafNodeCell.h"

@implementation IRPLeafNodeCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void) setInfo:(FDataSnapshot *)currentField
{
    self.snapshot = currentField;
    self.textLabel.text = currentField.name;
}
@end
