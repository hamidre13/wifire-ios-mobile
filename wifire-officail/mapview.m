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
    self.maptypes = @[@"ios native maps",@"Google maps"];
    // Do any additional setup after loading the view.
    [GMSServices provideAPIKey:@"AIzaSyCJZfRf-vkAS4mT_ZsGa7ySzAPRLNgQlu0"];
    // Create a GMSCameraPosition that tells the map to display the
    // coordinate -33.86,151.20 at zoom level 6.
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:32.878938
                                                            longitude:-117.241558
                                                                 zoom:12];
    mapView_ = [GMSMapView mapWithFrame:CGRectMake(30, 60, 600, 700) camera:camera];
    mapView_.myLocationEnabled = NO;
    [self.view addSubview:mapView_];
    
    // Creates a marker in the center of the map.
    GMSMarker *marker = [[GMSMarker alloc] init];
    marker.position = CLLocationCoordinate2DMake(32.878938, -117.241558);
    marker.title = @"UCSD";
    marker.snippet = @"San diego";

    marker.map = mapView_;
   
    
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

- (IBAction)togglePopover:(id)sender
{
    if (self.flipsidePopoverController) {
        [self.flipsidePopoverController dismissPopoverAnimated:YES];
        self.flipsidePopoverController = nil;
    } else {
        [self performSegueWithIdentifier:@"showAlternate" sender:sender];
    }
}

@end
