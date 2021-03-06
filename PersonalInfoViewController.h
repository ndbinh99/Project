//
//  PersonalInfoViewController.h
//  TD Visa Form
//
//  Created by Adrian Somesan on 11/23/12.
//  Copyright (c) 2012 Adrian Somesan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AccordionView.h"
#import "CDatePickerViewEx.h"
#import "MainViewController.h"

@interface PersonalInfoViewController : MainViewController <UIPopoverControllerDelegate, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UILabel *fontTestLabel;

@property (strong, nonatomic) IBOutlet UIScrollView *accordionViewScrollView;
@property (strong, nonatomic) IBOutlet UIView *forthheaderView;
@property (strong, nonatomic) IBOutlet UIView *formalFormalHomeAddress;

@property (strong, nonatomic) IBOutlet UIView *thirdHeaderView;
@property (strong, nonatomic) IBOutlet UIView *formalHomeAddress;

@property (strong, nonatomic) IBOutlet UIButton *timeLivedAtCurrentAddress;
@property (strong, nonatomic) UIPopoverController* popoverController6;
@property (strong, nonatomic) UIPickerView *timeLivedAtCurrentAddressPicker;
@property (strong, nonatomic) NSArray* monthsLivedArray;
@property (strong, nonatomic) NSArray* yearsLivedArray;
@property (strong, nonatomic) IBOutlet UIImageView *personalHeader;
@property (strong, nonatomic) IBOutlet UIButton *previousResidentialStatusButton;
@property (strong, nonatomic) IBOutlet UIButton *timeLivedAtPreviousAddressButton;


@property (strong, nonatomic) IBOutlet UIButton *nextStepButton;

@property (strong, nonatomic) IBOutlet UIView *secondHeaderView;
@property (strong, nonatomic) IBOutlet UIView *firstHeaderView;
@property (strong, nonatomic) UIButton* editFirstView;
@property (strong, nonatomic) UIButton* editSecondView;

@property (strong, nonatomic) IBOutlet UITextField *sinNumber;
@property (strong, nonatomic) IBOutlet UITextField *currentCity;

@property (strong, nonatomic) IBOutlet UIButton *selectLanguageOfCorespondace;
@property (strong, nonatomic) IBOutlet UIButton *selectTitelButton;
@property (strong, nonatomic) AccordionView *accordion;


@property (strong, nonatomic) IBOutlet UIPickerView *statesPicker;
@property (strong, nonatomic) UIPickerView *titlePicker;
@property (strong, nonatomic) UIPickerView *genderPicker;
@property (strong, nonatomic) UIPickerView *languageOfCorespondacePicker;
@property (strong, nonatomic) UIPickerView *residentialStatusPicker;
@property (strong, nonatomic) IBOutlet UIButton *provinceButton;
@property (strong, nonatomic) IBOutlet UIButton *residentialStatusButton;



@property (strong, nonatomic) NSString* gender;
@property (strong, nonatomic) NSString* titleString;
@property (strong, nonatomic) NSString* languageOfCorespondaceString;
@property (strong, nonatomic) NSArray* provinceArray;
@property (strong, nonatomic) NSArray* usStatesArray;
@property (strong, nonatomic) NSArray* countryArray;


@property (strong, nonatomic) NSArray* titleArray;
@property (strong, nonatomic) NSArray* genderArray;
@property (strong, nonatomic) NSArray* languageOfCorespondaceArray;
@property (strong, nonatomic) NSArray* residentialStatusArray;

@property (strong, nonatomic) IBOutlet UIView *generalInfoView;
@property (strong, nonatomic) UIPopoverController* popoverController1;
@property (strong, nonatomic) UIPopoverController* popoverController2;
@property (strong, nonatomic) UIPopoverController* popoverController3;
@property (strong, nonatomic) UIPopoverController* popoverController4;
@property (strong, nonatomic) UIPopoverController* popoverController5;
@property (strong, nonatomic) IBOutlet UIButton *selectGenderButton;
@property (strong, nonatomic) IBOutlet UIButton *doneGeneralInfo;
@property (strong, nonatomic) IBOutlet UIView *currentHomeAddressView;
@property (strong, nonatomic) IBOutlet UITextField *firstName;
@property (strong, nonatomic) IBOutlet UITextField *lastName;
@property (strong, nonatomic) IBOutlet UITextField *areaCode;
@property (strong, nonatomic) IBOutlet UITextField *primaryPhoneNumber;
@property (strong, nonatomic) IBOutlet UITextField *primaryPhonePrefix;

@property (strong, nonatomic) IBOutlet UITextField *emailAddress;
@property (strong, nonatomic) IBOutlet UITextField *streetAddress;
@property (strong, nonatomic) IBOutlet UITextField *postalCode;
@property (strong, nonatomic) IBOutlet UITextField *totalMonthlyHousingCosts;
- (IBAction)chooseHowLongYouLivedAtPreviousAddress:(id)sender;

@property (strong, nonatomic) IBOutlet UITextField *previousAddress;
@property (strong, nonatomic) IBOutlet UITextField *previousPostalCode;
@property (strong, nonatomic) IBOutlet UITextField *previousCity;
@property (strong, nonatomic) IBOutlet UIButton *previousProvinceButton;

@property (readwrite, nonatomic) BOOL firstViewClosed;
@property (strong, nonatomic) IBOutlet UIButton *closePreviousAddressView;
@property (strong, nonatomic) UIActivityIndicatorView *activityIndicator;



@property (strong, nonatomic) IBOutlet UITextField *previousPreviousStreet;
@property (strong, nonatomic) IBOutlet UITextField *previousPreviousPostalCode;
@property (strong, nonatomic) IBOutlet UITextField *previousPreviousCity;
@property (strong, nonatomic) IBOutlet UIButton *previousPreviousProvince;
@property (strong, nonatomic) IBOutlet UIButton *previousPreviousYearsAndMonths;
@property (strong, nonatomic) IBOutlet UIButton *previousPreviousResidentialStatus;

@property (strong, nonatomic) NSString* years;



- (IBAction)closePreviousPreviousAddress:(id)sender;
- (IBAction)selectPreviousResidentialStatus:(id)sender;
- (IBAction)selectPreviousProvince:(id)sender;
- (IBAction)selectProvince:(id)sender;
- (IBAction)selectLanguageOfCorespondance:(id)sender;
- (IBAction)titleSelection:(id)sender;
- (void)refresh;
- (IBAction)previousStep:(id)sender;
- (IBAction)nextStep:(id)sender;
- (IBAction)selectGender:(id)sender;
- (IBAction)closeGeneralInfoView:(id)sender;
- (IBAction)closeAddressView:(id)sender;
- (IBAction)selectResidentialStatus:(id)sender;
- (IBAction)showPrivacy:(id)sender;
- (IBAction)showLegal:(id)sender;
- (IBAction)showSecurity:(id)sender;
- (IBAction)choseHowLongYouLivedAtCurrentAddress:(id)sender;
- (IBAction)startOver:(id)sender;
- (IBAction)closePreviousAddress:(id)sender;

@end
