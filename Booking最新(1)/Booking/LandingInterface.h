//
//  LandingInterface.h
//  Booking
//
//  Created by 赵将 zhaojiang on 12-10-15.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LoginManager.h"
#import "landingComplete.h"
#import "Landing.h"


@interface LandingInterface : UIViewController<UITextFieldDelegate,LoginDelegate>

@property (retain, nonatomic) IBOutlet UITextField *AccountFiled;
@property (retain, nonatomic) IBOutlet UITextField *PassWordFiled;


@property (copy,nonatomic)NSString * aletext;
-(id)initWithAletext:(NSString * )aletext;


@end
