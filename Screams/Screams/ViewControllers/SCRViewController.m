//
//  SCRViewController.m
//  Screams
//
//  Created by Administrator on 7/29/14.
//  Copyright (c) 2014 SCR. All rights reserved.
//

#import "SCRViewController.h"
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0x00FF00) >> 8))/255.0 blue:((float)(rgbValue & 0x0000FF))/255.0 alpha:1.0]

#define UI_COLOR_MEDIUM_GREY UIColorFromRGB(0x9B9EA3)
#define UI_COLOR_PLACEHOLDER_TEXT UIColorFromRGB(0xFFFFFF)
@interface SCRViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *screamsLogo;
@property (weak, nonatomic) IBOutlet UIView *viewContainer;
@property (weak, nonatomic) IBOutlet UIView *controlsContainer;
@property (weak, nonatomic) IBOutlet UITextField *emailIdField;
@end

@implementation SCRViewController
CGPoint screamsLogoCenter;
CGRect viewContainerFrame;
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
    [self customizeUI];
}

-(void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self hideOtherControls];
}

-(void) viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self presentOtherControlsWithAnimation:YES];
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/*
- (BOOL)prefersStatusBarHidden {
    return YES;
}
*/
#pragma mark -
#pragma mark UISetup

/** @brief Customize UI controls on load.
 *
 *  @param NoParams.
 *  @return void.
 **/
-(void)customizeUI
{
    _emailIdField.layer.borderColor=UI_COLOR_PLACEHOLDER_TEXT.CGColor;
    _emailIdField.layer.borderWidth=1.0;
    
   // _emailIdField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Email Address here." attributes:@{NSForegroundColorAttributeName: UI_COLOR_MEDIUM_GREY}];
}



/** @brief Present other controls and move logo up with animation.
 *
 *  @param NoParams.
 *  @return void.
 **/
-(void)presentOtherControlsWithAnimation:(BOOL) animate
{

    
    [UIView animateWithDuration:1.0f
                          delay:1.0f
                        options:UIViewAnimationOptionTransitionNone animations:^{
                            self.viewContainer.frame = viewContainerFrame;
                            
                            
                        }
                     completion:nil];
    
    [UIView animateWithDuration:1.0f delay:1.5f options:UIViewAnimationOptionBeginFromCurrentState animations:^{
        _controlsContainer.alpha=1;
        
    }completion:^(BOOL finished){
        _controlsContainer.hidden=NO;
        
    }];
}
/** @brief Hide other controls and move logo to center.
 *
 *  @param NoParams.
 *  @return void.
 **/
-(void)hideOtherControls
{
    //screamsLogoCenter=CGPointMake(160, 0);
    
    viewContainerFrame = self.viewContainer.frame;
    float originY = self.view.center.y - (_screamsLogo.frame.size.height/2);
   
    self.viewContainer.frame= CGRectMake(viewContainerFrame.origin.x, originY, viewContainerFrame.size.width,viewContainerFrame.size.height);
    
    _controlsContainer.alpha=0;
    _controlsContainer.hidden=NO;
 }

#pragma mark - TextFieldDelegates

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if(textField==self.emailIdField)
    {
        //START SCREAMING
        [_emailIdField resignFirstResponder];
    }
    return YES;
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    if(textField==self.emailIdField )
    {
        //START SCREAMING ENABLE
    }

    return YES;
}
#pragma mark - Touches Control

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    if(_emailIdField.isFirstResponder)
    {
        [_emailIdField resignFirstResponder];
    }
    
}
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesEnded:touches withEvent:event];
}


@end
