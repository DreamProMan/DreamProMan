//
//  SeatButten.h
//  FeiPiao
//
//  Created by 刘洋 on 12-10-11.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GetSeatIndex.h"



@interface SeatButten : UIButton
{

    GetSeatIndex *index;
    
    BOOL isSelect;
}
@property(nonatomic,retain)GetSeatIndex *index;
@property(nonatomic,assign)BOOL isSelect;
@end
