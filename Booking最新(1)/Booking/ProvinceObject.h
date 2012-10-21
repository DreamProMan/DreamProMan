//
//  ProvinceObject.h
//  ChinaProvinceTest
//
//  Created by user on 12-3-22.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface ProvinceObject : NSObject {
	int  proId;
	NSString *proName;
	int cityId;

}
@property(nonatomic,assign)	int  proId;
@property(nonatomic,assign)	int  cityId;
@property(nonatomic,retain)	NSString *proName;
@end
