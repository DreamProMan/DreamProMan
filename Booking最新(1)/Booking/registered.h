//
//  registered.h
//  Booking
//
//  Created by 赵将 zhaojiang on 12-10-15.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Register.h"


@interface registered : UIViewController<UITextFieldDelegate>
@property (retain, nonatomic) IBOutlet UITextField *PhoneFiled;
@property (retain, nonatomic) IBOutlet UITextField *NameFiled;
@property (retain, nonatomic) IBOutlet UITextField *PassWordFiled;
@property (retain, nonatomic) IBOutlet UITextField *sureFiled;
-(void)zhangxiu;
@end
