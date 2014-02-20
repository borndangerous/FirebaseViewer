//
//  IRPDataTableViewController.m
//  FirebaseViewer
//
//  Created by Adam Shamblin on 2/15/14.
//  Copyright (c) 2014 Adam Shamblin. All rights reserved.
//

#import "IRPDataTableViewController.h"

@interface IRPDataTableViewController ()

@property (nonatomic) NSArray *fields;

@end

@implementation IRPDataTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.appData = [[FirebaseAppData alloc]
                                initWithFirebaseApp: self.currentApp];
    [self.appData connect];
    [self.appData onDataUpdate:^(id snapshot) {
        [self updateTableWithSnapshot: snapshot];
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    if (section == IRPAppInfoArea)
    {
        return 1;
    }
    if (section == IRPPathsArea)
    {
        if (self.fields != nil)
            return [self.fields count];
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == IRPAppInfoArea)
    {
        IRPAppInfoCell *cell = [tableView
                                dequeueReusableCellWithIdentifier:@"AppInfoCell"
                                forIndexPath:indexPath];
        [cell setCurrentApp: self.appData];
        
        return cell;
    }
    else if (indexPath.section == IRPPathsArea)
    {
        IRPLeafNodeCell *cell = [tableView
                                 dequeueReusableCellWithIdentifier:@"LeafNodes"
                                 forIndexPath:indexPath];
        [cell setInfo: [self.fields objectAtIndex:indexPath.row]];
        
        return cell;
    }
    else
    {
        UITableViewCell *cell = [tableView
                                 dequeueReusableCellWithIdentifier:@"Nodes"
                                 forIndexPath:indexPath];
        return cell;
    }
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == IRPAppInfoArea)
    {
        return APP_INFO_CELL_HEIGHT;
    }
    return [tableView rowHeight];
}

- (void) updateTableWithSnapshot: (FDataSnapshot *) snapshot
{
    NSEnumerator *children = snapshot.children;
    self.fields = [children allObjects];
    
    [self.tableView beginUpdates];
    [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:IRPPathsArea]
                  withRowAnimation:UITableViewRowAnimationFade];
    [self.tableView endUpdates];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

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

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

@end
