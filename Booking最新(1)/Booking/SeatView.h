//
//  SeatView.h
//  FeiPiao
//
//  Created by 刘洋 on 12-10-11.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
@class SeatButten;
@class GetSeatIndex;

@protocol SeatViewdelegate 

@optional
-(void)getButtenIndex:(SeatButten *) getseatIndex;

@end

@interface SeatView : UIView
{

    
    NSArray *seatArrey;
    
    id<SeatViewdelegate> delegate;
}
@property (assign,nonatomic) id<SeatViewdelegate> delegate;
-(id)initWithFrame:(CGRect)frame andSeatArray:(NSArray *)array;
-(void)gaveButtonIndex:(SeatButten *) seat;
-(void)addSeat;

@end
