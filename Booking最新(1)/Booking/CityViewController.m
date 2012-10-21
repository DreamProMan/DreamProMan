//
//  CityListViewController.m
//
//  Created by Big Watermelon on 11-11-10.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "CityViewController.h"


@implementation CityViewController
@synthesize tbView;

#define CHECK_TAG 1110

@synthesize cities, keys, checkImgView, curSection, curRow, delegate;
@synthesize defaultSelectionRow, defaultSelectionSection;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)dealloc
{
    [super dealloc];
    [tbView release];
    
    [cities release];
    [keys release];
    [checkImgView release];
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
    UIImageView * Imav=[[UIImageView alloc]initWithImage:[UIImage imageNamed: @"背景副本.png"]];
    Imav.frame=CGRectMake(0, 0, 320, 460);
    [self.view insertSubview:Imav atIndex:0];
    curRow = NSNotFound;    
    tbView.backgroundColor=[UIColor clearColor];
    
    //tbView.sectionIndexColor = [UIColor redColor];
    //tbView.separatorStyle=UITableViewCellSeparatorStyleSingleLineEtched;
    
    self.checkImgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"check"]];
    checkImgView.tag = CHECK_TAG;
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    NSString *path=[[NSBundle mainBundle] pathForResource:@"citydict"   
                                                   ofType:@"plist"]; 
    self.cities = [[NSDictionary alloc]   
                   initWithContentsOfFile:path];
    
    self.keys = [[cities allKeys] sortedArrayUsingSelector:  
                 @selector(compare:)]; 
    
    
    //get default selection from delegate
    // NSString* defaultCity = [delegate getDefaultCity];
    // if (defaultCity) {
    NSArray *citySection;
    self.defaultSelectionRow = NSNotFound;
    
    //set table index to this city if it existed
    for (NSString* key in keys) {
        citySection = [cities objectForKey:key];
        //      self.defaultSelectionRow = [citySection indexOfObject:defaultCity];
        if (NSNotFound == defaultSelectionRow)
            continue;
        //found match recoard position
        self.defaultSelectionSection = [keys indexOfObject:key];
        break;
    }
    
    if (NSNotFound != defaultSelectionRow) {
        
        self.curSection = defaultSelectionSection;
        self.curRow = defaultSelectionRow;
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:defaultSelectionRow inSection:defaultSelectionSection];
        [self.tbView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionMiddle animated:YES];
        
    }
    
    tbView.delegate=self;
    tbView.dataSource=self;
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    self.keys = nil;
    self.cities = nil;
    self.checkImgView = nil;
    self.tbView = nil;
}
//
//- (void)viewWillAppear:(BOOL)animated
//{
//    [super viewWillAppear:animated];
//}
//
//- (void)viewDidAppear:(BOOL)animated
//{
//    [super viewDidAppear:animated];
//}
//
//- (void)viewWillDisappear:(BOOL)animated
//{
//    [super viewWillDisappear:animated];
//}
//
//- (void)viewDidDisappear:(BOOL)animated
//{
//    [super viewDidDisappear:animated];
//}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return [keys count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    NSString *key = [keys objectAtIndex:section];  
    NSArray *citySection = [cities objectForKey:key];
    return [citySection count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    NSString *key = [keys objectAtIndex:indexPath.section];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    } 
       
    
    cell.textLabel.font = [UIFont systemFontOfSize:15];
    cell.textLabel.text = [[cities objectForKey:key] objectAtIndex:indexPath.row];
    cell.textLabel.textColor=[UIColor whiteColor];
   
    UIImageView * selectColor = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"tebleBAR111.png"]];
    selectColor.frame= cell.frame;
       cell.selectedBackgroundView = selectColor;
    // cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if (indexPath.section == curSection && indexPath.row == curRow)
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    else
        cell.accessoryType = UITableViewCellAccessoryNone;
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{  
    NSString *key = [keys objectAtIndex:section];  
    return key;  
}  

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView  
{  
    return keys;  
} 


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self dismissModalViewControllerAnimated:YES];
    //clear previous
    NSIndexPath *prevIndexPath = [NSIndexPath indexPathForRow:curRow inSection:curSection];
    UITableViewCell* cell = [tableView cellForRowAtIndexPath:prevIndexPath];
    //cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
    
    curSection = indexPath.section;
    
    curRow = indexPath.row;
    
    //add new check mark
    cell = [tableView cellForRowAtIndexPath:indexPath];
     [self.delegate citySelectionUpdate: [[cities objectForKey: [keys objectAtIndex:curSection]] objectAtIndex:curRow]];
    // cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section;
{
    UIImageView *imagv=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"tebleBAR背景.png"]];
    imagv.frame=CGRectMake(0, 0, 320, 20);
    UILabel * v = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 320, 20)];
    
    v .backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.3];
    v.text= [NSString stringWithFormat:@"   %@",[keys objectAtIndex:section]];
    v.font=[UIFont systemFontOfSize:15];
    v.textColor=[UIColor whiteColor];
    [imagv addSubview:v];
    [v release];
    return [imagv autorelease];
}
- (IBAction)pressReturn:(id)sender {
    //notify delegate user selection if it different with default
    if (curRow != NSNotFound) {
        NSString* key = [keys objectAtIndex:curSection];
        [delegate citySelectionUpdate:[[cities objectForKey:key] objectAtIndex:curRow]];
    }
    
    [self dismissModalViewControllerAnimated:YES];
}
@end
