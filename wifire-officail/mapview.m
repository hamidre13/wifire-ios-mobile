//
//  mapview.m
//  wifire-officail
//
//  Created by Hamid tavakoli on 1/22/14.
//  Copyright (c) 2014 Hamid tavakoli. All rights reserved.
//
#import <GoogleMaps/GoogleMaps.h>
#import "mapview.h"
#import <MapKit/MapKit.h>
#define getdataurl @"http://wifire.ucsd.edu:12020/"
@interface mapview ()
@property NSArray *maptypes;
@end

@implementation mapview
{
    GMSMapView *mapView_;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [[self maptypes] count];
}
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [self maptypes][row];
}
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
}
- (void)viewDidLoad
{
     [super viewDidLoad];
    [self setEdgesForExtendedLayout:UIRectEdgeNone];
    [self setAutomaticallyAdjustsScrollViewInsets:NO];
    self.maptypes = @[@"ios native maps",@"Google maps"];
    // Do any additional setup after loading the view.
    [GMSServices provideAPIKey:@"AIzaSyCJZfRf-vkAS4mT_ZsGa7ySzAPRLNgQlu0"];
    // Create a GMSCameraPosition that tells the map to display the
    // coordinate -33.86,151.20 at zoom level 6.
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:32.878938
                                                            longitude:-117.241558
                                                                 zoom:12];
    mapView_ = [GMSMapView mapWithFrame:self.view.bounds camera:camera];
  
    mapView_.myLocationEnabled = YES;
    [self.view addSubview:mapView_];
    
    
    [self retirivedata];
    
    for (Sdgejasondata *sensor in _stations) {
        // Creates a marker in the center of the map.
            GMSMarker *marker = [[GMSMarker alloc] init];
        marker.position = CLLocationCoordinate2DMake([sensor.lat doubleValue],[sensor.lon doubleValue]);
            marker.title = sensor.name;
            marker.snippet = [NSString stringWithFormat:@"Sensore abbr: %@ \n Sensore awd: %@",sensor.abbr,sensor.wd];
        
            marker.map = mapView_;
    }
    
    
    
    
    
    
    
    
    // Creates a marker in the center of the map.
//    GMSMarker *marker = [[GMSMarker alloc] init];
//    marker.position = CLLocationCoordinate2DMake(32.878938, -117.241558);
//    marker.title = @"UCSD";
//    marker.snippet = @"San diego";
//
//    marker.map = mapView_;
   
    
//    MKMapView *mapview = [[MKMapView alloc] initWithFrame:CGRectMake(300, 100, 200, 200)];
//    [mapview setMapType:0];
//    [mapview setZoomEnabled:YES];
//    [mapview setScrollEnabled:YES];
//    [self.view addSubview:mapview];
   
   

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showAlternate"]) {
        [[segue destinationViewController] setDelegate:self];
        
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
            UIPopoverController *popoverController = [(UIStoryboardPopoverSegue *)segue popoverController];
            self.flipsidePopoverController = popoverController;
            popoverController.delegate = self;
        }
    }
}
- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        [self dismissViewControllerAnimated:YES completion:nil];
    } else {
        [self.flipsidePopoverController dismissPopoverAnimated:YES];
    }
}

- (IBAction)togglePopover:(id)sender
{
    if (self.flipsidePopoverController) {
        [self.flipsidePopoverController dismissPopoverAnimated:YES];
        self.flipsidePopoverController = nil;
    } else {
        [self performSegueWithIdentifier:@"showAlternate" sender:sender];
    }
}


-(void)retirivedata
{
    NSURL *url=[[NSURL alloc]initWithString:getdataurl];
    NSData *data=[[NSData alloc]initWithContentsOfURL:url];
    
    //Setup stations array
    _jsondata = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:NULL];
    NSLog(@"%@",[[[ _jsondata objectForKey:@"measurements"] objectAtIndex:0] objectForKey:@"abbr"]);
    
    
    
    _stations = [[NSMutableArray alloc]init];
    NSLog(@"%@" , _jsondata);
    for (int i=0; i<[[ _jsondata objectForKey:@"measurements"] count]; i++) {
        NSString *abbr   =  [[[ _jsondata objectForKey:@"measurements"] objectAtIndex:i] objectForKey:@"abbr"];
        NSString *dp     =  [[[ _jsondata objectForKey:@"measurements"] objectAtIndex:i] objectForKey:@"dp"];
        NSString *lat    =  [[[ _jsondata objectForKey:@"measurements"] objectAtIndex:i] objectForKey:@"lat"];
        NSString *lon    =  [[[ _jsondata objectForKey:@"measurements"] objectAtIndex:i] objectForKey:@"lon"];
        NSString *name   =  [[[ _jsondata objectForKey:@"measurements"] objectAtIndex:i] objectForKey:@"name"];
        NSString *owner  =  [[[ _jsondata objectForKey:@"measurements"] objectAtIndex:i] objectForKey:@"owner"];
        NSString *rh     =  [[[ _jsondata objectForKey:@"measurements"] objectAtIndex:i] objectForKey:@"rh"];
        NSString *temp   =  [[[ _jsondata objectForKey:@"measurements"] objectAtIndex:i] objectForKey:@"temp"];
        NSString *ts     =  [[[ _jsondata objectForKey:@"measurements"] objectAtIndex:i] objectForKey:@"ts"];
        NSString *wd     =  [[[ _jsondata objectForKey:@"measurements"] objectAtIndex:i] objectForKey:@"wd"];
        NSString *ws     =  [[[ _jsondata objectForKey:@"measurements"] objectAtIndex:i] objectForKey:@"ws"];
        
        
        Sdgejasondata *newData = [[Sdgejasondata alloc]initWithname:abbr andlat:lat andlon:lon andabbr:name  andowner:owner andrh:rh andtemp:temp andts:ts andwd:wd andws:ws anddp:dp];
        [_stations addObject:newData];
        
    }
}


@end
