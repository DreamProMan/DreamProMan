//
//  MovieTicket.m
//  YiBao
//
//  Created by Armstrong Liu on 6/14/12.
//  Copyright (c) 2012 yindarunhe. All rights reserved.
//

#import "MovieTicket.h"

@implementation MovieTicket

@synthesize cinemaID = _cinemaID;
@synthesize cinemaName = _cinemaName;
@synthesize cinemaAddress = _cinemaAddress;
@synthesize cinemaBusline = _cinemaBusline;
@synthesize filmID = _filmID;
@synthesize filmName = _filmName;
@synthesize filmLanguage = _filmLanguage;
@synthesize showID = _showID;
@synthesize showDate = _showDate;
@synthesize showTime = _showTime;
@synthesize hallID = _hallID;
@synthesize hallName = _hallName;
@synthesize arrSeats = _arrSeats;

- (void)dealloc
{
    [_cinemaID release];
    [_cinemaName release];
    [_cinemaAddress release];
    [_cinemaBusline release];
    [_filmID release];
    [_filmName release];
    [_filmLanguage release];
    [_showID release];
    [_showDate release];
    [_showTime release];
    [_hallID release];
    [_hallName release];
    [_arrSeats release];
    
    [super dealloc];
}

- (id)init
{
    self = [super init];
    if (self != nil) {
        _arrSeats = [[NSMutableArray alloc] init];
    }
    return self;  
}

@end
