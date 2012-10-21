//
//  SearchDelegate.h
//  Booking
//
//  Created by Ibokan 王龙祥 on 12-10-1.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol SearchDelegate <NSObject>
@optional;
//查找到影院信息结果，如 id="影院编号"name="影院名称" 
//location="地区" hallcount="厅个数" address="地址" busline="乘车路线" 
//desc="描述" photo="图片地址" cityid=”城市编号”districtid="地区编号" 
//districtname="地区名称"filmshowcount=”影片剩余场次数”> 
-(void)OnGetCinemaResult:(NSArray*)result;

-(void)OnGetInfoOfMoviewShowResult:(NSArray*)result;

-(void)OnGetSeatResult:(NSArray*)result;

-(void)OnGetHallidResult:(NSArray*)result;

-(void)OnGetMovieInfoResult:(NSArray*)result;

-(void)OnGetAllOfMovieInfoResult:(NSArray*)result;

-(void)OnGetTicketRecordResult:(NSArray *)result;


@end
