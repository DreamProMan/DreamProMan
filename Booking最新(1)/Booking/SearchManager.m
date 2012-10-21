//
//  SearchManager.m
//  Booking
//
//  Created by Ibokan 王龙祥 on 12-9-30.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "SearchManager.h"

@implementation SearchManager
@synthesize searchDelegate,dataACdele;
-(id)initWithdelegate:(id<SearchDelegate>)delegate
{
    self=[super init];
    if (self) {
        self.searchDelegate=delegate;
       DataAccesses*DataAC =[[DataAccesses alloc]init];
        self.dataACdele=DataAC;
        DataAC.delegate=self;
    }
    return self;
}

//影院信息查询:可以通过影片标号以及地区位置（任一可为空）
-(void)SearchCinemaInAreaWithMovieNumber:(NSString*)movieNumber andAera:(NSString*)area
{
    [self.dataACdele SearchCinemaInAreaWithMovieNumber:movieNumber andAera:area];
}


//影院放映场次信息查询：可以通过影院编号（必填）及影片编号（可为空）及日期：yyyy-MM-dd（可为空）
-(void)SearchInfoOfMoviewShowWithCinemaNumber:(NSString*)cinemaNumber andMOvieNumber:(NSString*)movieNumber date:(NSString*)date;
{
    [self.dataACdele SearchInfoOfMoviewShowWithCinemaNumber:cinemaNumber andMOvieNumber:movieNumber date:date];
}


//影院已定座位信息查询：可以通过放映流水号（必填）查询
-(void)SearchSeatWithMovieShowWithShowNumber:(NSString*)showNumber
{
    [self.dataACdele SearchSeatWithMovieShowWithShowNumber:showNumber];
}


//影院影厅信息查询：可以通过影院编号（必填）查询
-(void)SearchHallidWithCinemaNumber:(NSString*)cinemaNumber
{
    [self.dataACdele SearchHallidWithCinemaNumber:cinemaNumber];
}


//影片信息查询：当输入为YES时查询所有影片，输入NO时查询当前影片
-(void)SearchMovieInfoWithAll:(BOOL)isAll
{
    [self.dataACdele SearchMovieInfoWithAll:isAll];
}


//影院影片信息查询：可以通过影院编号以及日期:yyyy-MM-dd（必填）查询电影信息
-(void)SearchAllOfMovieInfoWithCinemaNumber:(NSString*)cinemaNumber andshowDate:(NSString*)Date
{
    [self.dataACdele SearchAllOfMovieInfoWithCinemaNumber:cinemaNumber andshowDate:Date];
}


//影院购票记录查询
-(void)SearchBuyTicketRecord
{
    [self.dataACdele SearchBuyTicketRecord];
}


-(void)didFinishConnect:(ASIHTTPRequest *)request
{
    NSString *response = [[NSString alloc]initWithData:request.responseData encoding:NSUTF8StringEncoding];
    NSLog(@"%@",response);
    
    NSString*info =[request.userInfo objectForKey:@"Info"];
    NSArray * XMLarray;
    if ([info isEqualToString: CINEMAINFO]) {
        XMLarray=[[SearchResultXML XMLWithGDataForCinemaInfoResult:response] retain];
        //查找到影院信息结果，如 id="影院编号"name="影院名称" 
        //location="地区" hallcount="厅个数" address="地址" busline="乘车路线" 
        //desc="描述" photo="图片地址" cityid=”城市编号”districtid="地区编号" 
        //districtname="地区名称"filmshowcount=”影片剩余场次数”> 

       [self.searchDelegate OnGetCinemaResult:XMLarray];
   
    }
    if ([info isEqualToString:SHOWINFO]) 
    {
        XMLarray=[[SearchResultXML XMLWithGDataForMovieShowInfoResult:response] retain];
          [self.searchDelegate OnGetInfoOfMoviewShowResult:XMLarray]; 
    }
    if ([info isEqualToString: SEATINFO]) 
    {
        XMLarray=[[SearchResultXML XMLWithGDataForSeatInfoInfoResult:response] retain];
           [self.searchDelegate OnGetSeatResult:XMLarray];
    }
    if ([info isEqualToString:HALLINFO]) 
    {
        XMLarray=[[SearchResultXML XMLWithGDataForHallInfoResult:response] retain];
           [self.searchDelegate OnGetHallidResult:XMLarray];
    }
    if ([info isEqualToString:MOVIEINFO]) 
    {
        XMLarray=[[SearchResultXML XMLWithGDataForMovieInfoResult:response] retain];
           [self.searchDelegate OnGetMovieInfoResult:XMLarray];
    }
    if ([info isEqualToString:CINEMATOMOVIEINFO]) 
    {
        XMLarray=[[SearchResultXML XMLWithGDataForCinemaTOMovieInfoInfoResult:response] retain];
           [self.searchDelegate OnGetAllOfMovieInfoResult:XMLarray];
    }
    if ([info isEqualToString:TICKETINFO]) 
    {
        XMLarray=[[SearchResultXML XMLWithGDataForMovieTicketInfoResult:response] retain];
           [self.searchDelegate OnGetTicketRecordResult:XMLarray];
    }


}
@end
