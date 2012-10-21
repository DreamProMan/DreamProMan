//
//  HomeViewController.h
//  Booking
//
//  Created by Ibokan 王龙祥 on 12-10-2.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "iCarousel.h"
#import "SearchManager.h"
#import "URLCacheAlert.h"
#import "SDWebImage/UIImageView+WebCache.h"
#import "AsyncImageView.h"
#import "SDWebImageDownloaderDelegate.h"
#import "CityViewController.h"
#import "StaticArea.h"
#import "ASIHTTPRequest.h"
#import "ASINetworkQueue.h"
#import "MovieInfoView.h"
#import "BookingViewController.h"
#import "CommonQueue.h"
@interface HomeViewController : UIViewController<iCarouselDelegate,iCarouselDataSource,SearchDelegate,SDWebImageDownloaderDelegate,CityListViewControllerProtocol,UITableViewDataSource,UITableViewDelegate,ASIHTTPRequestDelegate,push>
@property (retain, nonatomic) IBOutlet UILabel *netLabel;
@property (retain, nonatomic) IBOutlet UILabel *cityLabel;
@property (retain,nonatomic) NSMutableDictionary* LoadIyems;
@property (retain,nonatomic) UIView *ReofView;

@property (retain, nonatomic) UIView *TBViewOfInfo;
@property (retain, nonatomic) SearchManager *search;

@property (nonatomic, retain) iCarousel *carouseler;
@property (nonatomic, retain) iCarousel *willCarousel;
@property (nonatomic, retain) UINavigationItem *navItem;
@property (retain, nonatomic) IBOutlet UIButton *cityBTN;
@property (nonatomic, assign) BOOL wrap;
@property (nonatomic, retain) NSMutableArray *items;
@property (nonatomic, retain) NSMutableArray *futureItems;
@property (nonatomic, copy) NSString * dataPath;



@property(nonatomic,retain)UITableView * tableview;
-(void)pushVC;
-(void)MovieChange;
-(void)flipImage:(int)index;
-(NSString*)getPath:(NSString*)fileName;
-(BOOL)Compare:(NSString *)Date;
@end
