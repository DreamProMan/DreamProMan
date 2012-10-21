//
//  HallInfo.h
//  YiBao
//
//  Created by Armstrong Liu on 6/14/12.
//  Copyright (c) 2012 yindarunhe. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HallInfo : NSObject

// 影厅信息
@property(nonatomic,copy)   NSString *serialNO;             // id
@property(nonatomic,copy)   NSString *hallName;             // 影厅名称
@property(nonatomic,assign) NSUInteger  seatCount;          // 座位数
@property(nonatomic,copy)   NSString *hallID;               // 影厅编号
@property(nonatomic,assign) BOOL     isVIP;                 // 是否vip厅
@property(nonatomic,assign) BOOL     isValid;               // 是否对外售票

-(id)initWithSerialNO:(NSString *)serialNO HallName:(NSString *)hallName SeatCount:(NSUInteger)seatCount HallID:(NSString *)hallID IsVIP:(BOOL)isVIP IsValid:(BOOL)isValid;

@end
