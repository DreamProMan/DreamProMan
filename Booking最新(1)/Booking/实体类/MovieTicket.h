//
//  MovieTicket.h
//  YiBao
//
//  Created by Armstrong Liu on 6/14/12.
//  Copyright (c) 2012 yindarunhe. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MovieTicket : NSObject

// 购票信息
@property(nonatomic,copy)   NSString *cinemaID;             // 影院编号
@property(nonatomic,copy)   NSString *cinemaName;           // 影院名称
@property(nonatomic,copy)   NSString *cinemaAddress;        // 影院地址
@property(nonatomic,copy)   NSString *cinemaBusline;        // 影院乘车路线
@property(nonatomic,copy)   NSString *filmID;               // 影片ID
@property(nonatomic,copy)   NSString *filmName;             // 影片名称
@property(nonatomic,copy)   NSString *filmLanguage;         // 影片版本
@property(nonatomic,copy)   NSString *showID;               // 放映流水号
@property(nonatomic,copy)   NSString *showDate;             // 放映日期
@property(nonatomic,copy)   NSString *showTime;             // 放映时间
@property(nonatomic,copy)   NSString *hallID;               // 影厅编号
@property(nonatomic,copy)   NSString *hallName;             // 影厅名称
@property(nonatomic,retain) NSMutableArray *arrSeats;       // 座位列表

@end
