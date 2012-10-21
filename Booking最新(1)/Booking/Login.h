//
//  Login.h
//  Booking
//
//  Created by Ibokan 王龙祥 on 12-9-25.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonDigest.h>
#import "URLCacheConnection.h"
#import "ASIHTTPRequest.h"
#import "Connectiondelegte.h"
@interface Login : NSObject<ASIHTTPRequestDelegate>
{
    NSString * _CurrentUserID;
}
@property (assign,nonatomic) id<Connectiondelegte> ConnectionDele;
@property (retain,nonatomic) NSString * CurrentUserID;
//得到URL
-(NSURL*)GetURL;

//加密
-(NSString*)md5HexDigest:(NSString*)input;


//判断字符串是否为空字符
-(BOOL)isenptyWithString:(NSString*)string;

//异步连接
-(void)connectionWithbody:(NSString*)body Info:(NSString*)info;


//登陆
-(void)loaduserID:(NSString*)userID upass:(NSString*)upass;


@end
