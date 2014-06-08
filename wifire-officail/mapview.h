//
//  mapview.h
//  wifire-officail
//
//  Created by Hamid tavakoli on 1/22/14.
//  Copyright (c) 2014 Hamid tavakoli. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FlipSideViewController.h"
#import "Sdgejasondata.h"

@interface mapview : UIViewController<UIPickerViewDataSource,UIPickerViewDelegate,UIPopoverControllerDelegate,FlipsideViewControllerDelegate>
@property (strong, nonatomic) UIPopoverController *flipsidePopoverController;
@property (strong,nonatomic) NSMutableDictionary *jsondata;
@property (strong,nonatomic)NSMutableArray *stations;
@property (weak, nonatomic) IBOutlet UIView *googlemapview;
@property (strong,nonatomic) IBOutlet UIViewController* gmap;
@end
