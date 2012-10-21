//
//  LandingInterface.m
//  Booking
//
//  Created by 赵将 zhaojiang on 12-10-15.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "LandingInterface.h"
#import "Landing.h"

@implementation LandingInterface
@synthesize AccountFiled;
@synthesize PassWordFiled,aletext=_aletext;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (IBAction)fanhui:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];    
    
}


- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{

    
    if([alertView.title isEqualToString:@"欢迎使用本客户端,谢谢!"])
    {
        landingComplete * lancom = [landingComplete new];
        // [self presentModalViewController:lancom animated:YES];
        //[self dismissModalViewControllerAnimated:YES];
        lancom.acctext=AccountFiled.text;
        lancom.passtext=PassWordFiled.text;
        [self.navigationController pushViewController:lancom animated:YES];
        
        
        NSLog(@"%p",self);
    }
    
    

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
    AccountFiled.delegate=self;
    PassWordFiled.delegate=self;
   [AccountFiled becomeFirstResponder];
    
    PassWordFiled.secureTextEntry=YES;
   
    
    //AccountFiled.editing=YES;
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)lanDign:(id)sender {
    
    
    if([AccountFiled.text isEqualToString:@""])
    {
        [self OnGetLoginResult:@"账号不能为空"];
        return;
    }
    if([PassWordFiled.text isEqualToString:@""])
    {
        [self OnGetLoginResult:@"密码不能为空"];
        return;
    }
    LoginManager * loMan= [[LoginManager alloc]initWithdelegate:self];
    
    [loMan loaduserID:AccountFiled.text upass:PassWordFiled.text];
    

    
 
   
 
}

-(void)OnGetLoginResult:(NSString *)result
{
    
    UIAlertView * registerAler = [[UIAlertView alloc]initWithTitle:result message:nil delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    
    [registerAler show];

}

- (void)viewDidUnload
{
    [self setAccountFiled:nil];
    [self setPassWordFiled:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
    
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [AccountFiled resignFirstResponder];
    [PassWordFiled resignFirstResponder];
    

}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)dealloc {
    [AccountFiled release];
    [PassWordFiled release];
    [super dealloc];
}
@end
