//
//  CommonQueue.m
//  Booking
//
//  Created by Ibokan 王龙祥 on 12-10-18.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "CommonQueue.h"
ASINetworkQueue* Queue;
@implementation CommonQueue

+(void)addRequest:(ASIHTTPRequest *)request
{
    if (Queue==nil) {
        Queue=[[ASINetworkQueue alloc]init];
    }
    [Queue addOperation:request];
}
+(void)Go
{
    [Queue go];
   
    
}
+(void)cancelAllOperations
{
    [Queue cancelAllOperations];
}

@end
