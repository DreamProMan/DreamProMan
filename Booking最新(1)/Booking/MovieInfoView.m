//
//  MovieInfoView.m
//  Booking
//
//  Created by Ibokan 王龙祥 on 12-10-10.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "MovieInfoView.h"

@implementation MovieInfoView
@synthesize homedelegate;
@synthesize currentmovieID;
@synthesize currentcityName;
@synthesize movieName = _movieName;
@synthesize duration = _duration;
@synthesize director = _director;
@synthesize cast = _cast;
@synthesize thumbnail = _thumbnail;
@synthesize filmDate = _filmDate;
@synthesize filmClass = _filmClass;
@synthesize filmArea = _filmArea;
@synthesize filmDesc = _filmDesc;

@synthesize movieName1=_movieName1;
@synthesize director1=_director1;
@synthesize filmDesc1=_filmDesc1;
@synthesize filmDate1=_filmDate1;
@synthesize cast1=_cast1;
@synthesize filaArea1=_filaArea1;
-(id)initWithFrame:(CGRect)frame movieID:(NSString *)movieID cityName:(NSString *)cityName delegate:(id)delegate AndmovieName:(NSString*)movieName duration:(NSString*)duration director:(NSString*)director cast:(NSString *)cast thumbnail:(UIImageView*)thumbnail  filmDate:(NSString*)filmDate filmClass:(NSString*)filmClass filmArea:(NSString*)filmArea filmDesc:(NSString*)filmDesc
{
    self = [super initWithFrame:frame];
    if (self) 
    {
        // Initialization code
        self.currentmovieID = movieID;
        self.currentcityName = cityName;
        self.homedelegate = delegate;
        UIImageView*imav=[thumbnail retain];
        
        self.movieName=[[UILabel alloc]initWithFrame:CGRectMake(100,30,100, 20)];//影片名
        self.director=[[UILabel alloc]initWithFrame:CGRectMake(130,50,100, 20)];//导演
        self.cast=[[UILabel alloc]initWithFrame:CGRectMake(130,70 ,80, 20)];//主演
        self.filmArea=[[UILabel alloc]initWithFrame:CGRectMake(150,90 ,80, 20)];//影片地区
        self.filmDate=[[UILabel alloc]initWithFrame:CGRectMake(150,110 ,100, 20)];//上映时间
        self.filmDesc=[[UITextView alloc]initWithFrame:CGRectMake(15,170 ,200, 90)];//影片描述
         self.filmDesc.editable=NO;
        UIButton * bookTicketButton=[UIButton buttonWithType:UIButtonTypeCustom];
                                      
         bookTicketButton.frame=CGRectMake(120, 130, 70, 30);
        bookTicketButton.titleLabel.text=@"立即订票";
        bookTicketButton.titleLabel.textColor=[UIColor  whiteColor];
        [bookTicketButton setBackgroundImage:[UIImage imageNamed:@"tebleBAR背景.png" ] forState:UIControlStateNormal];
     
        [bookTicketButton addTarget:self action:@selector(btnDingTicket:) forControlEvents:UIControlEventTouchDown];
       
        
        self.director1=[[UILabel alloc]initWithFrame:CGRectMake(100, 50, 50, 20)];
        self.director1.font = [UIFont boldSystemFontOfSize:11.0]; 
       // self.director1.textColor=[UIColor colorWithRed:0.9f green:0.9f blue:0.9f alpha:0.4];
        self.director1.backgroundColor=[UIColor clearColor];
        self.director1.text=@"导演:";
        [self addSubview:self.director1];
        
        self.cast1 = [[UILabel alloc]initWithFrame:CGRectMake(100, 70, 50, 20)];
        self.cast1.font = [UIFont boldSystemFontOfSize:11.0];
        self.cast1.backgroundColor = [UIColor clearColor];
        self.cast1.text = @"主演:";
        [self addSubview:self.cast1];
        
        self.filaArea1=[[UILabel alloc]initWithFrame:CGRectMake(100, 90, 50, 20)];
        self.filaArea1.font = [UIFont boldSystemFontOfSize:11.0];
        self.filaArea1.backgroundColor = [UIColor clearColor];
        self.filaArea1.text = @"影片地区:";
        [self addSubview:self.filaArea1];
        
        self.filmDate1=[[UILabel alloc]initWithFrame:CGRectMake(100, 110, 50, 20)];
        self.filmDate1.font = [UIFont boldSystemFontOfSize:11.0];
        self.filmDate1.backgroundColor = [UIColor clearColor];
        self.filmDate1.text=@"上映时间:";
        [self addSubview:self.filmDate1];
        
        self.filmDesc1=[[UILabel alloc]initWithFrame:CGRectMake(15, 132, 105, 60)];
        self.filmDesc1.font = [UIFont boldSystemFontOfSize:14.0];
        self.filmDesc1.backgroundColor = [UIColor clearColor];
        self.filmDesc1.text=@"影片描述:";
       
        [self addSubview:self.filmDesc1];
        
        [self.movieName setText:movieName];
        self.movieName.backgroundColor = [UIColor clearColor];
        self.movieName.font = [UIFont boldSystemFontOfSize:15.0];
        
        [self.duration setText:duration];
        self.duration.backgroundColor = [UIColor clearColor];
        self.duration.font = [UIFont boldSystemFontOfSize:11.0];
        [self.director setText:director];
        self.director.backgroundColor = [UIColor clearColor];
        self.director.font = [UIFont boldSystemFontOfSize:11.0];
      
      
        [self.filmDate setText:[filmDate substringToIndex:9]];
        self.filmDate.backgroundColor = [UIColor clearColor];
        self.filmDate.font = [UIFont boldSystemFontOfSize:11.0];
      
        [self.cast setText:cast];
        self.cast.backgroundColor = [UIColor clearColor];
        self.cast.font = [UIFont boldSystemFontOfSize:11.0];
     
        [self.filmClass setText:filmClass];
        self.filmClass.backgroundColor = [UIColor clearColor];
      
        [self.filmDesc setText:[NSString stringWithFormat:@"    %@",filmDesc]];
        self.filmDesc.backgroundColor = [UIColor clearColor];
        self.filmDesc.font = [UIFont boldSystemFontOfSize:11.0];
     
        [self.filmArea setText:filmArea];
        self.filmArea.backgroundColor = [UIColor clearColor];
        self.filmArea.font = [UIFont boldSystemFontOfSize:11.0];
        
        [self addSubview:self.movieName];
        [self addSubview:self.duration];
        [self addSubview:self.director];
        [self addSubview:self.filmDate];
        [self addSubview:self.cast];
        [self addSubview:self.filmClass];
        [self addSubview:self.filmArea];
        [self addSubview:self.filmDesc];
        [self addSubview:imav];
        [self addSubview:bookTicketButton];
        

    }
    return self;
}
-(void) btnDingTicket:(UIButton *) sender
{
   
    [self.homedelegate pushVC];
   
}
-(void)loadView
{
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
