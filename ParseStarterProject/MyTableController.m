//
//  MyTableController.m
//  ParseStarterProject
//
//  Created by James Yu on 12/29/11.
//

#import "MyTableController.h"
#import <Bolts/Bolts.h>


@implementation MyTableController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom the table
        
        // The className to query on
        self.parseClassName = @"Todo";
        
        // The key of the PFObject to display in the label of the default cell style
        self.textKey = @"text";
        
        // The title for this table in the Navigation Controller.
        self.title = @"Todos";
        
        // Whether the built-in pull-to-refresh is enabled
        self.pullToRefreshEnabled = YES;
        
        // Whether the built-in pagination is enabled
        self.paginationEnabled = YES;
        
        // The number of objects to show per page
        self.objectsPerPage = 2;
    }
    return self;
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    UIBarButtonItem *bbiRight =
    [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                                  target:self
                                                  action:@selector(addNewTodo:)];
    
    UIBarButtonItem *bbiLeft =
    [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemTrash
                                                  target:self
                                                  action:@selector(resetTodos:)];
    
    [[self navigationItem] setRightBarButtonItem:bbiRight];
    [[self navigationItem] setLeftBarButtonItem:bbiLeft];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - Parse

- (void)objectsDidLoad:(NSError *)error {
    [super objectsDidLoad:error];
    
    // This method is called every time objects are loaded from Parse via the PFQuery
}

- (void)objectsWillLoad {
    [super objectsWillLoad];
    
    // This method is called before a PFQuery is fired to get more objects
}


 // Override to customize what kind of query to perform on the class. The default is to query for
 // all objects ordered by createdAt descending.
- (PFQuery *)queryForTable {
    PFQuery *query = [PFQuery queryWithClassName:self.parseClassName];
 
    // If no objects are loaded in memory, we look to the cache first to fill the table
    // and then subsequently do a query against the network.
    if ([self.objects count] == 0) {
        query.cachePolicy = kPFCachePolicyCacheThenNetwork;
    }
 
    [query orderByDescending:@"createdAt"];
 
    return query;
}



 // Override to customize the look of a cell representing an object. The default is to display
 // a UITableViewCellStyleDefault style cell with the label being the first key in the object. 
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath object:(PFObject *)object {
 static NSString *CellIdentifier = @"Cell";
 
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
 
    // Configure the cell
    cell.textLabel.text = [NSString stringWithFormat:@"objectId: %@", [object objectId]];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"CreatedAt: %@", [object createdAt]];
 
    return cell;
}


/*
 // Override if you need to change the ordering of objects in the table.
 - (PFObject *)objectAtIndex:(NSIndexPath *)indexPath { 
 return [objects objectAtIndex:indexPath.row];
 }
 */

/*
 // Override to customize the look of the cell that allows the user to load the next page of objects.
 // The default implementation is a UITableViewCellStyleDefault cell with simple labels.
 - (UITableViewCell *)tableView:(UITableView *)tableView cellForNextPageAtIndexPath:(NSIndexPath *)indexPath {
 static NSString *CellIdentifier = @"NextPage";
 
 UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
 
 if (cell == nil) {
 cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
 }
 
 cell.selectionStyle = UITableViewCellSelectionStyleNone;
 cell.textLabel.text = @"Load more...";
 
 return cell;
 }
 */

#pragma mark - Table view data source

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
 [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
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

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [super tableView:tableView didSelectRowAtIndexPath:indexPath];
}

#pragma mark - ()

- (void)addNewTodo:(id)sender
{
    PFObject *object = [PFObject objectWithClassName:@"Todo"];
    [object setObject:@"Sample Text" forKey:@"text"];
    [object setObject:@1 forKey:@"priority"];
    [object saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        // LET'S NOT REFRESH to simulate a new added object in db not created by us
        
        // Refresh the table when the object is done saving.
//        [controller loadObjects];
    }];
}

- (void)resetTodos:(id)sender
{
    PFQuery *query = [PFQuery queryWithClassName:@"Todo"];
    [query setLimit:1000];
    [[[self findAsync:query] continueWithBlock:^id(BFTask *task) {
        
        NSMutableArray *tasks = [NSMutableArray array];
        
        for (PFObject *todo in task.result) {
            [tasks addObject:[self deleteAsync:todo]];
        }
        // Return a new task that will be marked as completed when all of the deletes are
        // finished.
        return [BFTask taskForCompletionOfAllTasks:tasks];
    }] continueWithBlock:^id(BFTask *task) {
        // Every todo was deleted.
        [self loadObjects];
        return nil;
    }];
}

- (BFTask *) findAsync:(PFQuery *)query {
    BFTaskCompletionSource *task = [BFTaskCompletionSource taskCompletionSource];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            [task setResult:objects];
        } else {
            [task setError:error];
        }
    }];
    return task.task;
}

- (BFTask *) deleteAsync:(PFObject *)object {
    BFTaskCompletionSource *task = [BFTaskCompletionSource taskCompletionSource];
    [object deleteInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (!error ) {
            [task setResult:[NSNumber numberWithBool:succeeded]];
        } else {
            [task setError:error];
        }
    }];
    return task.task;
}

@end
