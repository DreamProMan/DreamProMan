//
//  DownMananger.m
//  Booking
//
//  Created by 赵将 zhaojiang on 12-10-17.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "DownMananger.h"

@implementation DownMananger
@synthesize downDele,downInforDele;

-(id)initWithdelegate:(id<DownDelegate>)delegate
{


        self=[super init];
        if (self) {
            self.downDele=delegate;
            DownInformation * downInfo = [[DownInformation alloc]init];
            downInfo.connection=self;
            self.downInforDele=downInfo;
            
        }
 
    return self;
}
-(void)didFinishConnect:(ASIHTTPRequest *)request
{
    NSString *response = [[NSString alloc]initWithData:request.responseData encoding:NSUTF8StringEncoding];
    NSLog(@"%@",[[NSString alloc] initWithData:request.rawResponseData encoding:NSUTF8StringEncoding ]);
    
    NSString * XMLarray;
    
    XMLarray=[[SearchResultXML XMLWtihGDataForDownResult:response] retain];
    
    [self.downDele OnGetDownResult:XMLarray];
    
}
//下载用户信息
-(void)DownuserID:(NSString*)userID upass:(NSString*)upass
{
    [self.downInforDele DownuserID:userID upass:upass];
    

}
@end
