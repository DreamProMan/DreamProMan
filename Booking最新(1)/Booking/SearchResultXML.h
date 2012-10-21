//
//  SearchResultXML.h
//  Booking
//
//  Created by Ibokan 王龙祥 on 12-9-29.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cinema.h"
#import "HallInfo.h"
#import "MovieInfo.h"
#import "MovieShowInfo.h"
#import "MovieTicket.h"
#import "SeatInfo.h"
#import "GetSeatIndex.h"
#import "GDataXMLNode.h"
@interface SearchResultXML : NSObject

+(NSString*)XMLWithGDataForLoginResult:(NSString*)LoginResult;

+(NSArray*)XMLWithGDataForCinemaInfoResult:(NSString*)CinemaInfoResult;

+(NSArray*)XMLWithGDataForHallInfoResult:(NSString*)HallInfoResult;

+(NSArray*)XMLWithGDataForMovieInfoResult:(NSString*)MovieInfoResult;

+(NSArray*)XMLWithGDataForMovieShowInfoResult:(NSString*)MovieShowInfoResult;

+(NSArray*)XMLWithGDataForMovieTicketInfoResult:(NSString*)MovieTicketInfoResult;

+(NSArray*)XMLWithGDataForSeatInfoInfoResult:(NSString*)SeatInfoInfoResult;

+(NSArray*)XMLWithGDataForCinemaTOMovieInfoInfoResult:(NSString*)CinemaTOMovieInfoResult;
+(NSString *)XMLWtihGDataForDownResult:(NSString *)DownResult;

@end
