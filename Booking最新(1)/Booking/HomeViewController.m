
#define NUMBER_OF_ITEMS 4
#define ITEM_SPACING 350
#define USE_BUTTONS YES
#import "Cinema.h"
#import "SDImageCache.h"
#import "HomeViewController.h"
#import <QuartzCore/QuartzCore.h>

#import "CinemaSearchViewController.h"
#import "ASIDownloadCache.h"
BOOL isReofState[100];
int isLoad[100];
@implementation HomeViewController


@synthesize netLabel;
@synthesize cityLabel;
@synthesize TBViewOfInfo;
@synthesize LoadIyems;
@synthesize tableview=_tableview;
@synthesize carouseler;
@synthesize navItem;
@synthesize cityBTN;
@synthesize wrap;
@synthesize items;
@synthesize futureItems;
@synthesize dataPath;
@synthesize search;
@synthesize willCarousel;
@synthesize ReofView;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]))
    {
       

        
    }
    return self;
}
-(void)citySelectionUpdate:(NSString *)selectedCity
{
    cityLabel.text=selectedCity;
    [StaticArea setCurrentCity:selectedCity];
    
}
-(void)viewWillAppear:(BOOL)animated
{
    cityLabel.text=[StaticArea CurrentCity];
    
}
- (IBAction)cityChangeAction:(id)sender
{
    CityViewController * change = [[CityViewController alloc]init];
    [self presentModalViewController:change animated:YES];
    change.delegate = self;
    [change release];
}
- (IBAction)changeViewBtn:(id)sender
{
    [UIView beginAnimations:@"myanimations" context:self] ;
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    [UIView setAnimationDuration:0.5];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:self.carouseler  cache:YES];
    [UIView commitAnimations];
    if (![self.TBViewOfInfo superview]) {
        [self.carouseler addSubview:self.TBViewOfInfo];
       
    }
else
    {
        [self.TBViewOfInfo removeFromSuperview];
    }

}
-(void)flipImage:(int)index
{
 
    MovieInfo*info=[items objectAtIndex: index];//取信息

    //设置小图片
    UIImageView *thumbView=[[UIImageView alloc]initWithFrame: CGRectMake(10, 15,80 ,110)];
    [thumbView setImageWithURL:[NSURL URLWithString:info.thumbnail]
              placeholderImage:[UIImage imageNamed:@"loading_image@2x.png"]options:SDWebImageProgressiveDownload];
    
    
    UIView *viewReversr=[[UIView alloc]initWithFrame:CGRectMake(15, 35, 210, 380)];
    viewReversr.backgroundColor=[UIColor clearColor];
    
    
    UIImageView *imav=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"infoview.png"]];
    imav.frame=CGRectMake(0, 0, 210, 300);
    imav.userInteractionEnabled=YES;
    
    //设置反面效果
    MovieInfoView *infoView=[[MovieInfoView alloc] initWithFrame:CGRectMake(0, 0, 210, 300) movieID:((MovieInfo*)[items objectAtIndex:self.carouseler.currentItemIndex]).movieID cityName:cityLabel.text delegate:self AndmovieName:info.movieName duration:info.duration director:info.director cast:info.cast thumbnail:thumbView filmDate:info.filmDate filmClass:info.filmClass filmArea:info.filmArea filmDesc:info.filmDesc]; 

    infoView.backgroundColor=[UIColor clearColor];
    
   
    [imav addSubview:infoView];
    
    
    [viewReversr addSubview:imav];
    
    //翻转动画
    [UIView beginAnimations:@"myanimations" context:self] ;
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    [UIView setAnimationDuration:0.5];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:self.carouseler.currentItemView cache:YES];
    [UIView commitAnimations];
    BOOL isHave=NO;
    for (UIView*view in self.carouseler.currentItemView.subviews)
    {
        if (view.tag==100) {
            isHave=YES;
            [[self.carouseler.currentItemView viewWithTag:100] removeFromSuperview]; 
        }
    }
    
    if(isHave==NO)   {
     
        [self.carouseler.currentItemView addSubview:viewReversr];
        viewReversr.tag=100;
       
        }   
     }

- (void)dealloc
{
    [cityLabel release];
    [netLabel release];
    [super dealloc];
    [carouseler release];
    [navItem release];
	[items release];

   
    
}
- (IBAction)clearMemory:(id)sender 
{
    SDImageCache *dd=[[SDImageCache alloc]init];
    [dd clearDisk];
    [dd clearMemory];
    
     
}
-(NSString*)getPath:(NSString *)fileName
{
    NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)objectAtIndex:0];
    NSString *Path = [docPath stringByAppendingPathComponent:fileName];
    return Path;
    
}
#pragma mark -
#pragma mark View lifecycle


- (void)viewDidLoad
{
    
    [super viewDidLoad];
      
    for (int i=0; i<100; i++) {
        isLoad[i]=0;
    }
    
     self.items=[[NSMutableArray alloc]init];
     self.LoadIyems=[[NSMutableDictionary alloc]init];
 
   
  
    
    self.search=[[SearchManager alloc]initWithdelegate:self];
    [search SearchMovieInfoWithAll:YES];
  //  [search SearchCinemaInAreaWithMovieNumber:@"63026" andAera:@"北京"];
    //create carousel
	self.carouseler = [[iCarousel alloc] initWithFrame:CGRectMake(0, 65, 320, 380)];
	carouseler.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    carouseler.type = iCarouselTypeLinear;
	carouseler.delegate = self;
	carouseler.dataSource = self;
    [self.view addSubview:carouseler];
     for (int i=0; i<100; i++) {
        isReofState[i]=NO;
    
     }
    self.TBViewOfInfo = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 380)];
    self.TBViewOfInfo.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"背景副本.png"]];;
    self.tableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, 320, 380)];
    self.tableview.delegate = self;
    self.tableview.dataSource = self;
 self.tableview.backgroundColor=[UIColor clearColor]; 
    self.tableview.separatorColor=[UIColor colorWithRed:0.8 green:0.8 blue:0.8 alpha:0.4];
    [self.TBViewOfInfo addSubview:self.tableview];
    
       [StaticArea setCurrentCity:self.cityLabel.text];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [items count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 95.0f;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier = @"Cell";
    
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
   // if (cell == nil) {
      UITableViewCell *  cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
  //  }
    UIImageView * selectColor = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"tebleBAR111.png"]];
    selectColor.frame= cell.frame;
    
    cell.selectedBackgroundView = selectColor;
    MovieInfo *info=[items objectAtIndex:indexPath.row];

    for (UIView*view in cell.subviews) {
        [view removeFromSuperview];
    }
    UIImageView*imav=[[UIImageView alloc]initWithFrame:CGRectMake(10, 5,61 , 81)];  
    [imav setImageWithURL:[NSURL URLWithString:info.thumbnail] placeholderImage:[UIImage imageNamed:@"loading_image@2x.png"]options:SDWebImageProgressiveDownload ]; 
    [cell addSubview:imav];
    UILabel *movieName=[[UILabel alloc]initWithFrame:CGRectMake(15+61, 10, 200, 20)];
    movieName.backgroundColor=[UIColor clearColor];
    movieName.textColor=[UIColor whiteColor];
    movieName.font=[UIFont systemFontOfSize:15];
    movieName.text=info.movieName;
    [cell addSubview:movieName];
    
    UILabel *movieDate=[[UILabel alloc]initWithFrame:CGRectMake(15+61, 40, 200, 15)];
    movieDate.backgroundColor=[UIColor clearColor];
    movieDate.textColor=[UIColor colorWithRed:0.6 green:0.6 blue:0.6 alpha:1];
    movieDate.font=[UIFont systemFontOfSize:12];
    movieDate.text=[NSString stringWithFormat:@"上映日期: %@",info.filmDate];
    [cell addSubview:movieDate];
    
    UILabel *cast=[[UILabel alloc]initWithFrame:CGRectMake(15+61, 60, 200, 15)];
    cast.backgroundColor=[UIColor clearColor];
    cast.textColor=[UIColor colorWithRed:0.6 green:0.6 blue:0.6 alpha:1];
    cast.font=[UIFont systemFontOfSize:12];
    cast.text=[NSString stringWithFormat:@"主演: %@",info.cast];
    [cell addSubview:cast];
    
    
    UITextField * tiket=[[UITextField alloc]initWithFrame:CGRectMake(273, 15, 30, 20)];
    //tiket.userInteractionEnabled=NO;
    tiket.borderStyle=UITextBorderStyleLine;
    tiket.backgroundColor= [UIColor clearColor];
    tiket.text=@"订票";
    tiket.font=[UIFont systemFontOfSize:12];
    tiket.textColor=[UIColor colorWithRed:0.6 green:0.6 blue:0.6 alpha:1];
    [cell addSubview:tiket];
    
    UIButton*ticketButton=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 30, 20)];
    ticketButton.backgroundColor=[UIColor clearColor];
    [ticketButton addTarget:self action:@selector(xxx) forControlEvents:UIControlEventTouchDown];
    [tiket addSubview:ticketButton];
    
    return cell;
    
}


-(void)initCache
{
    NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    self.dataPath=[[paths objectAtIndex:0]stringByAppendingPathComponent:@"ImagePath"];
    if ([[NSFileManager defaultManager] fileExistsAtPath:dataPath])
    {
        return;
    } 
    NSError*error;
    if (![[NSFileManager defaultManager]createDirectoryAtPath:dataPath withIntermediateDirectories:NO attributes:nil error:&error ]) 
    {
        URLCacheAlertWithError(error);
        return;  
    }
}
-(void)initIMAGE
{
    [self.netLabel removeFromSuperview];
    //加载前三张
    for (int i=0; i<items.count%3; i++) {
        ASIHTTPRequest *arequest=[[ASIHTTPRequest alloc]initWithURL:[NSURL URLWithString:((MovieInfo*)[items objectAtIndex:i]).poster]];
        // [arequest setCacheStoragePolicy:ASICachePermanentlyCacheStoragePolicy|ASIAskServerIfModifiedWhenStaleCachePolicy];
        
        arequest.userInfo=[[NSMutableDictionary alloc]init ];
        [ arequest.userInfo setValue:((MovieInfo*)[items objectAtIndex:i]).poster forKey:@"Info"];
        // 设置request缓存的有效时间:
        //  [ arequest setSecondsToCache:60*60*24 ]; 
        // 缓存30天 可以判断数据是否从缓存读取:
        //  [ arequest didUseCachedResponse ];
        // [ arequest setDownloadDestinationPath:[[ ASIDownloadCache sharedCache ] pathToStoreCachedResponseDataForRequest:arequest ]];           
        [arequest setDelegate:self];
        
        [CommonQueue addRequest:arequest];
        [CommonQueue Go];
        
    }
   


}
- (IBAction)MovieChange:(id)sender 

{  [CommonQueue cancelAllOperations];
    
    if(LoadIyems.count==0)
{
    [search SearchMovieInfoWithAll:YES];
}
    
    [items removeAllObjects];
    
    NSString*pathout= [self getPath:@"showMovieInfo.plist"];
    NSString*pathshowNO=[self getPath:@"NOshowMovieInfo.plist"];
    NSMutableArray *movielist;
    NSLog(@"%d",((UISegmentedControl*)sender).selectedSegmentIndex);
    if (((UISegmentedControl*)sender).selectedSegmentIndex==0) 
    {
        
        movielist=[[NSMutableArray alloc]initWithContentsOfFile:pathout];
    }else
    {
        movielist=[[NSMutableArray alloc]initWithContentsOfFile:pathshowNO];
    }
    for (NSMutableDictionary*infodic in movielist) {
        
        MovieInfo*info=[[MovieInfo alloc]initWithMovieID:[infodic objectForKey:@"movieID"] movieName:[infodic objectForKey:@"movieName"] duration:[infodic objectForKey:@"duration"] director:[infodic objectForKey:@"director"] cast:[infodic objectForKey:@"cast"] thumbnail:[infodic objectForKey:@"thumbnail"] cachedThumbnail:nil poster:[infodic objectForKey:@"poster"] filmDate:[infodic objectForKey:@"filmDate"] filmClass:[infodic objectForKey:@"filmClass"] filmArea:[infodic objectForKey:@"filmArea"] filmDesc:[infodic objectForKey:@"filmDesc"] showCount:[infodic objectForKey:nil]];
        [self.items addObject:info];
    }
    if (((UISegmentedControl*)sender).selectedSegmentIndex==1){
        [self initIMAGE];
    }
    
    [self.tableview reloadData];
    
    [self.carouseler reloadData];
    
}

-(void)OnGetMovieInfoResult:(NSArray *)result
{ 

    
   
    NSString*pathout= [self getPath:@"showMovieInfo.plist"];
    NSString*pathshowNO=[self getPath:@"NOshowMovieInfo.plist"];
    //热门电影 与 即将上映电影 实体
    
   // self.movieList=[[NSMutableArray alloc]init];
    NSMutableArray * showInfo=[[NSMutableArray alloc]init];
    NSMutableArray * noshowInfo=[[NSMutableArray alloc]init];
    for (MovieInfo*info in result) {
        NSMutableDictionary * dic=[[NSMutableDictionary alloc]init];
        
        [dic setValue:info.movieID forKey:@"movieID"];
        [dic setObject:info.movieName forKey:@"movieName"];
        [dic setObject:info.duration forKey:@"duration"];
        [dic setObject:info.director forKey:@"director"];
        [dic setObject:info.cast forKey:@"cast"];
        [dic setObject:info.thumbnail forKey:@"thumbnail"];
        //  [dic setObject:info.cachedThumbnail forKey:@"cachedThumbnail"];
        [dic setObject:info.poster forKey:@"poster"];
        [dic setObject:info.filmDate forKey:@"filmDate"];
        [dic setObject:info.filmClass forKey:@"filmClass"];
        [dic setObject:info.filmArea forKey:@"filmArea"];
        [dic setObject:info.filmDesc forKey:@"filmDesc"];
        [LoadIyems setObject:[UIImage imageNamed:@"loading_image_big@2x.png"] forKey:info.poster];
        //预备写入文件
        if ([self Compare:info.filmDate]) {
           
            [showInfo addObject:dic];
            //程序刚运行，初始化已上映的
            [items addObject:info];
           
        }else
        {
            [noshowInfo addObject:dic];
            
        }
        
        
    }
   
    [showInfo writeToFile:pathout atomically:YES ];
    [noshowInfo writeToFile:pathshowNO atomically:YES];
     
      [self.carouseler reloadData];
 
//       [self.carousel performSelector:@selector(reloadData) withObject:nil afterDelay:1];
    [self performSelector:@selector(initIMAGE) withObject:nil afterDelay:1];
    
}

//判断是否上映
-(BOOL)Compare:(NSString *)Date
{
    //获得系统日期
    NSDate * senddate=[NSDate date];
    //    NSDateFormatter *dateformatter=[[NSDateFormatter alloc] init];
    //    [dateformatter setDateFormat:@"HH:mm"];
    //NSString * locationString=[dateformatter stringFromDate:senddate];
    NSCalendar * cal=[NSCalendar currentCalendar];
    NSUInteger unitFlags=NSDayCalendarUnit|NSMonthCalendarUnit|NSYearCalendarUnit;
    NSDateComponents * conponent= [cal components:unitFlags fromDate:senddate];
    NSInteger year=[conponent year];
    NSInteger month=[conponent month];
    NSInteger day=[conponent day];
    
    NSArray *arr=[[Date substringToIndex:10] componentsSeparatedByString:@"-"];
    NSLog(@"%@",[arr objectAtIndex:0]);
    NSInteger Getyear=[[arr objectAtIndex:0]intValue];
    NSInteger Getmonth=[[arr objectAtIndex:1]intValue];
    NSInteger Getday=[[arr objectAtIndex:2]intValue];
    if (year>Getyear) {
        return YES;
    }else if(year<Getyear)
    {
        return NO; 
    }else
    {
        if (month>Getmonth) {
            return YES;
        }else if(month<Getmonth)
        {
            return NO;
        }else 
        {
            if (day>Getday) {
                return YES;
            }else if(day<Getday)
            {
                return NO;
            }else
            {
                return YES;
            }
        }
    }    
    
}


-(void)OnGetCinemaResult:(NSArray *)result
{
    NSLog(@"%@",((Cinema*)[result objectAtIndex:0]).cinemaPhoto);
}
-(void)OnGetSeatResult:(NSArray *)result
{
    
}
- (void)viewDidUnload
{
    
    [self setCityLabel:nil];
    [self setNetLabel:nil];
    [super viewDidUnload];
    self.carouseler = nil;
    self.navItem = nil;
}
-(void)pushVC
{
    BookingViewController * bookVC = [[BookingViewController alloc]init];
    
    bookVC.movieID = ((MovieInfo*)[items objectAtIndex:self.carouseler.currentItemIndex]).movieID;
    bookVC.movieNAME=((MovieInfo*)[items objectAtIndex:self.carouseler.currentItemIndex]).movieName;
    
    NSLog(@"%@",bookVC.movieID);
    bookVC.cityName = cityLabel.text;
    [self.navigationController pushViewController:bookVC animated:YES];
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}
//- (BOOL)carouselShouldWrap:(iCarousel *)carousel
//{
//    //wrap all carousels
//    return YES;
//}

#pragma mark -
#pragma mark iCarousel methods

- (NSUInteger)numberOfItemsInCarousel:(iCarousel *)carousel
{
  
    
    return [items count];
    
}

- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSUInteger)index
{
    
   
    UIImageView*imav=[[UIImageView alloc]initWithFrame:CGRectMake(15, 35, 210, 300)];
    imav.image= [LoadIyems valueForKey: ((MovieInfo*)[items objectAtIndex:index]).poster];
    UIView *VI=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 240, 380)];
    [VI addSubview:imav];
    

    return VI;
}
//网络获取图片
- (void)requestFinished:(ASIHTTPRequest *)request
{
    UIImage *ima=[[UIImage alloc]initWithData: request.responseData];
    NSLog(@"%@",request.responseData);
 
            [LoadIyems setValue:ima forKey:[request.userInfo objectForKey:@"Info"]];
        
    
    [carouseler reloadData];
}
//缓存获取图片
//- (BOOL)isCachedDataCurrentForRequest:(ASIHTTPRequest *)request;
//{
//    UIImage *ima=[[UIImage alloc]initWithData: request.responseData];
//    
//    [LoadIyems setValue:ima forKey:[request.userInfo objectForKey:@"Info"]];
//    
//    
//    [carousel reloadData];
//    return YES;
//}
-(void)loadImage:(iCarousel*)carousel
{
    int currentindex=0;
    for (int i=0; i<3; i++) {
        currentindex=carousel.currentItemIndex+i-1;
        
        if (currentindex<0||currentindex>items.count-1||isLoad[currentindex]) 
        {
            continue; 
        }
        
        isLoad[currentindex]=1;
        ASIHTTPRequest *arequest=[[ASIHTTPRequest alloc]initWithURL:[NSURL URLWithString:((MovieInfo*)[items objectAtIndex:currentindex]).poster]];
      //  [ arequest
        // setCacheStoragePolicy:ASICachePermanentlyCacheStoragePolicy ];
        // [arequest setCacheStoragePolicy:ASIAskServerIfModifiedWhenStaleCachePolicy];
        // arequest.downloadCache=self;
       // [arequest setDownloadCache:[ASIDownloadCache sharedCache]];
        arequest.userInfo=[[NSMutableDictionary alloc]init ];
        // 设置request缓存的有效时间:
        //   [ arequest setSecondsToCache:60*60*24 ]; 
        // 缓存30天 可以判断数据是否从缓存读取:
        //  [ arequest didUseCachedResponse ];
        // [ arequest setDownloadDestinationPath:[[ ASIDownloadCache sharedCache ] pathToStoreCachedResponseDataForRequest:arequest ]];
        NSLog(@"\n*\n%@",arequest.downloadDestinationPath);
        [ arequest.userInfo setValue:((MovieInfo*)[items objectAtIndex:currentindex]).poster forKey:@"Info"];
        [arequest setDelegate:self];
        
        [CommonQueue addRequest:arequest];
        
        
    }
    

}

- (void)carouselDidEndDecelerating:(iCarousel *)carousel

{
   
    NSThread*thread=[[NSThread alloc]initWithTarget:self selector:@selector(loadImage:) object:carouseler];
    [thread start];

       
}
-(void)carouselDidEndDragging:(iCarousel *)carousel willDecelerate:(BOOL)decelerate
{
    
    NSThread*thread=[[NSThread alloc]initWithTarget:self selector:@selector(loadImage:) object:carouseler];
    [thread start];
  
}
- (void)carousel:(iCarousel *)_carousel didSelectItemAtIndex:(NSInteger)index
{
    
   
    if (index<0) {
        index=0;
    }
    if (index>((items.count-1))) {
        index=items.count;
            }
    NSLog(@"%d=====================",index);
	if (index == carouseler.currentItemIndex)
	{
        [self flipImage:index];
	}
	else
	{
        
        NSThread*thread=[[NSThread alloc]initWithTarget:self selector:@selector(loadImage:) object:carouseler];
        [thread start];
//        
//        if (!isLoad[index]) {
//          //  [CommonQueue cancelAllOperations];
//            
//            isLoad[index]=1;
//        ASIHTTPRequest *arequest=[[ASIHTTPRequest alloc]initWithURL:[NSURL URLWithString:((MovieInfo*)[items objectAtIndex:index]).poster]];
//    //[ arequest setCacheStoragePolicy:ASICachePermanentlyCacheStoragePolicy ];
//        // [arequest setCacheStoragePolicy:ASIAskServerIfModifiedWhenStaleCachePolicy];
//        // arequest.downloadCache=self;
//       // [arequest setDownloadCache:[ASIDownloadCache sharedCache]];
//        arequest.userInfo=[[NSMutableDictionary alloc]init ];
//        // 设置request缓存的有效时间:
//        //   [ arequest setSecondsToCache:60*60*24 ]; 
//        // 缓存30天 可以判断数据是否从缓存读取:
//        //  [ arequest didUseCachedResponse ];
//        // [ arequest setDownloadDestinationPath:[[ ASIDownloadCache sharedCache ] pathToStoreCachedResponseDataForRequest:arequest ]];
//       
//        [ arequest.userInfo setValue:((MovieInfo*)[items objectAtIndex:index]).poster forKey:@"Info"];
//        [arequest setDelegate:self];
//        
//        [CommonQueue addRequest:arequest];
//        } 
    }

}

@end
