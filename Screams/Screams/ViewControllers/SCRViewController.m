//
//  SCRViewController.m
//  Screams
//
//  Created by Administrator on 7/29/14.
//  Copyright (c) 2014 SCR. All rights reserved.
//

#import "SCRViewController.h"

#import "SCRMacroDefinitions.h"
#import "SCRAvatarsViewController.h"

@interface SCRViewController () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *screamsLogo;
@property (weak, nonatomic) IBOutlet UIView *viewContainer;
@property (weak, nonatomic) IBOutlet UIView *controlsContainer;
@property (weak, nonatomic) IBOutlet UITextField *emailIdField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property (weak, nonatomic) IBOutlet UIButton *screamInButton;
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
    self.emailIdField.delegate = self;
    self.passwordField.delegate= self;
}

-(void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self hideOtherControls];
    if(!IS_IPHONE_4Inch)
    {
        [self subscribeKeyboardNotifications];
    }
}

-(void) viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    if(!IS_IPHONE_4Inch)
    {
        [self unSubscribeKeyboardNotifications];
    }
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
    _emailIdField.layer.borderColor= UI_COLOR_PLACEHOLDER_TEXT.CGColor;
    _emailIdField.layer.borderWidth=1.0;
    _passwordField.layer.borderColor=UI_COLOR_PLACEHOLDER_TEXT.CGColor;
    _passwordField.layer.borderWidth=1.0;
    
    _screamInButton.backgroundColor = UI_COLOR_SCREAMIN_BUTTON1;
    
    [self screamInButtonSetEnabled:NO];
    
}

/** @brief Enable or Disable ScreamIn Button.
 *
 *  @param isEnable bool value YES- enable, NO- disable.
 *  @return void.
 **/

-(void) screamInButtonSetEnabled:(BOOL) isEnable
{
    if(isEnable)
    {
        _screamInButton.titleLabel.textColor = [UIColor whiteColor];
    }
    else
    {
        _screamInButton.titleLabel.textColor = [UIColor grayColor];
    }
    _screamInButton.enabled = isEnable;
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
         [self customizeUI];
        
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


- (IBAction)onScreamIn:(UIButton *)sender
{
    NSString *emailFieldText = [_emailIdField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    NSString *passwordFieldText = [_passwordField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    
    if( emailFieldText.length >0 && passwordFieldText.length>0)
    {
        NSLog(@"Start Screaming in");
        
        //MOVE THIS TO SUCCESS LATER
        SCRAvatarsViewController *avatarViewController = [[SCRAvatarsViewController alloc] initWithNibName:@"SCRAvatarsViewController" bundle:[NSBundle mainBundle]];
        [self presentViewController:avatarViewController animated:YES completion:nil];
        
        
    }
    else
    {
        //validation
        //if( emailFieldText.length == 0)
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Invalid Input"
                                                        message:[NSString stringWithFormat:@"Looks like you specified wrong input." ]
                                                       delegate:self
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
            [alert show];
            return;
        }
       // else if(passwordFieldText.length>0)
        {
        
        }
    }
        
    
    
}

#pragma mark - TextFieldDelegates

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if(textField==self.emailIdField)
    {
        
        [_passwordField becomeFirstResponder];
    }
    else if(textField == self.passwordField)
    {
        [_passwordField resignFirstResponder];
          //START SCREAMING
    }
    return YES;
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
       return YES;
}
-(BOOL) textFieldShouldClear:(UITextField *)textField
{

    [self screamInButtonSetEnabled:NO];
    return YES;
}
-(BOOL) textFieldShouldEndEditing:(UITextField *)textField
{
    NSString *emailFieldText = [_emailIdField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    NSString *passwordFieldText = [_passwordField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    
    if( emailFieldText.length >0 && passwordFieldText.length>0)
    {
        //START SCREAMING ENABLE
        [self screamInButtonSetEnabled:YES];
    }
    else
    {
        [self screamInButtonSetEnabled:NO];
    }

    
    return YES;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{

    NSString *emailFieldText = [_emailIdField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    NSString *passwordFieldText = [_passwordField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    
    if( emailFieldText.length >0 && passwordFieldText.length>0)
    {
        //START SCREAMING ENABLE
        [self screamInButtonSetEnabled:YES];
    }
    else
    {
        [self screamInButtonSetEnabled:NO];
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
    else if(_passwordField.isFirstResponder)
    {
        [_passwordField resignFirstResponder];
    }
    
}
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesEnded:touches withEvent:event];
}

#pragma mark - Keyboard Handling
-(void)subscribeKeyboardNotifications
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
    
}


-(void)unSubscribeKeyboardNotifications
{
    @try {
        [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    }
    @catch (NSException *exception) {}
    @try {
        [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
    }
    @catch (NSException *exception) {}
}

- (void)keyboardWillShow:(NSNotification *)note
{
 
    CGRect rect=self.controlsContainer.frame;
    rect.origin.y-=KEYBOARD_VARIATION_LOGIN_SCREEN;
    [UIView animateWithDuration:0.2 animations:^{
         [UIView animateWithDuration:0.2 animations:^{
            _controlsContainer.frame=rect;
            }];
        }completion:nil];
}

- (void)keyboardWillHide:(NSNotification *)note {
   
    CGRect rect=self.controlsContainer.frame;
    rect.origin.y+=KEYBOARD_VARIATION_LOGIN_SCREEN;
    [UIView animateWithDuration:0.2 animations:^{
        [UIView animateWithDuration:0.2 animations:^{
            _controlsContainer.frame=rect;
        }];
    }completion:nil];
}


@end
