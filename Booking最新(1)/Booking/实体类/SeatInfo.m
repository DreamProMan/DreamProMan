//
//  SeatInfo.m
//  YiBao
//
//  Created by Armstrong Liu on 6/14/12.
//  Copyright (c) 2012 yindarunhe. All rights reserved.
//

#import "SeatInfo.h"

@implementation SeatInfo

@synthesize rowID = _rowID;
@synthesize columnID = _columnID;
@synthesize rowDesc = _rowDesc;
@synthesize columnDesc = _columnDesc;
@synthesize cinemaID = _cinemaID;
@synthesize hallID = _hallID;
@synthesize seatType = _seatType;
@synthesize status = _status;
@synthesize damaged = _damaged;

- (void)dealloc
{
    [_rowID release];
    [_columnID release];
    [_rowDesc release];
    [_columnDesc release];
    [_cinemaID release];
    [_hallID release];
    [_seatType release];
    [_status release];
    
    [super dealloc];
}

- (id)init
{
    self = [super init];
    if (self != nil) {
        _rowID = @"0";
        _cinemaID = @"0";
        _damaged = NO;
        _status = @"0";
    }
    return self;  
}
-(id)initWithRowID:(NSString *)rowID ColumnID:(NSString *)columnID RowDesc:(NSString *)rowDesc ColumnDesc:(NSString *)columndesc CinemaID:(NSString *)cinemaID HallID:(NSString *)hallID SeatType:(NSString *)seatType Status:(NSString *)status Damaged:(BOOL)damaged
{
    
    self=[super init];
    if(self!=nil)
    {
        self.rowID=rowID;
        self.columnID=columnID;
        self.rowDesc=rowDesc;
        self.columnDesc=columndesc;
        self.cinemaID=cinemaID;
        self.hallID=hallID;
        self.seatType=seatType;
        self.status=status;
        self.damaged=damaged;
        
        
    }
    return self;
    
}

@end
