//
//  StaticArea.m
//  Booking
//
//  Created by Ibokan 王龙祥 on 12-10-14.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "StaticArea.h"

@implementation StaticArea
static NSString* _CurrentCity=@"北京";

+(NSString*)CurrentCity
{
    return _CurrentCity;
}
+(void)setCurrentCity:(NSString *)currentCity
{
    _CurrentCity=currentCity;
}
@end
