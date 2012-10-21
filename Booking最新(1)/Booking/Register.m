//
//  Register.m
//  Booking
//
//  Created by Ibokan 王龙祥 on 12-9-25.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "Register.h"

@implementation Register
@synthesize RegConnection,alertTitle,registere;
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

//注册
-(void)reguserID:(NSString *)userID upass:(NSString *)upass mod_num:(NSString *)mod_num postcode:(NSString *)postcode areaid:(NSString *)areaid address:(NSString *)address uname:(NSString *)uname email:(NSString *)email  delegate:(registered *)deleGate
{
    NSString * regBody = [NSString stringWithFormat:@"<?xml version=\"1.0\" encoding=\"utf-8\" ?><root><head cid=\"01000000\" sver=\"A 2.0.0.240\" mac=\"1234567890123456\"><goods_type>2100000000</goods_type><merc_id>301800000000000</merc_id><areaid></areaid><zip_type></zip_type><userid>%@</userid><sessionid></sessionid><actid></actid><sdid></sdid><simid></simid><clientid></clientid></head><upass>%@</upass><mob_num>%@</mob_num><phone_num></phone_num><postcode>%@</postcode><areaid>%@</areaid><address>\"%@\"</address><uname>%@</uname><email>%@</email></root>",userID,[self md5HexDigest:upass],mod_num,postcode,areaid,address,uname,email];
    self.registere = deleGate;
    [self connectionWithbody:regBody];
}

-(void)connectionWithbody:(NSString *)body
{
    NSData * regData=[body dataUsingEncoding:NSUTF8StringEncoding];
    URLCacheConnection * conection =[[URLCacheConnection alloc]initWithURL:[self GetURL] body:regData delegate:self];
    self.RegConnection= conection.connection;
    [conection release];
}

-(void)connectionDidFinish:(URLCacheConnection *)theConnection
{
    NSString * xmlregister =  [[NSString alloc]initWithData:theConnection.receivedData encoding:NSUTF8StringEncoding];
    
    GDataXMLDocument * document = [[GDataXMLDocument alloc]initWithXMLString:xmlregister options:0 error:nil];
    GDataXMLElement * root = [document rootElement];
    NSArray * rtn = [root elementsForName:@"rtn"];
    GDataXMLElement * rtnele = [rtn objectAtIndex:0];
    NSArray * rmslast = [rtnele elementsForName:@"rms"];
    GDataXMLElement * rms= [rmslast objectAtIndex:0];
    
    alertTitle = [rms stringValue]; 
    
    UIAlertView * registerAler = [[UIAlertView alloc]initWithTitle:alertTitle message:nil delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    
    [registerAler show];
    
 
}
-(void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    if(buttonIndex==0)
    {
       // registered * regis = [registered new];
        
        [registere zhangxiu];
        
    
    }

}

-(void)connectionDidFail:(URLCacheConnection *)theConnection
{
    
}
@end
