//
//  mapview.h
//  wifire-officail
//
//  Created by Hamid tavakoli on 1/22/14.
//  Copyright (c) 2014 Hamid tavakoli. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FlipSideViewController.h"

@interface mapview : UIViewController<UIPickerViewDataSource,UIPickerViewDelegate,UIPopoverControllerDelegate,FlipSideViewControllerDelegate>
@property (strong, nonatomic) UIPopoverController *flipsidePopoverController;
@end
