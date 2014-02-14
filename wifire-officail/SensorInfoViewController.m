//
//  SensorInfoViewController.m
//  wifire-officail
//
//  Created by Hamid tavakoli on 2/10/14.
//  Copyright (c) 2014 Hamid tavakoli. All rights reserved.
//

#import "SensorInfoViewController.h"

@interface SensorInfoViewController ()
@property (weak, nonatomic) IBOutlet UILabel *sensorinfo;

@end

@implementation SensorInfoViewController


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
    NSString *styledinfo = [NSString stringWithFormat:@"abbbr = ",currentStation["abbr"]];
    [[self sensorinfo] setText:styledinfo];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
