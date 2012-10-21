//
//  MovieShowInfo.m
//  YiBao
//
//  Created by Armstrong Liu on 6/14/12.
//  Copyright (c) 2012 yindarunhe. All rights reserved.
//

#import "MovieShowInfo.h"

@implementation MovieShowInfo

@synthesize showID       = _showID;
@synthesize showDate     = _showDate;
@synthesize showTime     = _showTime;
@synthesize hallID       = _hallID;
@synthesize hallName     = _hallName;
@synthesize cinemaID     = _cinemaID;
@synthesize filmID       = _filmID;
@synthesize filmName     = _filmName;
@synthesize filmLanguage = _filmLanguage;
@synthesize filmTime     = _filmTime;
@synthesize filmStatus   = _filmStatus;
@synthesize price        = _price;
@synthesize vipPrice     = _vipPrice;

- (void)dealloc
{
    [_showID release];
    [_showDate release];
    [_showTime release];
    [_hallID release];
    [_hallName release];
    [_cinemaID release];
    [_filmID release];
    [_filmName release];
    [_filmLanguage release];
    [_filmTime release];
    [_filmStatus release];
    
    [super dealloc];
}

- (id)init
{
    self = [super init];
    if (self != nil) {
        _price = 0.0;
        _vipPrice = 0.0;
    }
    return self;  
}
-(id)initWithShowID:(NSString *)showID ShowDate:(NSString *)showDate ShowTime:(NSString *)showTime HallID:(NSString *)hallID HallName:(NSString *)hallName CinemaID:(NSString *)cinemaID FilmID:(NSString *)filmID FilmName:(NSString *)filmName FilmLanguage:(NSString *)filmLanguage FilmTime:(NSString *)filmTime FilmStatus:(NSString *)filmStatus Price:(double)price VipPrice:(double)vipPrice
{
    
    self=[super init];
    if(self!=nil)
    {
        self.showID=showID;
        self.showDate=showDate;
        self.showTime=showTime;
        self.hallID=hallID;
        self.hallName=hallName;
        self.cinemaID=cinemaID;
        self.filmID=filmID;
        self.filmName=filmName;
        self.filmLanguage=filmLanguage;
        self.filmTime=filmTime;
        self.filmStatus=filmStatus;
        self.price=price;
        self.vipPrice=vipPrice;
        
        
    }
    
    return self;
}

@end
