//
//  PersonalInfoViewController.h
//  TD Visa Form
//
//  Created by Adrian Somesan on 11/23/12.
//  Copyright (c) 2012 Adrian Somesan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AccordionView.h"

@interface PersonalInfoViewController : UIViewController <UIPopoverControllerDelegate, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate>


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
- (IBAction)selectResidentialStatus:(id)sender;


@property (strong, nonatomic) NSString* gender;
@property (strong, nonatomic) NSString* titleString;
@property (strong, nonatomic) NSString* languageOfCorespondaceString;
@property (strong, nonatomic) NSArray* provinceArray;
@property (strong, nonatomic) NSArray* titleArray;
@property (strong, nonatomic) NSArray* genderArray;
@property (strong, nonatomic) NSArray* languageOfCorespondaceArray;
@property (strong, nonatomic) NSArray* residentialStatusArray;

@property (strong, nonatomic) UIImageView* sageataImage;
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
@property (strong, nonatomic) IBOutlet UITextField *emailAddress;
@property (strong, nonatomic) IBOutlet UITextField *streetAddress;
@property (strong, nonatomic) IBOutlet UITextField *postalCode;
@property (strong, nonatomic) IBOutlet UITextField *totalMonthlyHousingCosts;

- (IBAction)selectProvince:(id)sender;
- (IBAction)selectLanguageOfCorespondance:(id)sender;
- (IBAction)titleSelection:(id)sender;
- (void)refresh;
- (IBAction)previousStep:(id)sender;
- (IBAction)nextStep:(id)sender;
- (IBAction)selectGender:(id)sender;
- (IBAction)selectLanguageOfCorrespondace:(id)sender;
- (IBAction)closeGeneralInfoView:(id)sender;


@end
