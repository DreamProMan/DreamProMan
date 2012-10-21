//
//  GoodsInfo.h
//  NewEngine
//
//  Created by yinda runhe on 3/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GoodsInfo : NSObject

// 产品编码
@property (nonatomic, copy) NSString *goodsId;
// 产品描述
@property (nonatomic, copy) NSString *description;
// 产品名称
@property (nonatomic, copy) NSString *name;
// 产品价格
@property (nonatomic, assign) float price;
// 产品库存（数量、状态）
@property (nonatomic, copy) NSString *stock;
// 产品所属商户名称
@property (nonatomic, copy) NSString *merchantName;
// 产品所属商户号
@property (nonatomic, copy) NSString *unionPayMerchantId;
// 产品所属终端号
@property (nonatomic, copy) NSString *unionPayTerminalId;
// 产品mcc
@property (nonatomic, copy) NSString *unionPayCategoryId;
// 支付方式
@property (nonatomic, copy) NSString *payType;

@end
