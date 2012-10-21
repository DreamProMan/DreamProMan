//
//  GameServerInfo.h
//  NewEngine
//
//  Created by yinda runhe on 3/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GameServerInfo : NSObject

@property (nonatomic, copy) NSString *serverId;
@property (nonatomic, copy) NSString *productId;
@property (nonatomic, copy) NSString *gameName;
@property (nonatomic, copy) NSString *areaName;
@property (nonatomic, copy) NSString *serverName;

@end
