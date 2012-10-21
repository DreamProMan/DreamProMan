//
//  Landing.m
//  Booking
//
//  Created by 赵将 zhaojiang on 12-10-15.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "Landing.h"
#import "LandingInterface.h"
#import "registered.h"


@implementation Landing
@synthesize landing;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (IBAction)landing:(id)sender {
    landing =[[LandingInterface alloc]init];
   
    
  //  UINavigationController *navi = [[UINavigationController alloc]initWithRootViewController:landing];
    
    
   // navi.navigationBarHidden = YES;
   
  //  [self presentModalViewController:landing animated:YES];    //[self presentModalViewController:landing animated:YES];
    
    [self.navigationController pushViewController:landing animated:YES];
    
}
- (IBAction)registered:(id)sender {
    registered * regist=[[registered alloc]init];
    [self presentModalViewController:regist animated:YES];
    
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
