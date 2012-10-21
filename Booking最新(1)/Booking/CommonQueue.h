//
//  CommonQueue.h
//  Booking
//
//  Created by Ibokan 王龙祥 on 12-10-18.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ASINetworkQueue.h"
#import "ASIHTTPRequest.h"
@interface CommonQueue : NSObject



+(void)addRequest:(ASIHTTPRequest*)request;
+(void)Go;
+(void)cancelAllOperations;
@end
