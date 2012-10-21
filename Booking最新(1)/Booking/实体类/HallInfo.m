//
//  HallInfo.m
//  YiBao
//
//  Created by Armstrong Liu on 6/14/12.
//  Copyright (c) 2012 yindarunhe. All rights reserved.
//

#import "HallInfo.h"

@implementation HallInfo

@synthesize serialNO = _serialNO;
@synthesize hallID = _hallID;
@synthesize hallName = _hallName;
@synthesize seatCount = _seatCount;
@synthesize isVIP = _isVIP;
@synthesize isValid = _isValid;

- (void)dealloc
{
    [_serialNO release];
    [_hallID release];
    [_hallName release];
    
    [super dealloc];
}

- (id)init
{
    self = [super init];
    if (self != nil) {
        _seatCount = 0;
        _isVIP = NO;
        _isValid = YES;
    }
    return self;  
}
-(id)initWithSerialNO:(NSString *)serialNO HallName:(NSString *)hallName SeatCount:(NSUInteger)seatCount HallID:(NSString *)hallID IsVIP:(BOOL)isVIP IsValid:(BOOL)isValid
{
    
    self=[super init];
    if(self !=nil)
    {
        
        self.serialNO=serialNO;
        self.hallName=hallName;
        self.seatCount=seatCount;
        self.hallID=hallID;
        self.isVIP=isVIP;
        self.isValid=isValid;
        
        
    }
    
    
    return self;
    
}

@end
