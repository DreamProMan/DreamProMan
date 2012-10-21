//
//  landingComplete.m
//  Booking
//
//  Created by 赵将 zhaojiang on 12-10-16.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "landingComplete.h"
#import "Landing.h"

@implementation landingComplete
@synthesize AccountLable,Downdele;
@synthesize landing,acctext,passtext;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}


- (IBAction)cancellation:(id)sender {
    
    UIAlertView * registerAler = [[UIAlertView alloc]initWithTitle:@"确定要注销么" message:nil delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    
    [registerAler show];
   
  

}
- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    
   [self.navigationController popToRootViewControllerAnimated:YES];
    
}



#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    DownMananger * down = [[DownMananger alloc]initWithdelegate:self];
    
   
    [down DownuserID:acctext upass:passtext];
    
    // Do any additional setup after loading the view from its nib.
}
-(void)OnGetDownResult:(NSString *)result
{
  
    AccountLable.text=result;
    
    
}
- (void)viewDidUnload
{
    [self setAccountLable:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)dealloc {
    [AccountLable release];
    [super dealloc];
}
@end
