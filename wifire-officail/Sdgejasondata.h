//
//  Sdgejasondata.h
//  wifire-officail
//
//  Created by Hamid tavakoli on 2/5/14.
//  Copyright (c) 2014 Hamid tavakoli. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Sdgejasondata : NSObject

@property(nonatomic,strong) NSString *abbr;
@property(nonatomic,strong) NSString *dp;
@property(nonatomic,strong) NSString *lat;
@property(nonatomic,strong) NSString *lon;
@property(nonatomic,strong) NSString *name;
@property(nonatomic,strong) NSString *owner;
@property(nonatomic,strong) NSString *rh;
@property(nonatomic,strong) NSString *temp;
@property(nonatomic,strong) NSString *ts;
@property(nonatomic,strong) NSString *wd;
@property(nonatomic,strong) NSString *ws;

-(id)initWithname:(NSString *) nameAttr andlat:(NSString *) latAttr andlon:(NSString *) lonAttr andabbr:(NSString *)
abbrAttr andowner:(NSString *) ownerAttr andrh:(NSString *) rhAttr andtemp:(NSString *)tempAttr andts:(NSString *) tsAttr andwd:(NSString *) wdAttr andws:(NSString *) wsAttr anddp:(NSString *) dpAttr;

@end
