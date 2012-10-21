//
//  GoodsCategoryInfo.m
//  NewEngine
//
//  Created by yinda runhe on 3/19/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "GoodsCategoryInfo.h"

@implementation GoodsCategoryInfo

@synthesize hasChildCategories;
@synthesize goodsID;
@synthesize pid;
@synthesize name;

-(void) dealloc
{
    [name release];
        
    [super dealloc];
}

-(id) init
{
    self = [super init];

    return self;
}

@end
