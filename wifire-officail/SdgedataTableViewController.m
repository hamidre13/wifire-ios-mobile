//
//  SdgedataTableViewController.m
//  wifire-officail
//
//  Created by Hamid tavakoli on 2/5/14.
//  Copyright (c) 2014 Hamid tavakoli. All rights reserved.
//

#import "SdgedataTableViewController.h"

@interface SdgedataTableViewController ()

@end

#define getdataurl @"http://wifire.ucsd.edu:12020/"

@implementation SdgedataTableViewController




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
    //Set the title
    self.title = @"SDGE sensores informations";
    [self retirivedata];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
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
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _stations.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    //Retrieve the current stations object for use with this cells
    Sdgejasondata *currentdata = [_stations objectAtIndex:indexPath.row];
    cell.textLabel.text = currentdata.name;
    
    return cell;
}

-(void)retirivedata
{
    NSURL *url=[[NSURL alloc]initWithString:getdataurl];
    NSData *data=[[NSData alloc]initWithContentsOfURL:url];
   
    //Setup stations array
    NSMutableDictionary *wholedata = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:NULL];
    NSLog(@"%@",[wholedata objectForKey:@"measurements"]);
    [_jsondata addObject:[wholedata objectForKey:@"measurements"]];
    //NSData *mesurmentsdata = [[NSData alloc] initwithcon]
    _stations = [[NSMutableArray alloc]init];
    for (int i=0; i<_jsondata.count; i++) {
        NSString *abbr = [[_jsondata objectAtIndex:i ] objectForKey:@"abbr"];
        NSString *dp = [[_jsondata objectAtIndex:i ] objectForKey:@"dp"];
        NSString *lat = [[_jsondata objectAtIndex:i ] objectForKey:@"lat"];
        NSString *lon = [[_jsondata objectAtIndex:i ] objectForKey:@"lon"];
        NSString *name = [[_jsondata objectAtIndex:i ] objectForKey:@"name"];
        NSString *owner = [[_jsondata objectAtIndex:i ] objectForKey:@"owner"];
        NSString *rh = [[_jsondata objectAtIndex:i ] objectForKey:@"th"];
        NSString *temp = [[_jsondata objectAtIndex:i ] objectForKey:@"temp"];
        NSString *ts = [[_jsondata objectAtIndex:i ] objectForKey:@"ts"];
        NSString *wd = [[_jsondata objectAtIndex:i ] objectForKey:@"wd"];
        NSString *ws = [[_jsondata objectAtIndex:i ] objectForKey:@"ws"];
        
        
        Sdgejasondata *newData = [[Sdgejasondata alloc]initWithname:abbr andlat:lat andlon:lon andabbr:name  andowner:owner andrh:rh andtemp:temp andts:ts andwd:wd andws:ws anddp:dp];
        [_stations addObject:newData];
       
    }
     [self.sdgetablevieoutlet reloadData];
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
