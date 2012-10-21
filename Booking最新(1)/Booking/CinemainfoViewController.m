//
//  CinemainfoViewController.m
//  Booking
//
//  Created by 张修的mac on 12-10-16.
//
//

#import "CinemainfoViewController.h"

@interface CinemainfoViewController ()

@end

@implementation CinemainfoViewController
@synthesize CinemaInfoLabel ,addbtn,phonebtn ,filmnamelabel,filmdurationlabel,buyBtn,filmDesc,cinemaAddLabel;
@synthesize cinemainfo=_cinemainfo,carousel=_carousel,search=_search,cinemaid=_cinemaid,resultarray,count,scrollview=_scrollview,filmbtn=_filmbtn,descview=_descview,filmdescLabel=_filmdescLabel,namelabel=_namelabel,filmcastlabel=_filmcastlabel,cinemaadd;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.resultarray = [[NSArray alloc]init];
    self.addbtn.titleLabel.text = self.cinemaadd;
    self.CinemaInfoLabel.text = self.cinemainfo;
        self.search=[[SearchManager alloc]initWithdelegate:self];
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
    NSString * daystring =[NSString stringWithFormat:@"%d-%d-%d",year,month,day];
    [self.search SearchAllOfMovieInfoWithCinemaNumber:self.cinemaid andshowDate:daystring];
    self.scrollview = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 30, 320, 135)];
    [self.view addSubview:self.scrollview];
    self.namelabel = [[UILabel alloc]initWithFrame:CGRectMake(15, 10, 250, 30)];
    self.namelabel.textColor = [UIColor whiteColor];
    self.namelabel.font = [UIFont systemFontOfSize:18];
    self.namelabel.backgroundColor = [UIColor clearColor];
    self.filmcastlabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 35, 250, 30)];
    self.filmcastlabel.textColor = [UIColor whiteColor];
    self.filmcastlabel.backgroundColor = [UIColor clearColor];
    self.filmcastlabel.font = [UIFont systemFontOfSize:13];
    self.filmcastlabel.textAlignment = UITextAlignmentRight;
    self.filmcastlabel.lineBreakMode = UILineBreakModeCharacterWrap;
    self.filmdescLabel.numberOfLines = 0;
    self.descview = [[UIView alloc]initWithFrame:CGRectMake(-550, 70, 220, 320)];
    self.descview.backgroundColor = [UIColor blackColor];
    [self.descview setAlpha:.8];
    self.filmdescLabel = [[UILabel alloc]initWithFrame:CGRectMake(4, 30, 280, 320)];
    self.filmdescLabel.backgroundColor = [UIColor clearColor];
    self.filmdescLabel.textColor = [UIColor whiteColor];
    self.filmdescLabel.font = [UIFont systemFontOfSize:14];
    self.filmdescLabel.textAlignment = UITextAlignmentCenter;
    self.filmdescLabel.lineBreakMode = UILineBreakModeCharacterWrap;
    self.filmdescLabel.numberOfLines = 0;
    [self.descview addSubview:self.namelabel];
    [self.descview addSubview:self.filmdescLabel];
    [self.descview addSubview:self.filmcastlabel];
    self.cinemaAddLabel.text = self.cinemaadd;
    self.cinemaAddLabel.textAlignment = UITextAlignmentCenter;
    self.cinemaAddLabel.lineBreakMode = UILineBreakModeCharacterWrap;
    self.filmdescLabel.numberOfLines = 0;
    
    //[self.view addSubview:self.descview];
    
}
//result为所有影院内的影片信息
-(void)OnGetAllOfMovieInfoResult:(NSArray *)result
{
    self.count = result.count;
    self.resultarray = result;
    for (int i =0; i<result.count; i++)
    {
        UIButton * filmbtn = [UIButton buttonWithType:UIButtonTypeCustom];
        filmbtn.tag = i+1;
        filmbtn.frame = CGRectMake(i*100, 7, 90, 120);
      
        UIImageView * img = [[UIImageView alloc]init];
        img.frame=CGRectMake(0, 0, 90, 120);
        [img setImageWithURL:[NSURL URLWithString:((MovieInfo*)[result objectAtIndex:i]).thumbnail]
                  placeholderImage:[UIImage imageNamed:@"loading_image@2x.png"]];
        [filmbtn addSubview:img];
        [self.scrollview addSubview:filmbtn];
        [filmbtn addTarget:self action:@selector(changeFilmName:)
          forControlEvents:UIControlEventTouchDown];
        
        self.filmnamelabel.text = ((MovieInfo*)[result objectAtIndex:0]).movieName;
        NSString * duration = [NSString stringWithFormat:@"%@分钟",((MovieInfo*)[result objectAtIndex:0]).duration];
        self.filmdurationlabel.text =duration  ;
        self.filmdescLabel.text = ((MovieInfo*)[self.resultarray objectAtIndex:0]).filmDesc;
        self.namelabel.text = ((MovieInfo*)[self.resultarray objectAtIndex:0]).movieName;
        NSString * cast = [NSString stringWithFormat:@"主演：%@",((MovieInfo*)[self.resultarray objectAtIndex:0]).cast];
        self.filmcastlabel.text = cast;
    }
    self.scrollview.contentSize = CGSizeMake(result.count*100, 120);
    self.scrollview.scrollEnabled = YES;
    [self.scrollview setBackgroundColor:[UIColor blackColor]];
    [self.view addSubview:self.scrollview];
}
-(void)changeFilmName:(UIButton*)sender
{
    
    self.filmnamelabel.text = ((MovieInfo*)[self.resultarray objectAtIndex:sender.tag-1]).movieName;
    NSString * duration = [NSString stringWithFormat:@"%@分钟",((MovieInfo*)[self.resultarray objectAtIndex:sender.tag-1]).duration];
    self.filmdurationlabel.text = duration;
    self.filmdescLabel.text = ((MovieInfo*)[self.resultarray objectAtIndex:sender.tag-1]).filmDesc;
    self.namelabel.text = ((MovieInfo*)[self.resultarray objectAtIndex:sender.tag-1]).movieName;
    NSString * cast = [NSString stringWithFormat:@"主演：%@",((MovieInfo*)[self.resultarray objectAtIndex:sender.tag-1]).cast];
    self.filmcastlabel.text = cast;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)filmDescAction:(id)sender
{
    //[self.descview becomeFirstResponder];
    //开始动画
    [UIView beginAnimations:nil context:@"move"];
    //设定动画时间
    [UIView setAnimationDuration:1];
    //动画的效果
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];//设定淡入淡出
    //动画内容
    self.descview.frame = CGRectMake(15,50, 290, 360);
    //完成（提交）动画
    [UIView commitAnimations];
    [self.view addSubview:self.descview];
    
}
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    self.descview.frame = CGRectMake(-500, 50, 270, 360) ;
}
- (IBAction)buyTicketAction:(id)sender {
}
- (IBAction)returnAction:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}



- (void)dealloc {
    // [_FilmNameLabel release];
    [CinemaInfoLabel release];
    //[_filmAddLabel release];
    //[_tableview release];
    [addbtn release];
    [phonebtn release];
    // [_scrollview release];
    [filmnamelabel release];
    [filmdurationlabel release];
    [buyBtn release];
    [filmDesc release];
    [cinemaAddLabel release];
    [super dealloc];
}
- (void)viewDidUnload {
    //[self setFilmAddLabel:nil];
    [self setCinemaInfoLabel:nil];
    // [self setFilmAddLabel:nil];
    //[self setTableview:nil];
    [self setAddbtn:nil];
    [self setPhonebtn:nil];
    //[self setScrollview:nil];
    [self setFilmnamelabel:nil];
    [self setFilmdurationlabel:nil];
    [self setBuyBtn:nil];
    [self setFilmDesc:nil];
    [self setCinemaAddLabel:nil];
    [super viewDidUnload];
}
@end
