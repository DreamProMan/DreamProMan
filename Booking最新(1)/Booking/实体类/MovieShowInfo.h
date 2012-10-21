//
//  MovieShowInfo.h
//  YiBao
//
//  Created by Armstrong Liu on 6/14/12.
//  Copyright (c) 2012 yindarunhe. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MovieShowInfo : NSObject

// 放映场次信息
@property(nonatomic,copy)   NSString *showID;               // 放映流水号
@property(nonatomic,copy)   NSString *showDate;             // 放映日期
@property(nonatomic,copy)   NSString *showTime;             // 放映时间
@property(nonatomic,copy)   NSString *hallID;               // 影厅编号
@property(nonatomic,copy)   NSString *hallName;             // 影厅名称
@property(nonatomic,copy)   NSString *cinemaID;             // 影院编号
@property(nonatomic,copy)   NSString *filmID;               // 影片ID
@property(nonatomic,copy)   NSString *filmName;             // 影片名称
@property(nonatomic,copy)   NSString *filmLanguage;         // 影片版本
@property(nonatomic,copy)   NSString *filmTime;             // 放映时间
@property(nonatomic,copy)   NSString *filmStatus;           // 放映状态
@property(nonatomic,assign)   double price;                 // 价格
@property(nonatomic,assign)   double vipPrice;              // vip价格

-(id)initWithShowID:(NSString *)showID ShowDate:(NSString *)showDate ShowTime:(NSString *)showTime HallID:(NSString *)hallID HallName:(NSString *)hallName CinemaID:(NSString *)cinemaID FilmID:(NSString *)filmID FilmName:(NSString *)filmName FilmLanguage:(NSString *)filmLanguage FilmTime:(NSString *)filmTime FilmStatus:(NSString *)filmStatus Price:(double)price VipPrice:(double)vipPrice;

@end
