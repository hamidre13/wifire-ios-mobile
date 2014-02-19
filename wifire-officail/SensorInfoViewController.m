//
//  SensorInfoViewController.m
//  wifire-officail
//
//  Created by Hamid tavakoli on 2/10/14.
//  Copyright (c) 2014 Hamid tavakoli. All rights reserved.
//

#import "SensorInfoViewController.h"
#import <GoogleMaps/GoogleMaps.h>
#import <MapKit/MapKit.h>

@interface SensorInfoViewController ()
@property (weak, nonatomic) IBOutlet UILabel *sensorinfo;
@property NSArray *maptypes;
@end



@implementation SensorInfoViewController
{
    GMSMapView *mapView_;
}
@synthesize currentStation;


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
    
    _sensorinfo.numberOfLines =0;

    NSString *styledinfo = [NSString stringWithFormat:@"abbbr = %@  \n dp=%@ \n lat=%@ \n lon=%@ \n name= %@ \n owner=%@ \n rh=%@ \n temp = %@",currentStation.abbr,currentStation.dp,currentStation.lat,currentStation.lon,currentStation.name,currentStation.owner,currentStation.rh,currentStation.temp];
    [[self sensorinfo] setText:styledinfo];
    
    
    
    self.maptypes = @[@"ios native maps",@"Google maps"];
    // Do any additional setup after loading the view.
    [GMSServices provideAPIKey:@"AIzaSyCJZfRf-vkAS4mT_ZsGa7ySzAPRLNgQlu0"];
    // Create a GMSCameraPosition that tells the map to display the
    // coordinate -33.86,151.20 at zoom level 6.
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:[currentStation.lat intValue]
                                                            longitude:[currentStation.lon intValue]
                                                                 zoom:12];
    mapView_ = [GMSMapView mapWithFrame:CGRectMake(200, 100, 300, 400) camera:camera];
    
    //mapView_.myLocationEnabled = NO;
    [self.view addSubview:mapView_];
    
    // Creates a marker in the center of the map.
    GMSMarker *marker = [[GMSMarker alloc] init];
    marker.position = CLLocationCoordinate2DMake([currentStation.lat intValue], [currentStation.lon intValue]);
    marker.title = currentStation.name;
    marker.snippet = @"San diego";
    
    marker.map = mapView_;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
