//
//  SearchResultXML.m
//  Booking
//
//  Created by Ibokan 王龙祥 on 12-9-29.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "SearchResultXML.h"

@implementation SearchResultXML


+(NSArray*)XMLWithGDataForCinemaTOMovieInfoInfoResult:(NSString*)CinemaTOMovieInfoResult;
{
    //开始解析
    GDataXMLDocument * document=[[GDataXMLDocument alloc]initWithXMLString:CinemaTOMovieInfoResult options:0 error:nil];
    //取出根节点
    GDataXMLElement * root=[document rootElement];
    //取出body部分
    NSArray * bodyList=[root elementsForName:@"body"];
    //取出body
    GDataXMLElement * body=[bodyList objectAtIndex:0];
    //取出body的孩子  即rows节点
    NSArray * rowsInfos=[body children];
    //取出影院信息列表
    GDataXMLElement * rows=[rowsInfos objectAtIndex:0];
    
    NSLog(@"rowNum===============%d",[[[rows attributeForName:@"num"] stringValue]intValue]);
    //    if ([self.UserInfo isEqualToString:@"影片信息"]||[self.UserInfo isEqualToString:@"影片列表"])
    //    {
    NSArray * filmList=[rows elementsForName:@"wp_film"];
    //保存影院对象列表
    NSMutableArray * filmArray=[[[NSMutableArray alloc]init] autorelease];
    //解析影院信息生成影院对象 遍历
    for(GDataXMLElement * films in filmList){
        //影片编号
        NSString * filmID=[[films attributeForName:@"id"] stringValue];
        //影片名称
        NSString * filmName=[[films attributeForName:@"name"] stringValue];
        //放映时长
        NSString *  filmDuration=[[films attributeForName:@"duration"] stringValue];
        //导演
        NSString * filmDirector=[[films attributeForName:@"director"] stringValue];
        //主演
        NSString * filmCast=[[films attributeForName:@"cast"] stringValue];
        //影片小图地址
        NSString * filmThumbnail=[[films attributeForName:@"thumbnail"] stringValue];
        //影片大图地址
        NSString * filmPoster=[[films attributeForName:@"poster"] stringValue];
        //上映时间
        NSString * filmDate=[[films attributeForName:@"filmdate"] stringValue];
        //影片类型
        NSString * filmClass=[[films attributeForName:@"filmclass"] stringValue];
        //影片地区
        NSString * filmArea=[[films attributeForName:@"filmarea"] stringValue];
        //影票描述
        NSString * filmDescription=[[films attributeForName:@"description"] stringValue];
        //创建影片对象
        MovieInfo * film=[[MovieInfo alloc]initWithMovieID:filmID movieName:filmName duration:filmDuration director:filmDirector cast:filmCast thumbnail:filmThumbnail cachedThumbnail:nil poster:filmPoster filmDate:filmDate filmClass:filmClass filmArea:filmArea filmDesc:filmDescription showCount:nil];
        [filmArray addObject:film];
        
    }
    NSLog(@"影片的个数************************%d",[filmArray count]);
    [document release];
    return filmArray;
}

+(NSArray*)XMLWithGDataForCinemaInfoResult:(NSString*)CinemaInfoResult
{
    NSLog(@"%@",CinemaInfoResult);
    //开始解析
    GDataXMLDocument * document=[[GDataXMLDocument alloc]initWithXMLString:CinemaInfoResult options:0 error:nil];
    //取出根节点
    GDataXMLElement * root=[document rootElement];
    //取出body部分
    NSArray * bodyList=[root elementsForName:@"body"];
    //取出body
    GDataXMLElement * body=[bodyList objectAtIndex:0];
    //取出body的孩子  即rows节点  
    NSArray * rowsInfos=[body children];
    //取出影院信息列表
    GDataXMLElement * rows=[rowsInfos objectAtIndex:0];
    
    NSLog(@"rowNum===============%d",[[[rows attributeForName:@"num"] stringValue]intValue]);
    NSArray * cinemaList=[rows elementsForName:@"wp_cinema"]; 
    //保存影院对象列表 
    NSMutableArray * cinemaArray=[[[NSMutableArray alloc]init] autorelease];
    //解析影院信息生成影院对象 遍历
    for(GDataXMLElement * cinemas in cinemaList){
        //影院编号
        NSString* cinemaID=[[cinemas attributeForName:@"id"] stringValue] ;
        //影院名称
        NSString * cinemaName=[[cinemas attributeForName:@"name"] stringValue];
        //影院所在城市
        NSString * cinemaLocation=[[cinemas attributeForName:@"location"] stringValue];
        //影厅个数
        int hallCount=[[[cinemas attributeForName:@"hallcount"] stringValue] intValue];
        //影院地址
        NSString * cinemaAddress=[[cinemas attributeForName:@"address"] stringValue];
        //乘车路线
        NSString * busline=[[cinemas attributeForName:@"busline"] stringValue];
        //影院描述
        NSString * cinemaDescription=[[cinemas attributeForName:@"desc"] stringValue];
        //影院图片地址
        NSString * photo=[[cinemas attributeForName:@"photo"] stringValue];
        //城市编号
        NSString* cityID=[[cinemas attributeForName:@"cityid"] stringValue];
        //地区编号
        NSString* districtID=[[cinemas attributeForName:@"districtid"] stringValue];
        //地区名称
        NSString * districtName=[[cinemas attributeForName:@"districtname"] stringValue];
        int filmShowCount=[[[cinemas attributeForName:@"filmshowcount"] stringValue] intValue];
        //创建影院对象
        Cinema *cinema=[[Cinema alloc]initWithCinemaID:cinemaID  CinemaName:cinemaName CinemaLocation:cinemaLocation CinemaHallcount:hallCount CinemaAddress:cinemaAddress CinemaBusline:busline CinemaDesc:cinemaDescription CinemaPhoto:photo CinemaCityID:cityID CinemaDistrictID:districtID CinemaDistrictName:districtName CinemaFilmShowcount:filmShowCount];
        
        //将影院对象放入数组
        [cinemaArray addObject:cinema];
        
    }
    NSLog(@"影院的个数================%d",[cinemaArray count]);
    return cinemaArray;
}


+(NSArray*)XMLWithGDataForHallInfoResult:(NSString*)HallInfoResult
{
    NSLog(@"%@",HallInfoResult);
    //开始解析
    GDataXMLDocument * document = [[GDataXMLDocument alloc]initWithXMLString:HallInfoResult options:0 error:nil];
    //取出根节点
    GDataXMLElement * root=[document rootElement];
    //取出body部分
    NSArray * bodyList=[root elementsForName:@"body"];
    //取出body
    GDataXMLElement * body=[bodyList objectAtIndex:0];
    //取出body的孩子  即rows节点  
    NSArray * rowsInfos=[body children];
    
    //取出影厅信息列表
    GDataXMLElement * rows=[rowsInfos objectAtIndex:0];
    
    NSLog(@"rowNum===============%d",[[[rows attributeForName:@"num"] stringValue]intValue]);
    NSArray * hallList=[rows elementsForName:@"wp_hall"]; 
    //保存影厅对象列表 
    NSMutableArray * hallArray=[[[NSMutableArray alloc]init] autorelease];
    //解析影厅信息生成影厅对象 遍历
    for(GDataXMLElement * hall in hallList){
        //        //影院编号
        //        NSString* cinemaID=[[cinemas attributeForName:@"id"] stringValue] ;
        //        //影院名称
        //        NSString * cinemaName=[[cinemas attributeForName:@"name"] stringValue];
        //影厅编号
        NSString * hallID= [[hall attributeForName:@"hallid"]stringValue];
        //id
        NSString * serialNO = [[hall attributeForName:@"id"]stringValue];
        //影厅名字
        NSString * hallName = [[hall attributeForName:@"name"]stringValue];
        //座位数
        NSUInteger seatCount= [[[hall attributeForName:@"seatcount"]stringValue]integerValue];
        //是否对外售票
        BOOL isvalid=[[[hall attributeForName:@"valid"]stringValue]boolValue];
        //是否VIP
        BOOL isvip=[[[hall attributeForName:@"vip"]stringValue]boolValue];
        
        //给实体类影厅赋值
        HallInfo * halla = [[HallInfo alloc]initWithSerialNO:serialNO HallName:hallName SeatCount:seatCount HallID:hallID IsVIP:isvalid IsValid:isvip];
        //添加实体类影厅对象到数组中
        [hallArray addObject:halla];
        NSLog(@"%@",halla);
        
    }
    //返回数组
    return hallArray;
}

+(NSArray*)XMLWithGDataForMovieInfoResult:(NSString*)MovieInfoResult
{
    NSLog(@"%@",MovieInfoResult);
    GDataXMLDocument * document=[[GDataXMLDocument alloc]initWithXMLString:MovieInfoResult options:0 error:nil];
    GDataXMLElement * root=[document rootElement];
    NSArray * bodyList=[root elementsForName:@"body"];
    GDataXMLElement * body=[bodyList objectAtIndex:0];
    NSArray * rowsInfos=[body children];
    //取出影院信息列表
    GDataXMLElement * row=[rowsInfos objectAtIndex:0];
    NSArray * movieList=[row elementsForName:@"wp_film"]; 
    NSMutableArray *movieArray=[[[NSMutableArray alloc]init] autorelease]; 
    
    
    for(GDataXMLElement * movie in movieList){
        NSString* movieCast=[[movie attributeForName:@"cast"] stringValue] ;
        NSString* movieDescription=[[movie attributeForName:@"description"] stringValue] ;
        NSString* movieDirector=[[movie attributeForName:@"director"] stringValue] ;
        NSString* movieDuration=[[movie attributeForName:@"duration"] stringValue] ;
        NSString* Moviearea=[[movie attributeForName:@"filmarea"] stringValue] ;
        NSString* MovieClass=[[movie attributeForName:@"filmclass"] stringValue] ;
        NSString* MovieDate=[[movie attributeForName:@"filmdate"] stringValue] ;
        NSString* MovieID=[[movie attributeForName:@"id"] stringValue] ;
        NSString* Moviename=[[movie attributeForName:@"name"] stringValue] ;
        NSString* poster=[[movie attributeForName:@"poster"] stringValue] ;
        NSString* thumbnail=[[movie attributeForName:@"thumbnail"] stringValue] ;
        
        MovieInfo *movie=[[MovieInfo alloc]initWithMovieID:MovieID movieName:Moviename duration:movieDuration director:movieDirector cast:movieCast thumbnail:thumbnail cachedThumbnail:nil poster:poster filmDate:MovieDate filmClass:MovieClass filmArea:Moviearea filmDesc:movieDescription showCount:nil];
        
        
        
        [movieArray addObject:movie];
        
        
        
        
    }
    return movieArray;
}

+(NSArray*)XMLWithGDataForMovieShowInfoResult:(NSString*)MovieShowInfoResult
{ 
    
    
    NSLog(@"%@",MovieShowInfoResult);
    //开始解析
    GDataXMLDocument * document = [[GDataXMLDocument alloc]initWithXMLString:MovieShowInfoResult options:0 error:nil];
    //取出根节点
    GDataXMLElement * root=[document rootElement];
    //取出body部分
    NSArray * bodyList=[root elementsForName:@"body"];
    //取出body
    GDataXMLElement * body=[bodyList objectAtIndex:0];
    //取出body的孩子  即rows节点  
    NSArray * rowsInfos=[body children];
    
    //取出场次信息列表
    GDataXMLElement * rows=[rowsInfos objectAtIndex:0];
    
    NSLog(@"rowNum===============%d",[[[rows attributeForName:@"num"] stringValue]intValue]);
    NSArray * showList=[rows elementsForName:@"wp_show"]; 
    //保存场次对象列表 
    NSMutableArray * showArray=[[[NSMutableArray alloc]init] autorelease];
    //解析场次信息生成场次对象 遍历
    for(GDataXMLElement * show in showList){
        
        //        cinemaid="37" filmid="63026" filmlanguage="中文/2D" filmname="危险关系" filmstatus="1" filmtime="2012-10-11 21:20:00" hallid="3" hallname="3号厅" id="70720121010046696" price="5000" showdate="2012-10-11" showtime="2120" vipprice="4800
        
        NSString * Cinemaid=[[show attributeForName:@"cinemaid"]stringValue];
        NSString * Filmid=[[show attributeForName:@"filmid"]stringValue];
        NSString * filmlanguage=[[show attributeForName:@"filmlanguage"]stringValue];
        NSString * filmname=[[show attributeForName:@"filmname"]stringValue];
        NSString * filmstatus=[[show attributeForName:@"filmstatus"]stringValue];
        NSString * filmtime=[[show attributeForName:@"filmtime"]stringValue];
        NSString * hallid=[[show attributeForName:@"hallid"]stringValue];
        NSString * hallname=[[show attributeForName:@"hallname"]stringValue];
        NSString * showid=[[show attributeForName:@"id"]stringValue];
        double price=[[[show attributeForName:@"price"]stringValue]doubleValue];
        NSString * showdate=[[show attributeForName:@"showdate"]stringValue];
        NSString * showtime=[[show attributeForName:@"showtime"]stringValue];
        double vipprice=[[[show attributeForName:@"vipprice"]stringValue]doubleValue];
        
        MovieShowInfo * movieShow = [[MovieShowInfo alloc ]initWithShowID:showid ShowDate:showdate ShowTime:showtime HallID:hallid HallName:hallname CinemaID:Cinemaid FilmID:Filmid FilmName:filmname FilmLanguage:filmlanguage FilmTime:filmtime FilmStatus:filmstatus Price:price VipPrice:vipprice];
        
        [showArray addObject:movieShow];
        
        
    }
    return showArray;
    
}

+(NSArray*)XMLWithGDataForMovieTicketInfoResult:(NSString*)MovieTicketInfoResult
{
    return nil;
}

+(NSArray*)XMLWithGDataForSeatInfoInfoResult:(NSString*)SeatInfoInfoResult
{
    NSLog(@"%@",SeatInfoInfoResult);
    //开始解析
    GDataXMLDocument * document = [[GDataXMLDocument alloc]initWithXMLString:SeatInfoInfoResult options:0 error:nil];
    //取出根节点
    GDataXMLElement * root=[document rootElement];
    //取出body部分
    NSArray * bodyList=[root elementsForName:@"body"];
    //取出body
    GDataXMLElement * body=[bodyList objectAtIndex:0];
    //取出body的孩子  即rows节点  
    NSArray * rowsInfos=[body children];
    
    //取出场次信息列表
    GDataXMLElement * rows=[rowsInfos objectAtIndex:0];
    
    NSLog(@"rowNum===============%d",[[[rows attributeForName:@"num"] stringValue]intValue]);
    NSArray * seatList=[rows elementsForName:@"wp_seat"]; 
    //保存场次对象列表 
    NSMutableArray * seatArray=[[[NSMutableArray alloc]init] autorelease];
    //解析场次信息生成场次对象 遍历
    for(GDataXMLElement * seat in seatList){
        
        NSString * cinemaid=[[seat attributeForName:@"cinemaid"]stringValue];
        NSString * columndesc=[[seat attributeForName:@"columndesc"]stringValue];
        NSString * columnid=[[seat attributeForName:@"columnid"]stringValue];
        NSString * damaged=[[seat attributeForName:@"damaged"]stringValue];
        NSString * hallid=[[seat attributeForName:@"hallid"]stringValue];
        NSString * rowdesc=[[seat attributeForName:@"rowdesc"]stringValue];
        NSString * rowid=[[seat attributeForName:@"rowid"]stringValue];
        NSString * seattype=[[seat attributeForName:@"seattype"]stringValue];
        NSString * status=[[seat attributeForName:@"status"]stringValue];
        
        GetSeatIndex *seatIn=[[GetSeatIndex alloc]init];
        seatIn.num=columndesc;
        seatIn.cinemaid=cinemaid;
        seatIn.columndesc=columndesc;
        seatIn.columnid=columnid;
        seatIn.damaged=damaged;
        seatIn.hallid=hallid;
        seatIn.rowid=rowid;
        seatIn.rowdesc=rowdesc;
        seatIn.seattype=seattype;
        seatIn.status=status;
        [seatArray addObject:seatIn];
        
        
    }
    return seatArray;
}
+(NSString *)XMLWithGDataForLoginResult:(NSString *)LoginResult
{
    GDataXMLDocument * document = [[GDataXMLDocument alloc]initWithXMLString:LoginResult options:0 error:nil];
    
    GDataXMLElement * root = [document rootElement];
    
    
    NSArray * rtn = [root elementsForName:@"rtn"];
    GDataXMLElement * rtnele = [rtn objectAtIndex:0];
    NSArray * rmslast = [rtnele elementsForName:@"rms"];
    GDataXMLElement * rms= [rmslast objectAtIndex:0];
    NSLog(@"%@",[rms stringValue]);
    NSString * rmstext = [rms stringValue];
    
    // NSMutableArray * loginarray = [[[NSMutableArray alloc]init]autorelease];
    //LandingInterface * landing = [[LandingInterface alloc]initWithAletext:rmstext];
    //[loginarray addObject:landing];
    
    
    return rmstext;
    
}
+(NSString *)XMLWtihGDataForDownResult:(NSString *)DownResult
{
    NSLog(@"%@",DownResult);
    GDataXMLDocument * document = [[GDataXMLDocument alloc]initWithXMLString:DownResult options:0 error:nil];
    GDataXMLElement * root= [document rootElement];
    NSArray * hade = [root elementsForName:@"head"];
    GDataXMLElement * hadelast = [hade objectAtIndex:0];
    
    
    
    
    NSArray * userlast = [hadelast elementsForName:@"userid"];
    GDataXMLElement * uselasta=[userlast objectAtIndex:0];
    NSLog(@"%@",[uselasta stringValue]);
    NSString * userid = [uselasta stringValue];
    return userid;
    
    
    //<?xml version="1.0" encoding="UTF-8" standalone="no" ?><root><rtn sver="3.1.1.2 201112221201"><rcd>07</rcd><rms>系统繁忙,请稍候再试.为您带来的不便,请多见谅!</rms></rtn><head cid="01000005" mac="1234567890123456" sver="A 2.0.0.240"><goods_type/><merc_id/><areaid>100000</areaid><zip_type/><userid>ZHAOJIANG</userid><sessionid></sessionid><actid/><sdid/><simid/><clientid>123456789</clientid></head></root>
    
}

@end

