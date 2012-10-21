//
//  BookingViewController.m
//  Booking
//
//  Created by Ibokan on 12-10-16.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "BookingViewController.h"
#import "Cinema.h"
BOOL isExist;
@implementation BookingViewController
@synthesize mytableView;
@synthesize movieID;
@synthesize movieName;
@synthesize cityName;
@synthesize noEmptyZone;
@synthesize cinemaList;
@synthesize movieNAME;
@synthesize search;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) 
    {
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

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Do any additional setup after loading the view from its nib.
    self.noEmptyZone=[[NSMutableArray alloc]init];
    self.cinemaList=[[NSMutableDictionary alloc]init];
    //设置tableView的代理
    self.mytableView.dataSource = self;
    self.mytableView.delegate = self;
    self.mytableView.backgroundColor = [UIColor clearColor];
    self.mytableView.separatorColor = [UIColor colorWithRed:0.8 green:0.8 blue:0.8 alpha:0.4];
    self.movieName.text=self.movieNAME;
   self.search = [[SearchManager alloc]initWithdelegate:self];
    NSLog(@"%@",movieID);

    [search SearchCinemaInAreaWithMovieNumber:movieID andAera:cityName];
    

}

- (void)viewDidUnload
{
    
    
    [self setMytableView:nil];
        [self setMovieName:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}
-(void)OnGetCinemaResult:(NSArray *)result
{
    
        
     NSMutableSet *set=[[NSMutableSet alloc]init];
    
    for (Cinema *cine in result) 
    {
         
        [set addObject:cine.cinemaDistrictName];
    
    }
       [noEmptyZone addObjectsFromArray:[set allObjects]];
    for (NSString*key in noEmptyZone) 
    {
        NSMutableArray *array=[[NSMutableArray alloc]init];
        for (Cinema *cine in result)  
        {
            if ([cine.cinemaDistrictName isEqualToString:key])
            {

                    [array addObject:cine];

                
            }
            
        }
        [cinemaList setObject:array forKey:key];
    }
    
    [self.mytableView reloadData];
    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
#pragma mark TableView data source
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return noEmptyZone.count;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSString *key = [noEmptyZone objectAtIndex:section];  
    NSLog(@"%@",key);
    NSArray *cinemaarr = [cinemaList objectForKey:key];
    NSLog(@"%u",cinemaarr.count);
    return [cinemaarr count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    NSString *key = [noEmptyZone objectAtIndex:indexPath.section];
    
    UITableViewCell* cell;
    cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) 
    {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    } 
    
    
    cell.textLabel.font = [UIFont systemFontOfSize:15];
    cell.textLabel.text = ((Cinema*)[[cinemaList objectForKey:key] objectAtIndex:indexPath.row]).cinemaName;
    
    
    cell.textLabel.textColor=[UIColor whiteColor];
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{  
    NSString *key = [noEmptyZone objectAtIndex:section];  
    return key;  
}  

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section;
{
    UIImageView *imagv=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"tebleBAR背景.png"]];
    imagv.frame=CGRectMake(0, 0, 320, 20);
    UILabel * zoneLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 320, 20)];
    zoneLabel.textAlignment=UITextAlignmentCenter;
    zoneLabel .backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.3];
    zoneLabel.text= [NSString stringWithFormat:@"   %@",[noEmptyZone objectAtIndex:section]];
    zoneLabel.font=[UIFont systemFontOfSize:12];
    zoneLabel.textColor=[UIColor whiteColor];
    [imagv addSubview:zoneLabel];
    [zoneLabel release];
    return [imagv autorelease]; 
}

- (IBAction)PopVC:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)dealloc 
{
    [mytableView release];
    [movieName release];
    [super dealloc];
}

#pragma mark TableVier 的代理
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    CommonBookViewController *commonBookVC=[[CommonBookViewController alloc]init];
    commonBookVC.infoDic=[[NSMutableDictionary alloc]init];
     NSString *key = [noEmptyZone objectAtIndex:indexPath.section];
    [commonBookVC.infoDic setObject:movieName.text forKey:@"movieName"];
     [commonBookVC.infoDic setObject:movieID forKey:@"movieID"];
    [commonBookVC.infoDic setObject:((Cinema*)[[cinemaList objectForKey:key] objectAtIndex:indexPath.row]).cinemaName forKey:@"cinemaName"];
    [commonBookVC.infoDic setObject:((Cinema*)[[cinemaList objectForKey:key] objectAtIndex:indexPath.row]).cinemaID forKey:@"cinemaID"];
     
       [self.navigationController pushViewController:commonBookVC animated:YES];
    [commonBookVC release];
}


@end
