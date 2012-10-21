//
//  GoodsInfo.m
//  NewEngine
//
//  Created by yinda runhe on 3/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "GoodsInfo.h"

@implementation GoodsInfo

@synthesize goodsId;
// 产品描述
@synthesize description;
// 产品名称
@synthesize name;
// 产品价格
@synthesize price;
// 产品库存（数量、状态）
@synthesize stock;
// 产品所属商户名称
@synthesize merchantName;
// 产品所属商户号
@synthesize unionPayMerchantId;
// 产品所属终端号
@synthesize unionPayTerminalId;
// 产品mcc
@synthesize unionPayCategoryId;
// 支付方式
@synthesize payType;

-(void) dealloc
{
    [goodsId release];
    [description release];
    [name release];
    [stock release];
    [merchantName release];
    [unionPayMerchantId release];
    [unionPayTerminalId release];
    [unionPayCategoryId release];
    [payType release];
    
    [super dealloc];
}

-(id) init
{
    self = [super init];
    
    return self;
}

@end
