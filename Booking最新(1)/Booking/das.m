//
//  das.m
//  Booking
//
//  Created by Ibokan 王龙祥 on 12-10-1.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "das.h"
#import "Cinema.h"
@implementation das

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (IBAction)dsdaf:(id)sender {
//    LoginManager *log=[[LoginManager alloc]initWithdelegate:self];
//    [log loaduserID:@"wang" upass:@"wang"];
    SearchManager*search=[[SearchManager alloc]initWithdelegate:self];
    [search SearchCinemaInAreaWithMovieNumber:nil andAera:@"北京"];
}
-(void)OnGetLoginResult:(NSString *)result
{
    NSLog(@"%@",result);
}
-(void)OnGetCinemaResult:(NSArray *)result
{
    NSLog(@"%@",result);
    Cinema*ci=[result objectAtIndex:0];
    NSLog(@"%@", ci.cinemaID);
    NSLog(@"%@",ci.cinemaAddress);
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
