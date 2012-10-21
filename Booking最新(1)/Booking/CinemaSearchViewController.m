//
//  CinemaSearchViewController.m
//  Booking
//
//  Created by Ibokan 王龙祥 on 12-10-7.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "CinemaSearchViewController.h"

@implementation CinemaSearchViewController
@synthesize tableview;
@synthesize cityLabel;
@synthesize zone;
@synthesize cinemaList;
@synthesize noEmptyZone;
@synthesize Search;
@synthesize noEmptyCity;
@synthesize celltxt=_celltxt;
@synthesize cinemaadd=_cinemaadd;
@synthesize cinematel=_cinematel;
@synthesize cinemaId=_cinemaId;
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

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
  //  UINavigationController * nvc=[[UINavigationController alloc]initWithRootViewController:self];
    
    self.navigationController.navigationBarHidden = YES;
    CityViewController *city=[[CityViewController alloc]init];
    city.delegate=self;
    // Do any additional setup after loading the view from its nib.
    SearchManager *search=[[SearchManager alloc]initWithdelegate:self];
    [search SearchCinemaInAreaWithMovieNumber:nil andAera:self.cityLabel.text];
    
    //初始化cinemalist
    self.cinemaList=[[NSMutableDictionary alloc]init];
    self.noEmptyZone=[[NSMutableArray alloc]init];
    self.noEmptyCity=[[NSMutableArray alloc]init];
//    DataBase *dataBase=[[DataBase alloc]init];
//    self.zone=[dataBase searchZoneInCity:[StaticArea CurrentCity]];
//    for (NSString*key in self.zone) {
//       
//        [cinemaList setObject:nil forKey:key];
//        }
  
    self.tableview.delegate=self;
    self.tableview.dataSource=self;
    self.tableview.backgroundColor=[UIColor clearColor]; 
    self.tableview.separatorColor=[UIColor colorWithRed:0.8 green:0.8 blue:0.8 alpha:0.4];
}
-(void)OnGetCinemaResult:(NSArray *)result
{  
    [noEmptyZone removeAllObjects];
    NSMutableSet *set=[[NSMutableSet alloc]init];
    NSMutableSet *setCity=[[NSMutableSet alloc]init];
    for (Cinema *cine in result) 
    {
       
          NSArray *arr=[cine.cinemaAddress componentsSeparatedByString:@"市"];
       // NSLog(@"%@",cine.cinemaAddress);
       // NSLog(@"%@",[arr objectAtIndex:0]);
        [setCity addObject:[arr objectAtIndex:0]];
        [set addObject:cine.cinemaDistrictName];
       }
    
    [noEmptyZone addObjectsFromArray:[set allObjects]];
    [noEmptyCity addObjectsFromArray:[setCity allObjects]];
    
    for (NSString*key in noEmptyZone) {
        NSMutableArray *array=[[NSMutableArray alloc]init];
        for (Cinema *cine in result)  {
            if ([cine.cinemaDistrictName isEqualToString:key]) {
                 [array addObject:cine];
            }
           
        }
        [cinemaList setObject:array forKey:key];
    }
    
    
    
    [self.tableview reloadData];
}
- (IBAction)ChangeCity:(id)sender {
    CityViewController * change = [[CityViewController alloc]init];
    [self presentModalViewController:change animated:YES];
   
    change.delegate = self;
    
    [change release];
}
-(void)citySelectionUpdate:(NSString *)selectedCity
{
    cityLabel.text=selectedCity;
    [StaticArea setCurrentCity:selectedCity];
    SearchManager *search=[[SearchManager alloc]initWithdelegate:self];
    [search SearchCinemaInAreaWithMovieNumber:nil andAera:self.cityLabel.text];
   
}
- (void)viewDidUnload
{
    [self setCityLabel:nil];
    
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}
-(void)viewWillAppear:(BOOL)animated
{
    cityLabel.text=[StaticArea CurrentCity];
   
    [Search SearchCinemaInAreaWithMovieNumber:nil andAera:cityLabel.text];
    
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return [noEmptyZone count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
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
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    } 
    
  
    cell.textLabel.font = [UIFont systemFontOfSize:15];
    cell.textLabel.text = ((Cinema*)[[cinemaList objectForKey:key] objectAtIndex:indexPath.row]).cinemaName;
//    self.celltxt = cell.textLabel.text;
//    self.cinemaadd = ((Cinema*)[[cinemaList objectForKey:key] objectAtIndex:indexPath.row]).cinemaAddress;
//    self.cinemaId = ((Cinema*)[[cinemaList objectForKey:key] objectAtIndex:indexPath.row]).cinemaID;
    cell.textLabel.textColor=[UIColor whiteColor];
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{  
    NSString *key = [noEmptyZone objectAtIndex:section];  
    return key;  
}  

//- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView  
//{  
//    return noEmptyZone;  
//} 


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self dismissModalViewControllerAnimated:YES];
    NSString *key = [noEmptyZone objectAtIndex:indexPath.section];
    self.celltxt = ((Cinema*)[[cinemaList objectForKey:key] objectAtIndex:indexPath.row]).cinemaName;
    self.cinemaadd = ((Cinema*)[[cinemaList objectForKey:key] objectAtIndex:indexPath.row]).cinemaAddress;
    self.cinemaId = ((Cinema*)[[cinemaList objectForKey:key] objectAtIndex:indexPath.row]).cinemaID;
    CinemainfoViewController * cinfo = [CinemainfoViewController new];
    //NSString *key = [noEmptyZone objectAtIndex:indexPath.section];
    cinfo.cinemainfo =self.celltxt;
    cinfo.cinemaadd = self.cinemaadd;
    cinfo.cinemaid = self.cinemaId;
    [self.navigationController pushViewController:cinfo animated:YES];
    
   
    //clear previous
//    NSIndexPath *prevIndexPath = [NSIndexPath indexPathForRow:curRow inSection:curSection];
//    UITableViewCell* cell = [tableView cellForRowAtIndexPath:prevIndexPath];
//    //cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
//    
//    curSection = indexPath.section;
//    
//    curRow = indexPath.row;
//    
//    //add new check mark
//    cell = [tableView cellForRowAtIndexPath:indexPath];
//    [self.delegate citySelectionUpdate: [[cities objectForKey: [keys objectAtIndex:curSection]] objectAtIndex:curRow]];
    // cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
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
//
- (void)dealloc {
    [cityLabel release];
    [tableview release];
    [super dealloc];
}
@end
