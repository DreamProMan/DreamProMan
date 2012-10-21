//
//  GetSeatIndex.h
//  FeiPiao
//
//  Created by 刘洋 on 12-10-10.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GetSeatIndex : NSObject
/*
 <body>
 <rows num="256">
 <body>
 <rows num=”总结果数”><!-- 座位信息总记录条数 -->
 <wp_seat 
 rowid="行编号" 
 columnid="列编号" 
 rowdesc="行说明" 
 columndesc="列说明" 
 cinemaid="影院编号" 
 hallid="影厅id" 
 seattype="座位类型"
 damaged="损坏标识" 
 status=”是否已售出”>
 </wp_seat>
 </rows>
 </body>
 <wp_seat cinemaid="1133" columndesc="22" columnid="01" damaged="Y" hallid="2" rowdesc="2" rowid="1" seattype="N" status="0"/>
 */
{
    NSString *num;
    NSString *cinemaid;
    NSString *columndesc;
    NSString *columnid;
    NSString *damaged;
    NSString *hallid;
    NSString *rowdesc;
    NSString *rowid;
    NSString *seattype;
    NSString *status;
   
}
@property(nonatomic,copy)NSString *num;
@property(nonatomic,copy)NSString *cinemaid;
@property(nonatomic,copy)NSString *columndesc;
@property(nonatomic,copy)NSString *columnid;
@property(nonatomic,copy)NSString *damaged;
@property(nonatomic,copy)NSString *hallid;
@property(nonatomic,copy)NSString *rowdesc;
@property(nonatomic,copy)NSString *rowid;
@property(nonatomic,copy)NSString *seattype;
@property(nonatomic,copy)NSString *status;
@end
