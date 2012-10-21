//
//  GameServerInfo.m
//  NewEngine
//
//  Created by yinda runhe on 3/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "GameServerInfo.h"

@implementation GameServerInfo

@synthesize serverId;
@synthesize productId;
@synthesize gameName;
@synthesize areaName;
@synthesize serverName;

-(void) dealloc
{
    [serverId release];
    [productId release];
    [gameName release];
    [areaName release];
    [serverName release];
    
    [super dealloc];
}

-(id) init
{
    self = [super init];
    
    return self;
}

@end
