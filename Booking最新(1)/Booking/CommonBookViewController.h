//
//  CommonBookViewController.h
//  Booking
//
//  Created by Ibokan 王龙祥 on 12-10-16.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SearchManager.h"
#import "MovieInfo.h"
#import "MovieShowInfo.h"
@interface CommonBookViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,SearchDelegate>
@property (retain,nonatomic) SearchManager*sManager;
@property (retain, nonatomic)  UILabel *priceLabel;
@property (retain, nonatomic) IBOutlet UIImageView *ImageView;
@property (retain, nonatomic) IBOutlet UISegmentedControl *mySegment;
@property (retain, nonatomic) IBOutlet UILabel *MovieNameLabel;
@property (retain, nonatomic) IBOutlet UILabel *CinemaLabel;
@property (retain, nonatomic)  UIScrollView *myScrollView;
@property (retain,nonatomic ) NSMutableDictionary * infoDic;
@property (copy,nonatomic) NSString*date;
@property (retain,nonatomic)NSMutableArray*showArray;
@property (retain,nonatomic)NSMutableArray*buttonArray;
-(void)initUI;
@end
