//
//  CinemainfoViewController.h
//  Booking
//
//  Created by 张修的mac on 12-10-16.
//
//

#import <UIKit/UIKit.h>
#import "iCarousel.h"
#import "SearchManager.h"
#import "CinemaSearchViewController.h"
#import "SDWebImage/UIImageView+WebCache.h"
@interface CinemainfoViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,iCarouselDelegate,iCarouselDataSource,SearchDelegate>

@property (retain, nonatomic) IBOutlet UILabel *CinemaInfoLabel;
@property(retain,nonatomic)UIView * descview;
@property(retain,nonatomic)NSString * cinemaid;
@property(retain,nonatomic)NSString * cinemainfo;
@property(retain,nonatomic)NSString * cinemaadd;
@property(retain,nonatomic)iCarousel * carousel;
@property (retain, nonatomic) IBOutlet UIButton *addbtn;
@property (retain, nonatomic) IBOutlet UIButton *phonebtn;
@property(retain,nonatomic)SearchManager * search;
@property(retain,nonatomic)NSArray * resultarray;
@property int count;
@property(retain,nonatomic)UIButton * filmbtn;
@property(retain,nonatomic)UIScrollView * scrollview;
@property (retain, nonatomic) IBOutlet UILabel *filmnamelabel;
@property (retain, nonatomic) IBOutlet UILabel *filmdurationlabel;
@property (retain, nonatomic) IBOutlet UIButton *buyBtn;
@property (retain, nonatomic) IBOutlet UIButton *filmDesc;
@property (retain, nonatomic) IBOutlet UILabel *cinemaAddLabel;
@property(retain,nonatomic)UILabel * filmdescLabel;
@property(retain,nonatomic)UILabel * namelabel;
@property(retain,nonatomic)UILabel * filmcastlabel;
@end
