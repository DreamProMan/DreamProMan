
//
//  LoginManager.m
//  Booking
//
//  Created by Ibokan 王龙祥 on 12-9-30.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "LoginManager.h"

@implementation LoginManager
@synthesize Logindele,LoginResultDelegate;

-(id)initWithdelegate:(id<LoginDelegate>)delegate
{
    self=[super init];
    if (self) {
        self.LoginResultDelegate=delegate;
      Login*log =[[Login alloc]init];
        log.ConnectionDele= self;
        self.Logindele=log;
    }
    return self;
}
//登陆
-(void)loaduserID:(NSString*)userID upass:(NSString*)upass
{
    [self.Logindele loaduserID:userID upass:upass];
}

-(void)didFinishConnect:(ASIHTTPRequest *)request
{
    NSString *response = [[NSString alloc ]initWithData:request.responseData encoding:NSUTF8StringEncoding];
      NSLog(@"%@",[[NSString alloc] initWithData:request.rawResponseData encoding:NSUTF8StringEncoding ]);
    
    NSString * XMLstring;
    
        XMLstring=[[SearchResultXML XMLWithGDataForLoginResult:response] retain];
        
        [self.LoginResultDelegate OnGetLoginResult:XMLstring];
        
}


@end
