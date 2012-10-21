//
//  registered.m
//  Booking
//
//  Created by 赵将 zhaojiang on 12-10-15.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "registered.h"

@implementation registered
@synthesize PhoneFiled;
@synthesize NameFiled;
@synthesize PassWordFiled;
@synthesize sureFiled;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (IBAction)fanhui:(id)sender {
    [self dismissModalViewControllerAnimated:YES];
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    
    [UIView setAnimationDelegate:self];
    
    
    self.view.frame=CGRectMake(0, 20, 320, 460);
    
    [UIView commitAnimations];
    return YES;

}
-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
   
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    
    [UIView setAnimationDelegate:self];
    
    
    self.view.frame=CGRectMake(0, -40, 320, 460);
    
    [UIView commitAnimations];
    

    return YES;
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [PassWordFiled resignFirstResponder];
    [PhoneFiled resignFirstResponder];
    [NameFiled resignFirstResponder];
    [sureFiled resignFirstResponder];
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    
    [UIView setAnimationDelegate:self];
    
    
    self.view.frame=CGRectMake(0, 20, 320, 460);
    
    [UIView commitAnimations];
    

}

- (IBAction)SubmitRegistration:(id)sender {
    
    if([PassWordFiled.text isEqualToString:sureFiled.text])
    {
       
    }
    else
    { 
        NSLog(@"%@,%@",PassWordFiled.text,sureFiled.text);
        UIAlertView * registerAler = [[UIAlertView alloc]initWithTitle:@"两次密码输入不一致" message:nil delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        
        [registerAler show];
        return;
    
    }
    
    if([sureFiled.text isEqualToString:@""])
    {
        UIAlertView * registerAler = [[UIAlertView alloc]initWithTitle:@"确认密码不能为空" message:nil delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        
        [registerAler show];
        return;
    }

    Register * regis = [[Register alloc]init];
   
    
    [regis reguserID:NameFiled.text upass:PassWordFiled.text mod_num:PhoneFiled.text postcode:nil areaid:nil address:nil uname:nil email:nil delegate:self];
  
   
   //[self zhangxiu];
    
}
-(void)zhangxiu
{
    [self dismissModalViewControllerAnimated:YES];
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
 
    PhoneFiled.delegate=self;
  
    NameFiled.delegate=self;
 
    PassWordFiled.delegate=self;
 
    sureFiled.delegate=self;
    
    
  
    
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{

    [self setPhoneFiled:nil];
    [self setNameFiled:nil];
    [self setPassWordFiled:nil];
    [self setSureFiled:nil];
 
    
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
  
    [PhoneFiled release];
    [NameFiled release];
    [PassWordFiled release];
    [sureFiled release];
    [super dealloc];
}
@end
