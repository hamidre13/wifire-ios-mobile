//
//  Sdgejasondata.m
//  wifire-officail
//
//  Created by Hamid tavakoli on 2/5/14.
//  Copyright (c) 2014 Hamid tavakoli. All rights reserved.
//

#import "Sdgejasondata.h"

@implementation Sdgejasondata


-(id)initWithname:(NSString *) nameAttr andlat:(NSString *) latAttr andlon:(NSString *) lonAttr andabbr:(NSString *)
abbrAttr andowner:(NSString *) ownerAttr andrh:(NSString *) rhAttr andtemp:(NSString *)tempAttr andts:(NSString *) tsAttr andwd:(NSString *) wdAttr andws:(NSString *) wsAttr anddp:(NSString *)dpAttr
{
    self = [super init];
    if (self) {
        _abbr = abbrAttr;
        _name = nameAttr;
        _lat = latAttr;
        _lon=lonAttr;
        _owner = ownerAttr;
        _rh = rhAttr;
        _temp = tempAttr;
        _ts = tsAttr;
        _wd = wdAttr;
        _ws= wsAttr;
        _dp =dpAttr;
    }
    return self;
}
@end
