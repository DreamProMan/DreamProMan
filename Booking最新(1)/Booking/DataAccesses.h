//
//  DataAccesses.h
//  Booking
//
//  Created by Ibokan 王龙祥 on 12-9-24.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ASIHTTPRequest.h"
#import "ASINetworkQueue.h"
#import "SearchManager.h"
#import "Connectiondelegte.h"


@interface DataAccesses : NSObject<ASIHTTPRequestDelegate>
{
       ASINetworkQueue* _Queue;

}

@property (assign,nonatomic) id<Connectiondelegte>delegate;

@property (retain,nonatomic) ASINetworkQueue* Queue;

////初始化
-(id)init;

//得到URL
-(NSURL*)GetURL;


//判断字符串是否为空字符
-(BOOL)isenptyWithString:(NSString*)string;


//异步连接
-(void)connectionWithbody:(NSString*)body Info:(NSString*)info;


//取消请求
-(void)cancelRepuest:(ASIHTTPRequest*)request;


//影院信息查询:可以通过影片标号以及地区位置（任一可为空）
-(void)SearchCinemaInAreaWithMovieNumber:(NSString*)movieNumber andAera:(NSString*)area;


//影院放映场次信息查询：可以通过影院编号（必填）及影片编号（可为空）及日期：yyyy-MM-dd（可为空）
-(void)SearchInfoOfMoviewShowWithCinemaNumber:(NSString*)cinemaNumber andMOvieNumber:(NSString*)movieNumber date:(NSString*)date;


//影院已定座位信息查询：可以通过放映流水号（必填）查询
-(void)SearchSeatWithMovieShowWithShowNumber:(NSString*)showNumber;


//影院影厅信息查询：可以通过影院编号（必填）查询
-(void)SearchHallidWithCinemaNumber:(NSString*)cinemaNumber;


//影片信息查询：当输入为YES时查询所有影片，输入NO时查询当前影片
-(void)SearchMovieInfoWithAll:(BOOL)isAll;


//影院影片信息查询：可以通过影院编号以及日期:yyyy-MM-dd（必填）查询电影信息
-(void)SearchAllOfMovieInfoWithCinemaNumber:(NSString*)cinemaNumber andshowDate:(NSString*)Date;


//影院购票记录查询
-(void)SearchBuyTicketRecord;


@end



