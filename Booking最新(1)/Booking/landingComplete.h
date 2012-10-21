//
//  landingComplete.h
//  Booking
//
//  Created by 赵将 zhaojiang on 12-10-16.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LandingInterface.h"
@class LandingInterface;
#import "DownMananger.h"
#import "DownDelegate.h"

@interface landingComplete : UIViewController<DownDelegate>

@property (retain, nonatomic) IBOutlet UILabel *AccountLable;
@property (assign,nonatomic)LandingInterface * landing ;
@property (assign,nonatomic)id<DownDelegate>Downdele;
@property (assign,nonatomic)NSString * acctext;
@property (assign,nonatomic)NSString * passtext;

-(id)initWithDelegate:(id<DownDelegate>)delegete;
@end
