//
//  CommonBookViewController.m
//  Booking
//
//  Created by Ibokan 王龙祥 on 12-10-16.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "CommonBookViewController.h"
#import "MovieInfoView.h"
BOOL butonState[];
@implementation CommonBookViewController
@synthesize priceLabel;
@synthesize ImageView;
@synthesize mySegment;
@synthesize MovieNameLabel;
@synthesize CinemaLabel;
@synthesize myScrollView;
@synthesize infoDic;
@synthesize sManager;
@synthesize date;
@synthesize showArray;
@synthesize buttonArray;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (IBAction)DateChange:(id)sender {
    for (UIView*view in self.myScrollView.subviews) {
        [view removeFromSuperview];
    }
    NSLog(@"%@",[self.mySegment titleForSegmentAtIndex:self.mySegment.selectedSegmentIndex]);
     NSLog(@"%@",[infoDic objectForKey:@"cinemaID"]);
     NSLog(@"%@",[infoDic objectForKey:@"movieID"]);
    
      [sManager SearchInfoOfMoviewShowWithCinemaNumber:[infoDic objectForKey:@"cinemaID"] andMOvieNumber:[infoDic objectForKey:@"movieID"]  date:[self.mySegment titleForSegmentAtIndex:self.mySegment.selectedSegmentIndex]];
    
    
}
- (IBAction)returnVC:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle
-(void)initUI
{
    self.showArray=[[NSMutableArray alloc]init];
    self.sManager=[[SearchManager alloc]initWithdelegate:self];
    self.buttonArray=[[NSMutableArray alloc]init];
     self.ImageView.userInteractionEnabled=YES;
    self.myScrollView=[[UIScrollView alloc] initWithFrame:CGRectMake(0,0, 320, 346)];
    [myScrollView setContentSize:CGSizeMake(0,500)];
    
    [self.ImageView addSubview:myScrollView];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initUI];
   
    
      NSDateFormatter *df = [[[NSDateFormatter alloc] init] autorelease];
    df.dateStyle = NSDateFormatterShortStyle;
    df.dateFormat = @"YYYY-MM-dd";
    
    self.date=[df stringFromDate:[NSDate date]];
    
    for (int i=0; i<3; i++) {
        int day=[[self.date substringFromIndex:8]intValue];
        
        NSString*str=[NSString stringWithFormat:@"%@%d",[self.date substringToIndex:8],day+i];
        [self.mySegment setTitle:str forSegmentAtIndex:i];
    }
   
    

    
    [sManager SearchInfoOfMoviewShowWithCinemaNumber:[infoDic objectForKey:@"cinemaID"] andMOvieNumber:[infoDic objectForKey:@"movieID"]  date:date];
    
      
    self.MovieNameLabel.text=[self.infoDic objectForKey:@"movieName"];
    self.CinemaLabel.text=[self.infoDic objectForKey:@"cinemaName"];
    // Do any additional setup after loading the view from its nib.
    self.myScrollView.backgroundColor=[UIColor clearColor];
    
   }
-(void)buttonFlip:(id)sender
{
    int tag=((UIButton*)sender).tag;
    if (butonState[tag]) {
       
        for (int j=0; j<myScrollView.subviews.count; j++) {
                      butonState[tag]=NO;
            butonState[tag]=NO;
            [(UIButton*)sender setImage:[UIImage imageNamed:@"时间背景副本1"] forState:UIControlStateNormal];
       
        return;
        }
    }
   butonState[tag]=YES;
    [(UIButton*)sender setImage:[UIImage imageNamed:@"时间背景(1).png"] forState:UIControlStateNormal];
    
}
-(void)OnGetInfoOfMoviewShowResult:(NSArray *)result
{
    for (MovieShowInfo *showInfo in result) {
        [self.showArray addObject:showInfo];
    }
    UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 55, 39)];
    label.backgroundColor=[UIColor clearColor];
    label.font=[UIFont fontWithName:@"DBLCDTempBlack" size:13];
    label.textColor=[UIColor whiteColor];
    
    label.text= [NSString stringWithFormat:@"%u",showArray.count];   
    [self.myScrollView addSubview:label];
    butonState[showArray.count]=YES;
    for (int i=0; i<showArray.count; i++) {
        
        UIButton *button=[[UIButton alloc]initWithFrame:CGRectMake(105*(i%3), 50+(i/3)*40, 110, 39)];
        button.tag=i+1;
        [button setImage:[UIImage imageNamed:@"时间背景(1).png"] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(buttonFlip:) forControlEvents:UIControlEventTouchDown];
        
       
        UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(40, 0, 60, 39)];
        label.backgroundColor=[UIColor clearColor];
        label.font=[UIFont fontWithName:@"DBLCDTempBlack" size:13];
        label.textColor=[UIColor whiteColor];
        
        label.text=  [((MovieShowInfo*)[showArray objectAtIndex:i]).filmTime substringFromIndex:11];
        [button addSubview:label];
        [self.myScrollView addSubview:button];
        [self.buttonArray addObject:button];
    }
}

-(void)OnGetAllOfMovieInfoResult:(NSArray *)result
{
    for (MovieInfo*info in result) {
        if ([info.movieID isEqualToString:[self.infoDic objectForKey:@"movieName"]]) {
             [sManager SearchInfoOfMoviewShowWithCinemaNumber:[infoDic objectForKey:@"cinemaID"] andMOvieNumber:[infoDic objectForKey:@"movieID"]  date:date];
            
        }
    }
    
}
- (void)viewDidUnload
{
    [self setMovieNameLabel:nil];
    [self setCinemaLabel:nil];

    [self setMyScrollView:nil];
    [self setMySegment:nil];
    [self setPriceLabel:nil];
    [self setImageView:nil];
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
    [MovieNameLabel release];
    [CinemaLabel release];

    [myScrollView release];
    [mySegment release];
    [priceLabel release];
    [ImageView release];
    [super dealloc];
}
@end
