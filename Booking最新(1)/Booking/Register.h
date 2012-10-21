//
//  Register.h
//  Booking
//
//  Created by Ibokan 王龙祥 on 12-9-25.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonDigest.h>
#import "URLCacheConnection.h"
#import "GDataXMLNode.h"
#import "registered.h"
@class registered;
#import "URLCacheAlert.h"
@interface Register : NSObject<URLCacheConnectionDelegate,UIAlertViewDelegate>

@property (retain,nonatomic) NSURLConnection * RegConnection;
@property (assign,nonatomic)registered * registere;
@property (retain,nonatomic)NSString * alertTitle;
//得到URL
-(NSURL*)GetURL;


//加密
-(NSString*)md5HexDigest:(NSString*)input;

//判断字符串是否为空字符
-(BOOL)isenptyWithString:(NSString*)string;


//异步连接
-(void)connectionWithbody:(NSString*)body;


//注册
-(void)reguserID:(NSString*)userID upass:(NSString*)upass mod_num:(NSString*)mod_num postcode:(NSString*)postcode areaid:(NSString*)areaid address:(NSString*)address uname:(NSString*)uname email:(NSString*)email  delegate:(registered *)deleGate;

@end
