//
//  Cinema.h
//  YiBao
//
//  Created by Armstrong Liu on 6/14/12.
//  Copyright (c) 2012 yindarunhe. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cinema : NSObject

// 影院
@property(nonatomic,copy)   NSString *cinemaID;             // 影院ID
@property(nonatomic,copy)   NSString *cinemaName;           // 影院名称
@property(nonatomic,copy)   NSString *cinemaLocation;       // 地区
@property(nonatomic,assign) NSInteger cinemaHallcount;      // 厅个数
@property(nonatomic,copy)   NSString *cinemaAddress;        // 地址
@property(nonatomic,copy)   NSString *cinemaBusline;        // 乘车路线
@property(nonatomic,copy)   NSString *cinemaDesc;           // 描述
@property(nonatomic,copy)   NSString *cinemaPhoto;          // 图片地址
@property(nonatomic,copy)   NSString *cinemaCityID;         // 城市编号
@property(nonatomic,copy)   NSString *cinemaDistrictID;     // 地区编号
@property(nonatomic,copy)   NSString *cinemaDistrictName;   // 地区名称
@property(nonatomic,assign) NSInteger cinemaFilmShowcount;  // 影片剩余场次数

- (id)initWithCinemaID:(NSString*)cinemaID CinemaName:(NSString*)cinemaName CinemaLocation:(NSString*)cinemaLocation CinemaHallcount:(NSInteger)cinemaHallcount CinemaAddress:(NSString*)cinemaAddress CinemaBusline:(NSString*)cinemaBusline CinemaDesc:(NSString*)cinemaDesc  CinemaPhoto:(NSString*)cinemaPhoto CinemaCityID:(NSString*)cinemaCityID CinemaDistrictID:(NSString*)cinemaDistrictID CinemaDistrictName:(NSString*)cinemaDistrictName CinemaFilmShowcount:(NSInteger)cinemaFilmShowcount;

@end
