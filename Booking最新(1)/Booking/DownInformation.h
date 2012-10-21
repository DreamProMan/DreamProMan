//
//  DownInformation.h
//  Booking
//
//  Created by 赵将 zhaojiang on 12-10-17.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonDigest.h>
#import "URLCacheConnection.h"
#import "ASIHTTPRequest.h"
#import "Connectiondelegte.h"

@interface DownInformation : NSObject<ASIHTTPRequestDelegate>

{
    NSString * _CurrentUserID;
}
@property(assign,nonatomic)id<Connectiondelegte>connection;
@property (retain,nonatomic) NSString * CurrentUserID;

-(NSURL *)GETRUL;
//加密
-(NSString*)md5HexDigest:(NSString*)input;


//判断字符串是否为空字符
-(BOOL)isenptyWithString:(NSString*)string;

//异步连接
-(void)connectionWithbody:(NSString*)body Info:(NSString*)info;

//下载用户信息
-(void)DownuserID:(NSString*)userID upass:(NSString*)upass;
@end
