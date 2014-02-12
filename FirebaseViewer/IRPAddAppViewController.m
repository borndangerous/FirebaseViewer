//
//  IRPAddAppViewController.m
//  FirebaseViewer
//
//  Created by Adam Shamblin on 2/11/14.
//  Copyright (c) 2014 Adam Shamblin. All rights reserved.
//

#import "IRPAddAppViewController.h"
#import "FirebaseApp.h"

@interface IRPAddAppViewController ()

@property (weak, nonatomic) IBOutlet UIBarButtonItem *doneButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *cancelButton;
@property (weak, nonatomic) IBOutlet UITextField *appNameField;
@property (weak, nonatomic) IBOutlet UITextField *appURLField;

@end

@implementation IRPAddAppViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if(sender != self.doneButton) return;
    if(self.appNameField.text.length > 0 &&
       self.appURLField.text.length > 0)
    {
        self.appItem = [FirebaseApp createEntity];
        self.appItem.appName = self.appNameField.text;
        self.appItem.appURL = self.appURLField.text;
        [[NSManagedObjectContext defaultContext] saveToPersistentStoreAndWait];
    }
}

@end
