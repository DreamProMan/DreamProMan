//
//  MovieInfoView.h
//  Booking
//
//  Created by Ibokan 王龙祥 on 12-10-10.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HomeViewController;

@protocol push;
@interface MovieInfoView : UIView
@property (nonatomic, retain)   UILabel *movieName;            // 影片名称
@property (nonatomic, retain) UILabel *duration;            // 放映时长
@property (nonatomic, retain)   UILabel *director;             // 导演
@property (nonatomic, retain)   UILabel *cast;                 // 主演
@property (nonatomic, retain)   UIImageView *thumbnail;            // 小图
@property (nonatomic, retain)   UILabel *filmDate;             // 上映时间
@property (nonatomic, retain)   UILabel *filmClass;            // 影片类型
@property (nonatomic, retain)   UILabel *filmArea;             // 影片地区
@property (nonatomic, retain)   UITextView *filmDesc;             // 影片描述
@property (nonatomic,assign) id<push> homedelegate;
@property (nonatomic,copy) NSString * currentmovieID;
@property (nonatomic,copy) NSString * currentcityName;
@property (nonatomic, retain)   UILabel *movieName1;//影片名:
@property (nonatomic,retain)    UILabel *director1;//导演:
@property (nonatomic,retain)    UILabel *cast1;//主演:
@property (nonatomic,retain)    UILabel *filmDate1;//上映时间:
@property (nonatomic,retain)    UILabel *filaArea1;//影片地区:
@property (nonatomic,retain)    UILabel *filmDesc1;//影片描述:
-(id)initWithFrame:(CGRect)frame movieID:(NSString *)movieID cityName:(NSString *)cityName delegate:(id)delegate AndmovieName:(NSString*)movieName duration:(NSString*)duration director:(NSString*)director cast:(NSString *)cast thumbnail:(UIImageView*)thumbnail  filmDate:(NSString*)filmDate filmClass:(NSString*)filmClass filmArea:(NSString*)filmArea filmDesc:(NSString*)filmDesc;
-(void)loadView;

@end
@protocol push <NSObject>

-(void)pushVC;

@end