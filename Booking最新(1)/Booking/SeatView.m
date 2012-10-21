//
//  SeatView.m
//  FeiPiao
//
//  Created by 刘洋 on 12-10-11.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "SeatView.h"
//#import "GetSeatIndex.h"
#import "SeatButten.h"
@implementation SeatView
@synthesize delegate;
- (id)initWithFrame:(CGRect)frame andSeatArray:(NSArray *)array{
    self = [super init];
    if (self) {
        self.frame=frame;

        seatArrey=array;
        self.backgroundColor=[UIColor grayColor];
    }
    return self;
}

-(void)addSeat
{
    int maxRow=0;
    int maxcolumn=0;
    int minRow;
    int mincolumn;
    
    float with=self.frame.size.width;
    float height=self.frame.size.height;
    
    
    NSNumber *ThistimeRow;
    NSString *count;
    
    
    
    NSMutableArray *rowArray=[[NSMutableArray alloc]init];
    
    for (GetSeatIndex *getSeat in seatArrey) {
        
        if (count==nil) {
            
            count=[NSString stringWithFormat:@"%@",getSeat.rowid];
            ThistimeRow=[NSNumber numberWithInt:[getSeat.rowdesc integerValue]];
            
            NSArray *array=[NSArray arrayWithObjects:ThistimeRow,count, nil];
            [rowArray addObject:array];
            minRow=[getSeat.rowdesc integerValue];
            mincolumn=[getSeat.columndesc integerValue];
        }else
        {
            //得到每一行的标示
            if ([NSNumber numberWithInt:[getSeat.rowdesc integerValue]]!=ThistimeRow) {
                ThistimeRow=[NSNumber numberWithInt:[getSeat.rowdesc integerValue]];
                count=[NSString stringWithFormat:@"%@",getSeat.rowid];
                
                NSArray *array=[NSArray arrayWithObjects:ThistimeRow,count, nil];
                [rowArray addObject:array];
            }
            //得到最小行号
            if ([getSeat.rowdesc integerValue]<minRow) {
                minRow=[getSeat.rowdesc integerValue];
            }
            //得到最小列号
            if ([getSeat.columndesc integerValue]<mincolumn) {
                mincolumn=[getSeat.columndesc integerValue];
            }

        }
        //得到最大行号
        if ([getSeat.rowdesc integerValue]>maxRow) {
            maxRow=[getSeat.rowdesc integerValue];
        }
        //得到最大列号
        if ([getSeat.columndesc integerValue]>maxcolumn) {
            maxcolumn=[getSeat.columndesc integerValue];
        }
        
    }
    float pointx;
    float pointy;
    
    //添加列标示
        for (NSArray *arrey in rowArray) {
            
            pointx=with/((float)maxcolumn+1.0)*(mincolumn-1);
            pointy=height/((float)maxRow+1.0)*[[arrey objectAtIndex:0] intValue]; 
            
            UILabel *lable=[[UILabel alloc]initWithFrame:CGRectMake(pointx, pointy, with/maxcolumn*0.8, height/maxRow*0.8)];
            lable.backgroundColor=[UIColor clearColor];
            //lable.minimumFontSize=1.0;
            //lable.contentMode=UIViewContentModeCenter;
            //lable.adjustsFontSizeToFitWidth=YES;
            //lable.baselineAdjustment=UIBaselineAdjustmentNone;
            
            lable.text=[arrey objectAtIndex:1];
            
            //(CGFloat *)[NSNumber numberWithFloat:19]
            CGFloat actualFontSize;
            [lable.text sizeWithFont:[UIFont systemFontOfSize:15] minFontSize:8.0 actualFontSize:&actualFontSize forWidth:with/maxcolumn*0.8 lineBreakMode:UILineBreakModeClip];
//[lable sizeToFit];
            [self addSubview:lable];
            [lable release];
        }
    [rowArray release];

    
    NSLog(@"----maxRow-%d--maxcolumn-%d",maxRow,maxcolumn);
    

    //添加座位
    for (GetSeatIndex *getSeat in seatArrey) {
        
       // NSLog(@"------888888--%@,",getSeat.columnid);
        SeatButten *button=[SeatButten buttonWithType:UIButtonTypeCustom];
        
        pointx=with/((float)maxcolumn+1.0)*[getSeat.columndesc integerValue];
        pointy=height/((float)maxRow+1.0)*[getSeat.rowdesc integerValue];
        
        
        if ([getSeat.damaged isEqualToString:@"N"]) {
            [button setImage:[UIImage imageNamed:@"可选座位.png"] forState:UIControlStateNormal];
            [button addTarget:self action:@selector(gaveButtonIndex:) forControlEvents:UIControlEventTouchUpInside];
        }
        else
        {
        [button setImage:[UIImage imageNamed:@"已售座位.png"] forState:UIControlStateNormal];
        
        }
        
        
        
        button.frame=CGRectMake(pointx, pointy, with/maxcolumn*0.8, height/maxRow*0.8);
        
        
        
        
        button.index=getSeat;
        
        [self addSubview:button];
        

    }


}
-(void)gaveButtonIndex:(SeatButten *) seat
{
    //self.delegate 
    if(self.delegate && [self.delegate respondsToSelector:@selector(getButtenIndex:)]){
        [self.delegate getButtenIndex:seat];
        
        
    }
}

@end
