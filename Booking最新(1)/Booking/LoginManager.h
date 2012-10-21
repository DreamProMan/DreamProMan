//
//  LoginManager.h
//  Booking
//
//  Created by Ibokan 王龙祥 on 12-9-30.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LoginDelegate.h"
@class Login;
#import "Login.h"
#import "Connectiondelegte.h"
#import "SearchResultXML.h"


@interface LoginManager : NSObject<Connectiondelegte>
@property (assign,nonatomic)Login *Logindele;
@property (assign,nonatomic)id<LoginDelegate>LoginResultDelegate;

-(id)initWithdelegate:(id<LoginDelegate>)delegate;

//登陆
-(void)loaduserID:(NSString*)userID upass:(NSString*)upass;

@end


