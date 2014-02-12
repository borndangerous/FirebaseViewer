//
//  IRPDetailViewController.h
//  FirebaseViewer
//
//  Created by Adam Shamblin on 2/11/14.
//  Copyright (c) 2014 Adam Shamblin. All rights reserved.
//

#import <Firebase/Firebase.h>
#import <UIKit/UIKit.h>
#import "FirebaseApp.h"

@interface IRPDetailViewController : UIViewController

@property (strong, nonatomic) FirebaseApp *detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end
