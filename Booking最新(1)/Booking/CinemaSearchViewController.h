//
//  CinemaSearchViewController.h
//  Booking
//
//  Created by Ibokan 王龙祥 on 12-10-7.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CityViewController.h"
#import "StaticArea.h"
#import "SearchManager.h"
#import "DataBase.h"
#import "Cinema.h"
#import "CinemainfoViewController.h"
@interface CinemaSearchViewController : UIViewController<CityListViewControllerProtocol,UITableViewDelegate,UITableViewDataSource,SearchDelegate>
@property (retain, nonatomic) IBOutlet UITableView *tableview;
@property (retain, nonatomic) IBOutlet UILabel *cityLabel;
@property (retain, nonatomic) NSMutableArray * zone;
@property (retain, nonatomic) NSMutableDictionary * cinemaList;
@property (retain , nonatomic)NSMutableArray* noEmptyCity;
@property (retain , nonatomic)NSMutableArray* noEmptyZone;
@property (retain ,nonatomic)SearchManager *Search;
@property (retain,nonatomic)NSString * celltxt;
@property(retain,nonatomic)NSString * cinemaadd;
@property(retain,nonatomic)NSString * cinematel;
@property(retain,nonatomic)NSString * cinemaId;

@end
