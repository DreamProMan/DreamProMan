//
//  BookingViewController.h
//  Booking
//
//  Created by Ibokan on 12-10-16.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SearchManager.h"
#import "CommonBookViewController.h"


@interface BookingViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,SearchDelegate>
@property(retain,nonatomic) NSMutableArray*noEmptyZone;
@property (retain,nonatomic)NSMutableDictionary*cinemaList;
@property (retain, nonatomic) IBOutlet UITableView *mytableView;
@property (copy,nonatomic)NSString * movieID;
@property (retain, nonatomic) IBOutlet UILabel *movieName;
@property (copy,nonatomic)NSString * cityName;
@property (copy,nonatomic)NSString * movieNAME;
@property (retain,nonatomic)SearchManager*search;
@end
