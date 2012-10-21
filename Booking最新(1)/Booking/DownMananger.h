//
//  DownMananger.h
//  Booking
//
//  Created by 赵将 zhaojiang on 12-10-17.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DownDelegate.h"
#import "DownInformation.h"
#import "Connectiondelegte.h"
#import "SearchResultXML.h"
@class DownInformation;

@interface DownMananger : NSObject<Connectiondelegte>

@property (assign,nonatomic)id<DownDelegate>downDele;
@property (assign,nonatomic)DownInformation * downInforDele;
-(id)initWithdelegate:(id<DownDelegate>)delegate;
//下载用户信息
-(void)DownuserID:(NSString*)userID upass:(NSString*)upass;
@end
