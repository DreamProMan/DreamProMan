//
//  MovieInfo.m
//  YiBao
//
//  Created by Armstrong Liu on 6/14/12.
//  Copyright (c) 2012 yindarunhe. All rights reserved.
//

#import "MovieInfo.h"

@implementation MovieInfo

@synthesize movieID = _movieID;
@synthesize movieName = _movieName;
@synthesize duration = _duration;
@synthesize director = _director;
@synthesize cast = _cast;
@synthesize thumbnail = _thumbnail;
@synthesize cachedThumbnail = _cachedThumbnail;
@synthesize poster = _poster;
@synthesize filmDate = _filmDate;
@synthesize filmClass = _filmClass;
@synthesize filmArea = _filmArea;
@synthesize filmDesc = _filmDesc;
@synthesize showCount = _showCount;

- (void)dealloc
{
    [_movieID release];
    [_movieName release];
    [_director release];
    [_cast release];
    [_thumbnail release];
    [_cachedThumbnail release];
    [_poster release];
    [_filmDate release];
    [_filmClass release];
    [_filmArea release];
    [_filmDesc release];
    
    [super dealloc];
}

- (id)initWithMovieID:(NSString *)moviewID movieName:(NSString *)movieName duration:(NSString *)duration director:(NSString *)director cast:(NSString *)cast thumbnail:(NSString *)thumbnail cachedThumbnail:(UIImage *)cachedThumbnail poster:(NSString *)poster filmDate:(NSString *)filmDate filmClass:(NSString *)filmClass filmArea:(NSString *)filmArea filmDesc:(NSString *)filmDesc showCount:(NSString *)showCount
{
    self = [super init];
    if (self != nil) {
        self.movieID = moviewID;
        self.movieName = movieName;
        self.duration = duration;
        self.director = director;
        self.cast = cast;
        self.thumbnail = thumbnail;
        self.cachedThumbnail = cachedThumbnail;
        self.poster = poster;
        self.filmDate = filmDate;
        self.filmClass = filmClass;
        self.filmArea = filmArea;
        self.filmDesc = filmDesc;
        self.showCount = showCount;
    }
    return self;  
}

@end
