//
//  IRPMasterViewController.m
//  FirebaseViewer
//
//  Created by Adam Shamblin on 2/11/14.
//  Copyright (c) 2014 Adam Shamblin. All rights reserved.
//

#import "IRPMasterViewController.h"
#import "IRPDetailViewController.h"
#import "IRPAddAppViewController.h"
#import "FirebaseApp.h"


@implementation IRPMasterViewController

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSArray *initialItems = [FirebaseApp findAll];
    if(initialItems != nil)
    {
        self.appItems = [initialItems mutableCopy];
    }
    else {
        self.appItems = [[NSMutableArray alloc] init];
    }
    
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.appItems count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ListPrototypeCell" forIndexPath:indexPath];

    FirebaseApp *appItem = [self.appItems objectAtIndex:indexPath.row];
    cell.textLabel.text= appItem.appName;
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        FirebaseApp *appItem = [self.appItems objectAtIndex:indexPath.row];
        [self.appItems removeObject:appItem];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
        [appItem deleteEntity];
        [[NSManagedObjectContext defaultContext] saveToPersistentStoreAndWait];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        FirebaseApp *object = self.appItems[indexPath.row];
        [[segue destinationViewController] setDetailItem:object];
    }
}

- (IBAction)unwindToMasterView:(UIStoryboardSegue *)segue
{
    IRPAddAppViewController *source = [segue sourceViewController];
    FirebaseApp *appItem = source.appItem;
    
    if (appItem != nil)
    {
        [self.appItems addObject:appItem];
        [self.tableView reloadData];
    }
}

@end
