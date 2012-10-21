//
//  DataAccesses.m
//  Booking
//
//  Created by Ibokan 王龙祥 on 12-9-24.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "DataAccesses.h"

@implementation DataAccesses

@synthesize delegate;

@synthesize Queue=_Queue;

-(id)init
{
    self=[super init];
    if (self) {
       // _URLConnection=[[URLCacheConnection alloc]init];  
        _Queue =[[ASINetworkQueue alloc]init];
        [_Queue setShouldCancelAllRequestsOnFailure:NO];
    }
    return self;
}

//得到URL
-(NSURL*)GetURL
{
    NSURL * url=[NSURL URLWithString:@"http://tm.mbpay.cn:8082"];
    return url;
}


//判断字符串是否为空字符
-(BOOL)isenptyWithString:(NSString *)string
{
    if (string==nil) {
        return YES;
    }
    return NO;
}
#pragma mark -
#pragma mark search methods

//影院信息查询:可以通过影片标号以及地区位置（任一可为空）
-(void)SearchCinemaInAreaWithMovieNumber:(NSString*)movieNumber andAera:(NSString *)area 
{
    NSString * CinemaBody = [NSString stringWithFormat:@"<?xml version=\"1.0\" encoding=\"utf-8\" ?><root><head cid=\"08000001\" sver=\"A 2.0.0.240\" mac=\"1234567890123456\"><goods_type>2100000000</goods_type><merc_id>301800000000000</merc_id><areaid></areaid><zip_type></zip_type><userid></userid><sessionid></sessionid><actid></actid><sdid></sdid><simid></simid><clientid></clientid></head><body><goods_type srowid=\"1\" erowid=\"10\"></goods_type>%@<wp_location>%@</wp_location></body></root>",movieNumber,area];
    [self connectionWithbody:CinemaBody Info:@"影院信息"];
}


//影院放映场次信息查询：可以通过影院编号（必填）及影片编号（可为空）及日期：yyyy-MM-dd（可为空）
-(void)SearchInfoOfMoviewShowWithCinemaNumber:(NSString*)cinemaNumber andMOvieNumber:(NSString*)movieNumber date:(NSString *)date
{
   NSString *numOfshowBody=[NSString stringWithFormat:@"<?xml version=\"1.0\" encoding=\"utf-8\" ?><root><head cid=\"08000004\" sver=\"A 2.0.0.240\" mac=\"1234567890123456\"><goods_type>2100000000</goods_type><merc_id>301800000000000</merc_id><areaid></areaid><zip_type></zip_type><userid></userid><sessionid></sessionid><actid></actid><sdid></sdid><simid></simid><clientid></clientid></head><body><goods_type srowid=\"1\" erowid=\"10\">%@</goods_type><goods_info>%@</goods_info><querydate>%@</querydate></body></root>",cinemaNumber,movieNumber,date];
    [self connectionWithbody:numOfshowBody Info:SHOWINFO];
}


//影院已定座位信息查询：可以通过放映流水号（必填）查询
-(void)SearchSeatWithMovieShowWithShowNumber:(NSString*)showNumber
{
    NSString * seatBody = [NSString stringWithFormat:@"<?xml version=\"1.0\" encoding=\"utf-8\" ?><root><head cid=\"08000005\" sver=\"A 2.0.0.240\" mac=\"1234567890123456\"><goods_type>2100000000</goods_type><merc_id>301800000000000</merc_id><merc_id></merc_id><areaid></areaid><zip_type></zip_type><userid></userid><sessionid></sessionid><actid></actid><sdid></sdid><simid></simid><clientid></clientid></head><body><goods_type srowid=\"1\" erowid=\"100\">%@</goods_type></body></root>",showNumber];
    [self connectionWithbody:seatBody Info:@"座位信息"];
}


//影院影厅信息查询：可以通过影院编号（必填）查询
-(void)SearchHallidWithCinemaNumber:(NSString*)cinemaNumber
{
    NSString * hallBody = [NSString stringWithFormat:@"<?xml version=\"1.0\" encoding=\"utf-8\" ?><root><head cid=\"08000002\" sver=\"A 2.0.0.240\" mac=\"1234567890123456\"><goods_type>2100000000</goods_type><merc_id>301800000000000</merc_id><merc_id></merc_id><areaid></areaid><zip_type></zip_type><userid></userid><sessionid></sessionid><actid></actid><sdid></sdid><simid></simid><clientid></clientid></head><body><goods_type srowid=\"1\" erowid=\"100\">%@</goods_type></body></root>",cinemaNumber];
    [self connectionWithbody:hallBody Info:@"影厅信息"];
}


//影片信息查询：当输入为YES时查询所有影片，输入NO时查询当前影片
-(void)SearchMovieInfoWithAll:(BOOL)isAll
{
    NSString * is;
    if(isAll)
    {
        is=@"Y";   
    }else
    {
        is=@"N";
    }
    NSString * hallBody = [NSString stringWithFormat:@"<?xml version=\"1.0\" encoding=\"utf-8\" ?><root><head cid=\"08000003\" sver=\"A 2.0.0.240\" mac=\"1234567890123456\"><goods_type>2100000000</goods_type><merc_id>301800000000000</merc_id><areaid></areaid><zip_type></zip_type><userid></userid><sessionid></sessionid><actid></actid><sdid></sdid><simid></simid><clientid></clientid></head><body><goods_type srowid=\"1\" erowid=\"20\" showall=\"Y\"></goods_type></body></root>"];
    [self connectionWithbody:hallBody Info:@"影片信息"];
}


//影院影片信息查询：可以通过影院编号以及日期:yyyy-MM-dd（必填）查询电影信息
-(void)SearchAllOfMovieInfoWithCinemaNumber:(NSString*)cinemaNumber andshowDate:(NSString*)Date
{
    NSString * MovieBody = [NSString stringWithFormat:@"<?xml version=\"1.0\" encoding=\"utf-8\" ?><root><head cid=\"08000006\" sver=\"A 2.0.0.240\" mac=\"1234567890123456\"><goods_type>2100000000</goods_type><merc_id>301800000000000</merc_id><merc_id></merc_id><areaid></areaid><zip_type></zip_type><userid></userid><sessionid></sessionid><actid></actid><sdid></sdid><simid></simid><clientid></clientid></head><body><goods_type srowid=\"1\" erowid=\"100\">%@</goods_type><querydate>%@</querydate></body></root>",cinemaNumber,Date];
    [self connectionWithbody:MovieBody Info:@"影院影片"];

    
}


//影院购票记录查询
-(void)SearchBuyTicketRecord
{
    NSString * recordBody = [NSString stringWithFormat:@"<?xml version=\"1.0\" encoding=\"utf-8\" ?><root><head cid=\"08000009\" sver=\"A 2.0.0.240\" mac=\"1234567890123456\"><goods_type>2100000000</goods_type><merc_id>301800000000000</merc_id><merc_id></merc_id><areaid></areaid><zip_type></zip_type><userid>\"wang\"</userid><sessionid></sessionid><actid></actid><sdid></sdid><simid></simid><clientid></clientid></head><body></body></root>"];
    [self connectionWithbody:recordBody Info:@"购票记录"];
    
}


#pragma mark -
#pragma mark connection methods
//异步连接
-(void)connectionWithbody:(NSString *)body Info:(NSString *)info 
{
    NSMutableData * Databody=(NSMutableData*)[body dataUsingEncoding:NSUTF8StringEncoding];
    ASIHTTPRequest*request=[ASIHTTPRequest requestWithURL:[self GetURL ]];
    request.userInfo=[NSDictionary dictionaryWithObject:info forKey:@"Info"];
    [request setRequestMethod:@"POST"];
    [request setPostBody:Databody];
    request.shouldResetDownloadProgress=YES;
    [request setDelegate:self];
    [request setDidFinishSelector:@selector(requestDone:)];
    [request setDidFailSelector:@selector(requestWentWrong:)];
    [self.Queue addOperation:request];
    [self.Queue go];
}

//异步连接代理方法
- (void)requestDone:(ASIHTTPRequest *)request
{
     [self.delegate didFinishConnect:request];
}

- (void)requestWentWrong:(ASIHTTPRequest *)request
{
    
    //NSError *error = [request error];
}
//取消请求
-(void)cancelRepuest:(ASIHTTPRequest *)request
{
    [request cancel];
}

@end
