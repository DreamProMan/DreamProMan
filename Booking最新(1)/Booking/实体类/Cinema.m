//
//  Cinema.m
//  YiBao
//
//  Created by Armstrong Liu on 6/14/12.
//  Copyright (c) 2012 yindarunhe. All rights reserved.
//

#import "Cinema.h"

@implementation Cinema

@synthesize cinemaID            = _cinemaID;
@synthesize cinemaName          = _cinemaName;
@synthesize cinemaLocation      = _cinemaLocation;
@synthesize cinemaHallcount     = _cinemaHallcount;
@synthesize cinemaAddress       = _cinemaAddress;
@synthesize cinemaBusline       = _cinemaBusline;
@synthesize cinemaDesc          = _cinemaDesc;
@synthesize cinemaPhoto         = _cinemaPhoto;
@synthesize cinemaCityID        = _cinemaCityID;
@synthesize cinemaDistrictID    = _cinemaDistrictID;
@synthesize cinemaDistrictName  = _cinemaDistrictName;
@synthesize cinemaFilmShowcount = _cinemaFilmShowcount;

- (void)dealloc
{
    [_cinemaID release];
    [_cinemaName release];
    [_cinemaLocation release];
    [_cinemaAddress release];
    [_cinemaBusline release];
    [_cinemaDesc release];
    [_cinemaDistrictID release];
    [_cinemaDistrictName release];
    _cinemaHallcount = 0;
    _cinemaFilmShowcount = 0;
    
    [super dealloc];
}


-(id)initWithCinemaID:(NSString *)cinemaID CinemaName:(NSString *)cinemaName CinemaLocation:(NSString *)cinemaLocation CinemaHallcount:(NSInteger)cinemaHallcount CinemaAddress:(NSString *)cinemaAddress CinemaBusline:(NSString *)cinemaBusline CinemaDesc:(NSString *)cinemaDesc CinemaPhoto:(NSString *)cinemaPhoto CinemaCityID:(NSString *)cinemaCityID CinemaDistrictID:(NSString *)cinemaDistrictID CinemaDistrictName:(NSString *)cinemaDistrictName CinemaFilmShowcount:(NSInteger)cinemaFilmShowcount
{
    self = [super init];
    if (self != nil) {
        self.cinemaID=cinemaID;
        self.cinemaName=cinemaName;
        self.cinemaLocation=cinemaLocation;
        self.cinemaHallcount=cinemaHallcount;
        self.cinemaAddress=cinemaAddress;
        self.cinemaBusline=cinemaBusline;
        self.cinemaDesc=cinemaDesc;
        self.cinemaCityID=cinemaCityID;
        self.cinemaDistrictID=cinemaDistrictID;
        self.cinemaDistrictName=cinemaDistrictName;
        self.cinemaFilmShowcount=cinemaFilmShowcount;
    }
    return self;  
}

@end
