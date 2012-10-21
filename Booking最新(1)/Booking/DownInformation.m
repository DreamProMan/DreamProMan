//
//  DownInformation.m
//  Booking
//
//  Created by 赵将 zhaojiang on 12-10-17.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "DownInformation.h"

@implementation DownInformation
@synthesize connection,CurrentUserID=_CurrentUserID;



//得到URL
-(NSURL*)GetURL
{
    NSURL * url=[NSURL URLWithString:@"http://tm.mbpay.cn:8082"];
    return url;
}

//加密
-(NSString*)md5HexDigest:(NSString*)input
{
    const char* str = [input UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(str, strlen(str), result);
    
    NSMutableString *ret = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH*2];
    for(int i = 0; i<CC_MD5_DIGEST_LENGTH; i++) {
        [ret appendFormat:@"%02x",result[i]];
    }
    return ret;
}

//判断字符串是否为空字符
-(BOOL)isenptyWithString:(NSString *)string
{
    if (string==@"") {
        return YES;
    }
    return NO;
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
    [request setDelegate:self];
    // [request startSynchronous];
    
    [request startAsynchronous];
    
    
}
-(void)DownuserID:(NSString *)userID upass:(NSString *)upass
{ 
    
    _CurrentUserID=[[NSString alloc]initWithFormat:userID];
    
    NSString * loadBody = [NSString stringWithFormat:@"<?xml version=\"1.0\" encoding=\"utf-8\" ?><root><head cid=\"01000005\" sver=\"A 2.0.0.240\" mac=\"1234567890123456\"><goods_type></goods_type><merc_id></merc_id><areaid></areaid><zip_type></zip_type><userid>%@</userid><sessionid></sessionid><actid></actid><sdid></sdid><simid></simid><clientid></clientid></head><body><upass>%@</upass></body></root>",userID,[self md5HexDigest:upass]];
    [self connectionWithbody:loadBody Info:@"信息下载"];


}
-(void)requestFinished:(ASIHTTPRequest *)request
{
   [self.connection didFinishConnect:request];
    
}
-(void)requestFailed:(ASIHTTPRequest *)request
{
}
@end
