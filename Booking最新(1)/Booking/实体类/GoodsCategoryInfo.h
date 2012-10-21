//
//  GoodsCategoryInfo.h
//  NewEngine
//
//  Created by yinda runhe on 3/19/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GoodsCategoryInfo : NSObject

@property (nonatomic, assign) BOOL hasChildCategories;
@property (nonatomic, assign) NSInteger goodsID;
@property (nonatomic, assign) NSInteger pid;
@property (nonatomic, copy) NSString *name;

@end
