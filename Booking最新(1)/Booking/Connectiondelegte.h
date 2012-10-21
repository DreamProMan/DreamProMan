//
//  Connectiondelegte.h
//  Booking
//
//  Created by Ibokan 王龙祥 on 12-9-30.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ASIHTTPRequest.h"
@protocol Connectiondelegte <NSObject>
-(void)didFinishConnect:(ASIHTTPRequest*)request;
@end
