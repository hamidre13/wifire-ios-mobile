//
//  SdgedataTableViewController.h
//  wifire-officail
//
//  Created by Hamid tavakoli on 2/5/14.
//  Copyright (c) 2014 Hamid tavakoli. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Sdgejasondata.h"

@interface SdgedataTableViewController : UITableViewController
<UITableViewDataSource,UITableViewDelegate>
@property (strong,nonatomic) NSMutableArray *jsondata;
@property (strong,nonatomic)NSMutableArray *stations;
@property (strong, nonatomic) IBOutlet UITableView *sdgetablevieoutlet;

#pragma mark methods
-(void) retirivedata;
@end
