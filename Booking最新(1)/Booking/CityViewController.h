//
//  CityListViewController.h
//  citylistdemo
//
//  Created by BW on 11-11-22.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface CityViewController : UIViewController<UITableViewDelegate,UITableViewDataSource> {
    NSDictionary *cities;  
    NSArray *keys;
    id delegate;
    UITableView *tbView;
}
@property (nonatomic, retain) IBOutlet UITableView *tbView;
@property (nonatomic, retain) UIImageView* checkImgView;
@property NSUInteger curSection;
@property NSUInteger curRow;
@property NSUInteger defaultSelectionRow;
@property NSUInteger defaultSelectionSection;
@property (nonatomic, retain) NSDictionary *cities;  
@property (nonatomic, retain) NSArray *keys;
@property (nonatomic, assign) id delegate;

- (IBAction)pressReturn:(id)sender;
@end

@protocol CityListViewControllerProtocol
- (void) citySelectionUpdate:(NSString*)selectedCity;
- (NSString*) getDefaultCity;
@end

