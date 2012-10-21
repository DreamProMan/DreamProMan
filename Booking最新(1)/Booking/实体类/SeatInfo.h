//
//  SeatInfo.h
//  YiBao
//
//  Created by Armstrong Liu on 6/14/12.
//  Copyright (c) 2012 yindarunhe. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SeatInfo : NSObject

// 座位信息
@property(nonatomic,copy)   NSString *rowID;                // 行编号
@property(nonatomic,copy)   NSString *columnID;             // 列编号
@property(nonatomic,copy)   NSString *rowDesc;              // 行说明
@property(nonatomic,copy)   NSString *columnDesc;           // 列说明
@property(nonatomic,copy)   NSString *cinemaID;             // 影院编号
@property(nonatomic,copy)   NSString *hallID;               // 影厅ID
@property(nonatomic,copy)   NSString *seatType;             // 座位类型
@property(nonatomic,copy)   NSString *status;               // 是否已出售
@property(nonatomic,assign) BOOL     damaged;               // 损坏标识

-(id)initWithRowID:(NSString *)rowID ColumnID:(NSString *)columnID RowDesc:(NSString *)rowDesc ColumnDesc:(NSString *)columndesc CinemaID:(NSString *)cinemaID HallID:(NSString *)hallID SeatType:(NSString *)seatType Status:(NSString *)status Damaged:(BOOL)damaged;
@end
