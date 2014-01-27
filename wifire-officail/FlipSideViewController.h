//
//  FlipSideViewController.h
//  wifire-officail
//
//  Created by Hamid tavakoli on 1/22/14.
//  Copyright (c) 2014 Hamid tavakoli. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FlipsideViewController;

@protocol FlipsideViewControllerDelegate
- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller;
@end

@interface FlipsideViewController : UIViewController

@property (weak, nonatomic) id <FlipsideViewControllerDelegate> delegate;

- (IBAction)done:(id)sender;
@end
