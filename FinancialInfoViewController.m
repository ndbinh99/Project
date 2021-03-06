//
//  FinancialInfoViewController.m
//  TD Visa Form
//
//  Created by Adrian Somesan on 11/26/12.
//  Copyright (c) 2012 Adrian Somesan. All rights reserved.
//

#import "FinancialInfoViewController.h"
#import "AccordionView.h"
#import "AppDelegate.h"

@interface FinancialInfoViewController ()

@end

@implementation FinancialInfoViewController

@synthesize textfieldString, requesteCreditLimitString, requesteCreditLimitArray;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

#pragma mark
#pragma mark select current employment status

- (IBAction)selectResidentialStatus:(id)sender
{
    UIViewController* popoverContent = [[UIViewController alloc] init]; //ViewController
    
    UIView *popoverView = [[UIView alloc] init];   //view
    popoverView.backgroundColor = [UIColor grayColor];

    UIToolbar* toolbar = [[UIToolbar alloc] initWithFrame: CGRectMake(0.0, 0.0, 320.0, 44.0)];
    toolbar.barStyle = UIBarStyleBlack;
    
    UIBarButtonItem* space = [[UIBarButtonItem alloc] initWithBarButtonSystemItem: UIBarButtonSystemItemFlexibleSpace
                                                                           target: nil
                                                                           action: nil];
    UIBarButtonItem* doneButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem: UIBarButtonSystemItemDone
                                                                                target: self
                                                                                action: @selector(chooseResidentialStatus)];
    
    doneButton.tintColor = [UIColor blackColor];
    
    NSMutableArray* toolbarItems = [NSMutableArray array];
    [toolbarItems addObject:space];
    [toolbarItems addObject:doneButton];
    toolbar.items = toolbarItems;
    
    [popoverView addSubview:toolbar];
    
    self.employmentStatusPicker = [[UIPickerView alloc]init];//Date picker
    self.employmentStatusPicker.frame = CGRectMake(0,44,320, 216);
    self.employmentStatusPicker.dataSource = self;
    self.employmentStatusPicker.delegate = self;
    self.employmentStatusPicker.showsSelectionIndicator = YES;
    [popoverView addSubview:self.employmentStatusPicker];
    
    if (![self.employmentStatus.titleLabel.text isEqualToString:@"Current Employment Status"]) {
        
        int index = [self.employmentStatusArray indexOfObject:self.employmentStatus.titleLabel.text];
        [self.employmentStatusPicker selectRow:index inComponent:0 animated:YES];
    }
    
    CGRect frame;
    
    frame = self.employmentStatus.frame;
    frame.origin.y = frame.origin.y + 50;
    
    popoverContent.view = popoverView;
    self.popoverController1 = [[UIPopoverController alloc] initWithContentViewController:popoverContent];
    self.popoverController1.delegate = self;
    [self.popoverController1 setPopoverContentSize:CGSizeMake(320., 260.) animated:NO];
    [self.popoverController1 presentPopoverFromRect:frame inView:self.accordionViewScrollView permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
    
    
}

- (void)chooseResidentialStatus
{
    
    [self.employmentStatus setTitle:[NSString stringWithFormat:@"%@",[self.employmentStatusArray objectAtIndex:[self.employmentStatusPicker selectedRowInComponent:0]]] forState:UIControlStateNormal];
    [self.popoverController1 dismissPopoverAnimated:YES];
    
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    
    if (pickerView == self.statesPicker) {
        
        return [self.provinceArray count];
        
    }else if(pickerView == self.occupationPicker){
        
        return [self.occupationArray count];
        
    }else if (pickerView == self.requesteCreditLimitPicker){
        
        return  36;
        
    }else if (pickerView == self.selectCurrentOcupationPicker){
        
        if ([[self.occupationArray objectAtIndex:[self.occupationPicker selectedRowInComponent:0]] isEqualToString:@"Accounting/Finance/Insurance"]) {
            
            return [self.accountingFinanceInsurance count];
            
        }else if ([[self.occupationArray objectAtIndex:[self.occupationPicker selectedRowInComponent:0]] isEqualToString:@"Installation/Maintenance/Repair"]){
            
            return [self.installationMaintenanceRepair count];
            
        }else if ([[self.occupationArray objectAtIndex:[self.occupationPicker selectedRowInComponent:0]] isEqualToString:@"IT/Software Development"]){
         
            return [self.ITSoftwareDevelopment count];
            
        }else if ([[self.occupationArray objectAtIndex:[self.occupationPicker selectedRowInComponent:0]] isEqualToString:@"Legal"]){
            
            return [self.legal count];
            
        }else if ([[self.occupationArray objectAtIndex:[self.occupationPicker selectedRowInComponent:0]] isEqualToString:@"Administrative/Clarical"]){
            
            return [self.administrativeClerical count];
            
        }else if ([[self.occupationArray objectAtIndex:[self.occupationPicker selectedRowInComponent:0]] isEqualToString:@"Logistics/Transportation"]){
            
            return [self.logisticsTransportation count];
            
        }else if ([[self.occupationArray objectAtIndex:[self.occupationPicker selectedRowInComponent:0]] isEqualToString:@"Banking/Real Estate/Mortgage Professionals"]){
            
            return [self.bankingRealEstateMortgageProfessionals count];
            
        }else if ([[self.occupationArray objectAtIndex:[self.occupationPicker selectedRowInComponent:0]] isEqualToString:@"Biotech/R&D/Science"]){
            
            return [self.biotechRDScience count];
            
        }else if ([[self.occupationArray objectAtIndex:[self.occupationPicker selectedRowInComponent:0]] isEqualToString:@"Manufacturing/Production/Operations"]){
            
            return [self.manufacturingProductionOperations count];
            
        }else if ([[self.occupationArray objectAtIndex:[self.occupationPicker selectedRowInComponent:0]] isEqualToString:@"Building Construction/Skilled Trades"]){
            
            return [self.marketingProduct count];
            
        }else if ([[self.occupationArray objectAtIndex:[self.occupationPicker selectedRowInComponent:0]] isEqualToString:@"Marketing/Product"]){
            
            return [self.marketingProduct count];
            
        }else if ([[self.occupationArray objectAtIndex:[self.occupationPicker selectedRowInComponent:0]] isEqualToString:@"Business/Strategic Management"]){
            
            return [self.businessStrategicManagement count];
            
        }else {
            
            return 100;
            
        }
        
    }else if(pickerView == self.selectCountryPicker){
        
        return [self.countryArray count];
        
    }else{
        return [self.employmentStatusArray count];
    }
    
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    
    NSString* val1;
    
    if (pickerView == self.statesPicker) {
        
        val1 = [self.provinceArray objectAtIndex:row];
        
    }else if(pickerView == self.occupationPicker){
        
        val1 = [self.occupationArray objectAtIndex:row];
        
    }else if(pickerView == self.requesteCreditLimitPicker){
        
        if (row == 0) {
        
            val1 = [NSString stringWithFormat:@"$ %i",1500];
            
            if ([self.requesteCreditLimitArray containsObject:val1]) {
                
            }else{
            
                [self.requesteCreditLimitArray addObject:val1];
                
            }
            
        }else{
            
            NSNumberFormatter * currencyStile = [[NSNumberFormatter alloc] init];
            [currencyStile setFormatterBehavior:NSNumberFormatterCurrencyStyle];
        
            val1 = [NSString stringWithFormat:@"$ %i",1500 + (row * 100)];
            
            if ([self.requesteCreditLimitArray containsObject:val1]) {
                
            }else{
                
                [self.requesteCreditLimitArray addObject:val1];
                
            }
        }
    
    }else if(pickerView == self.selectCurrentOcupationPicker){
        
        if ([self.industryButton.titleLabel.text isEqualToString:@"Accounting/Finance/Insurance"]) {
            
            val1 = [self.accountingFinanceInsurance objectAtIndex:row];
            
        }else if ([self.industryButton.titleLabel.text isEqualToString:@"Installation/Maintenance/Repair"]){
            
            val1 = [self.installationMaintenanceRepair objectAtIndex:row];
            
        }else if ([self.industryButton.titleLabel.text isEqualToString:@"IT/Software Development"]){
            
            val1 = [self.ITSoftwareDevelopment objectAtIndex:row];
            
        }else if ([self.industryButton.titleLabel.text isEqualToString:@"Legal"]){
            
            val1 = [self.legal objectAtIndex:row];
            
        }else if ([self.industryButton.titleLabel.text isEqualToString:@"Administrative/Clarical"]){
            
            val1 = [self.administrativeClerical objectAtIndex:row];
            
        }else if ([self.industryButton.titleLabel.text isEqualToString:@"Logistics/Transportation"]){
            
            val1 = [self.logisticsTransportation objectAtIndex:row];
            
        }else if ([self.industryButton.titleLabel.text isEqualToString:@"Banking/Real Estate/Mortgage Professionals"]){
            
            val1 = [self.bankingRealEstateMortgageProfessionals objectAtIndex:row];
            
        }else if ([self.industryButton.titleLabel.text isEqualToString:@"Biotech/R&D/Science"]){
            
            val1 = [self.biotechRDScience objectAtIndex:row];
            
        }else if ([self.industryButton.titleLabel.text isEqualToString:@"Manufacturing/Production/Operations"]){
            
            val1 = [self.manufacturingProductionOperations objectAtIndex:row];
            
        }else if ([self.industryButton.titleLabel.text isEqualToString:@"Building Construction/Skilled Trades"]){
            
            val1 = [self.buildingConstructionSkilledTrades objectAtIndex:row];
            
        }else if ([self.industryButton.titleLabel.text isEqualToString:@"Marketing/Product"]){
            
            val1 = [self.marketingProduct objectAtIndex:row];
            
        }else if ([self.industryButton.titleLabel.text isEqualToString:@"Business/Strategic Management"]){
            
            val1 = [self.businessStrategicManagement objectAtIndex:row];
            
        }else {
            
            return @"";
            
        }
        
    }else if(pickerView == self.selectCountryPicker){
        
        val1 = [self.countryArray objectAtIndex:row];
        
    }else{
        
        val1 = [self.employmentStatusArray objectAtIndex:row];
        
    }
    
    
    return val1;
}

- (IBAction)selectProvince:(id)sender
{
    
    UIViewController* popoverContent = [[UIViewController alloc] init]; //ViewController
    
    UIView *popoverView = [[UIView alloc] init];   //view
    popoverView.backgroundColor = [UIColor grayColor];
    
    UIToolbar* toolbar = [[UIToolbar alloc] initWithFrame: CGRectMake(0.0, 0.0, 320., 44.0)];
    toolbar.barStyle = UIBarStyleBlack;
    
    UIBarButtonItem* space = [[UIBarButtonItem alloc] initWithBarButtonSystemItem: UIBarButtonSystemItemFlexibleSpace
                                                                           target: nil
                                                                           action: nil];
    UIBarButtonItem* doneButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem: UIBarButtonSystemItemDone
                                                                                target: self
                                                                                action: @selector(chooseProvince)];
    
    doneButton.tintColor = [UIColor blackColor];
    
    NSMutableArray* toolbarItems = [NSMutableArray array];
    [toolbarItems addObject:space];
    [toolbarItems addObject:doneButton];
    toolbar.items = toolbarItems;
    
    [popoverView addSubview:toolbar];
    
    self.statesPicker = [[UIPickerView alloc]init];//Date picker
    self.statesPicker.frame = CGRectMake(0,44,320, 216);
    self.statesPicker.dataSource = self;
    self.statesPicker.delegate = self;
    self.statesPicker.showsSelectionIndicator = YES;
    [popoverView addSubview:self.statesPicker];
    
    if (![self.provinceButton.titleLabel.text isEqualToString:@"Province"]) {
        
        int index = [self.provinceArray indexOfObject:self.provinceButton.titleLabel.text];
        [self.statesPicker selectRow:index inComponent:0 animated:YES];
    }
    
    CGRect frame;
    
    frame = self.provinceButton.frame;
    frame.origin.y = frame.origin.y + 150;
    
    popoverContent.view = popoverView;
    self.popoverController2 = [[UIPopoverController alloc] initWithContentViewController:popoverContent];
    self.popoverController2.delegate = self;
    [self.popoverController2 setPopoverContentSize:CGSizeMake(320, 260) animated:NO];
    [self.popoverController2 presentPopoverFromRect:frame inView:self.accordionViewScrollView permittedArrowDirections:UIPopoverArrowDirectionRight animated:YES];
    
}

- (void)chooseProvince
{
    
    //    NSLog(@"%@",[self.provinceArray objectAtIndex:[self.statesPicker selectedRowInComponent:0]]);
    [self.provinceButton setTitle:[NSString stringWithFormat:@"%@",[self.provinceArray objectAtIndex:[self.statesPicker selectedRowInComponent:0]]] forState:UIControlStateNormal];
    [self.popoverController2 dismissPopoverAnimated:YES];
    
}

- (void)viewWillDisappear:(BOOL)animated{
    
//    [[NSNotificationCenter defaultCenter] removeObserver:self name:UITextFieldTextDidChangeNotification object:nil];
    

    
    
}


#pragma mark
#pragma mark viewDidLoad

- (void)viewDidLoad
{
    
    
    [[NSNotificationCenter defaultCenter]
     addObserver:self
     selector:@selector(anyMethod:)
     name:UITextFieldTextDidChangeNotification
     object:self.employerAreaCode];
    
    [[NSNotificationCenter defaultCenter]
     addObserver:self
     selector:@selector(anyMethod:)
     name:UITextFieldTextDidChangeNotification
     object:self.employerWorkPrefix];
    
    [[NSNotificationCenter defaultCenter]
     addObserver:self
     selector:@selector(anyMethod:)
     name:UITextFieldTextDidChangeNotification
     object:self.employerWorkPhoneNumber];
    
    [self.bextSteptButton setImage:[UIImage imageNamed:@"btn-next-inactive.png"] forState:UIControlStateDisabled];
    self.bextSteptButton.enabled = NO;
    
    self.requesteCreditLimitArray = [NSMutableArray new];
    
    [super viewDidLoad];
   
    
    
    // Do any additional setup after loading the view from its nib.
    
    UIColor *background = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"background.png"]];
    self.view.backgroundColor = background;
    
    self.textfieldString = [[NSMutableString alloc] initWithCapacity:100];
    
    self.occupationArray = [NSArray new];
    self.occupationArray = @[@"Accounting/Finance/Insurance",
    @"Administrative/Clarical",
    @"Banking/Real Estate/Mortgage Professionals",
    @"Biotech/R&D/Science",
    @"Building Construction/Skilled Trades",
    @"Business/Strategic Management",
    @"Creative Design",
    @"Customer Support/Client Care",
    @"Editorial/Writing",
    @"Education/Training",
    @"Engineering/Architect",
    @"Food Services/Hospitality",
    @"Human Resources",
    @"IT/Software Development",
    @"Installation/Maintenance/Repair",
    @"Legal",
    @"Logistics/Transportation",
    @"Manufacturing/Production/Operations",
    @"Marketing/Production/Operations",
    @"Marketing/Product",
    @"Medical/Health",
    @"Other",
    @"Project/Program Management",
    @"Quality Assurance/Safety",
    @"Sales/Retail/Business Development",
    @"Security/Protective Services",
    @"Trades"];
    
    self.accountingFinanceInsurance = [NSArray new];
    self.accountingFinanceInsurance = @[@"Accountant",
    @"Accounting Consultant",
    @"Accounts Payable/Receivable",
    @"Actuarial Analysis",
    @"Auditor",
    @"Bookkeeping",
    @"Claims Review and Adjusting",
    @"Collections",
    @"Corporate Accounting",
    @"Corporate Finance",
    @"Credit Review/Analysis",
    @"Financial Advisor",
    @"Financial Analysis/Research/Reporting",
    @"Financial Control",
    @"Financial Planning/Advising",
    @"Financial Products Sales/Brokerage",
    @"Financial Manager",
    @"Fund Accounting",
    @"Other: Accounting/Finance",
    @"Loans Officer",
    @"Mortgage Broker",
    @"Investment Management",
    @"Investment Analyst",
    @"Investement Banker",
    @"Investment Broker",
    @"Insurance Broker",
    @"Investment Consultant",
    @"Policy Underwriting",
    @"Real Estate Appraisal",
    @"Real Estate Leasing/Acquisition",
    @"Risk Management/Compliance",
    @"Securities Analysis/Research",
    @"Tax Accounting",
    @"Tax Assessment and Collections"];
    
    self.installationMaintenanceRepair = [NSArray new];
    self.installationMaintenanceRepair = @[@"Compu/Electr/Telecom Instl/Maint/Rep",
    @"Electrician",
    @"Equipment Install/Maintain/Repair",
    @"Facilities Management/Maintenance",
    @"Other: Installation/Maintenance/Repair",
    @"HVAC",
    @"Janitorial & Cleaning",
    @"Landscaping",
    @"Locksmith",
    @"Oil Rig & Pipeline Install/Maintain/Repair",
    @"Painter",
    @"Plumbing/Pipefitting",
    @"Vehicle Repair and Maintenance",
    @"Wire and Cable Install/Maintain/Repair"];
    
    self.ITSoftwareDevelopment = [NSArray new];
    self.ITSoftwareDevelopment = @[@"Computer/Network Security",
    @"Database Development/Administration",
    @"Desktop Service and Support",
    @"Enterprise S/W Implement. & Consult.",
    @"Other: IT/Software Development",
    @"IT Project Management",
    @"Information Technology Specialist",
    @"Network and Server Administration",
    @"Software/System Architecture",
    @"Software/Web Development",
    @"Systems Analysis - IT",
    @"IT-Telecom Admin/Management",
    @"Usability/Information Architecture",
    @"Web/UI/UX Design"];
    
    
    self.legal = [NSArray new];
    self.legal = @[
    @"Attorney",
    @"Contracts Administration",
    @"Other: Legal",
    @"Labor & Employment Law",
    @"Legal Specialist",
    @"Paralegal & Legal Secretary",
    @"Patent/IP Law",
    @"Real Estate Law",
    @"Regulatory/Compliance Law",
    @"Tax Law"];
    
    
    self.administrativeClerical = [NSArray new];
    self.administrativeClerical = @[@"Administrative Assistant",
    @"Administrative Support",
    @"Claims Processing",
    @"Data Entry/Order Processing",
    @"Executive Support",
    @"Filing/Records Management",
    @"Other: Administrative/Clerical",
    @"Office Management",
    @"Property Management",
    @"Reception/Switchboard",
    @"Secretary/Executive Assistant",
    @"Transcription"];
    
    self.logisticsTransportation = [NSArray new];
    self.logisticsTransportation = @[@"Car, Van and Bus Driving",
    @"Cargo and Baggage Handling",
    @"Cost Estimating",
    @"Equipment/Forklift/Crane Operation",
    @"Other: Logistics/Transportation",
    @"Hazardous Materials Handling",
    @"Import/Export Administration",
    @"Inventory Planning and Management",
    @"Mail Carrier",
    @"Merchandise Planning and Buying",
    @"Messenger/Courier",
    @"Piloting: Air and Marine",
    @"Purchasing",
    @"Shipping and Receiving/Warehousing",
    @"Supplier Management/Vendor Management",
    @"Train or Rail Operator",
    @"Travel Consultant",
    @"Truck Driving",
    @"Vehicle Dispatch, Routing and Scheduling"];
    
    self.bankingRealEstateMortgageProfessionals = [NSArray new];
    self.bankingRealEstateMortgageProfessionals = @[@"Bank Teller",
    @"Bank Managers",
    @"Credit Manager",
    @"Economist",
    @"Escrow Officer/Manager",
    @"Loan Officer/Originator",
    @"Mortgage Broker",
    @"Real Estate Agent",
    @"Real Estate Appraisal",
    @"Real Estate Broker",
    @"Real Estate Law",
    @"Store/Branch Management",
    @"Title Officer/Closer",
    @"Underwriter"];
    
    self.biotechRDScience = [NSArray new];
    self.biotechRDScience = @[@"Biological/Chemical Research",
    @"Clinical Research",
    @"Environmental/Geological Test & Analysis",
    @"Other: R&D/Science",
    @"Materials/Physical Research",
    @"Mathematical/Statistical Research",
    @"New Product R&D",
    @"Pharmaceutical Research"];
    
    self.manufacturingProductionOperations = [NSArray new];
    self.manufacturingProductionOperations = @[@"Agricultural Specialist",
    @"Assembly/Assembly Line",
    @"Audio/Video Broadcast & Postproduction",
    @"Equipment Operations",
    @"Other: Production/Operations",
    @"Hazardous Materials Handling",
    @"Laundry and Dry-Cleaning Operations",
    @"Layout, Prepress, Printing & Binding Ops",
    @"Machining/CNC",
    @"Metal Fabrication and Welding",
    @"Moldmaking/Casting",
    @"Operations/Plant Management",
    @"Production/Operations Planning",
    @"Scientific/Technical Production",
    @"Sewing and Tailoring",
    @"Operations-Telecom Admin/Management",
    @"Waste Pick-up and Removal"];
    
    
    self.buildingConstructionSkilledTrades = [NSArray new];
    self.buildingConstructionSkilledTrades = @[@"CAD/Drafting",
    @"Carpentry/Framing",
    @"Concrete and Masonry",
    @"Electrician",
    @"Firefighter",
    @"Flooring/Tiling/Painting/Wallpapering",
    @"Other: Construction/Skilled Trades",
    @"Heavy Equipment Operation",
    @"HVAC",
    @"Lansdscaper",
    @"Ironwork/Metal Fabrication",
    @"Plumbing/Pipefitting",
    @"Roofing",
    @"Sheetrock/Plastering",
    @"Site Superintendent",
    @"Surveying"];
    
    
    self.marketingProduct = [NSArray new];
    self.marketingProduct = @[@"Brand/Product Marketing",
    @"Copy Writing/Editing",
    @"Direct Marketing (CRM)",
    @"Events/Promotional Marketing",
    @"Other: Marketing/Product",
    @"Investor and Public/Media Relations",
    @"Market Research",
    @"Marketing Communications",
    @"Marketing Production/Traffic",
    @"Media Planning and Buying",
    @"Product Management",
    @"Pubic Relations Specialist",
    @"Telemarketing"];
    self.businessStrategicManagement = [NSArray new];
    self.businessStrategicManagement = @[@"Business Analysis/Research"];
    
    self.employmentStatusArray = [NSArray new];
    self.employmentStatusArray = @[@"Employed Full Time", @"Employed Part Time", @"Self-employed", @"Unemployed", @"Retired", @"Student",
    @"Homemaker"];
    
    self.provinceArray = [NSArray new];
    self.provinceArray = @[@"Alberta", @"British Columbia", @"Manitoba", @"New Brunswick", @"Newfoundland & Labrador", @"Nova Scotia", @"Northwest Territories", @"Nunavut", @"Ontario", @"Prince Edward Island", @"Quebec", @"Saskatchewan", @"Yukon"];
    
    self.countryArray = [NSArray new];
    self.countryArray = @[@"Afghanistan",@"Albania",@"Algeria",@"Andorra",@"Angola",@"Antigua Deps",@"Argentina",@"Armenia",@"Australia",@"Austria",@"Azerbaijan",@"Bahamas",@"Bahrain",@"Bangladesh",@"Barbados",@"Belarus",@"Belgium",@"Belize",@"Benin",@"Bhutan",@"Bolivia",@"Bosnia Herzegovina",@"Botswana",@"Brazil",@"Brunei",@"Bulgaria",@"Burkina",@"Burundi",@"Cambodia",@"Cameroon",@"Canada",@"Cape Verde",@"Central African Rep",@"Chad",@"Chile",@"China",@"Colombia",@"Comoros",@"Congo",@"Congo {Democratic Rep}",@"Costa Rica",@"Croatia",@"Cuba",@"Cyprus",@"Czech Republic",@"Denmark",@"Djibouti",@"Dominica",@"Dominican Republic",@"East Timor",@"Ecuador",@"Egypt",@"El Salvador",@"Equatorial Guinea",@"Eritrea",@"Estonia",@"Ethiopia",@"Fiji",@"Finland",@"France",@"Gabon",@"Gambia",@"Georgia",@"Germany",@"Ghana",@"Greece",@"Grenada",@"Guatemala",@"Guinea",@"Guinea-Bissau",@"Guyana",@"Haiti",@"Honduras",@"Hungary",@"Iceland",@"India",@"Indonesia",@"Iran",@"Iraq",@"Ireland {Republic}",@"Israel",@"Italy",@"Ivory Coast",@"Jamaica",@"Japan",@"Jordan",@"Kazakhstan",@"Kenya",@"Kiribati",@"Korea North",@"Korea South",@"Kosovo",@"Kuwait",@"Kyrgyzstan",@"Laos",@"Latvia",@"Lebanon",@"Lesotho",@"Liberia",@"Libya",@"Liechtenstein",@"Lithuania",@"Luxembourg",@"Macedonia",@"Madagascar",@"Malawi",@"Malaysia",@"Maldives",@"Mali",@"Malta",@"Marshall Islands",@"Mauritania",@"Mauritius",@"Mexico",@"Micronesia",@"Moldova",@"Monaco",@"Mongolia",@"Montenegro",@"Morocco",@"Mozambique",@"Myanmar, {Burma}",@"Namibia",@"Nauru",@"Nepal",@"Netherlands",@"New Zealand",@"Nicaragua",@"Niger",@"Nigeria",@"Norway",@"Oman",@"Pakistan",@"Palau",@"Panama",@"Papua New Guinea",@"Paraguay",@"Peru",@"Philippines",@"Poland",@"Portugal",@"Qatar",@"Romania",@"Russian Federation",@"Rwanda",@"St Kitts &amp; Nevis",@"St Lucia",@"Saint Vincent &amp; the Grenadines",@"Samoa",@"San Marino",@"Sao Tome &amp; Principe",@"Saudi Arabia",@"Senegal",@"Serbia",@"Seychelles",@"Sierra Leone",@"Singapore",@"Slovakia",@"Slovenia",@"Solomon Islands",@"Somalia",@"South Africa",@"South Sudan",@"Spain",@"Sri Lanka",@"Sudan",@"Suriname",@"Swaziland",@"Sweden",@"Switzerland",@"Syria",@"Taiwan",@"Tajikistan",@"Tanzania",@"Thailand",@"Togo",@"Tonga",@"Trinidad &amp; Tobago",@"Tunisia",@"Turkey",@"Turkmenistan",@"Tuvalu",@"Uganda",@"Ukraine",@"United Arab Emirates",@"United Kingdom",@"United States",@"Uruguay",@"Uzbekistan",@"Vanuatu",@"Vatican City",@"Venezuela",@"Vietnam",@"Yemen",@"Zambia",@"Zimbabwe"];
    
    self.accordion = [[AccordionView alloc] initWithFrame:CGRectMake(0., 0., 987., 548.)];
  
    self.accordionViewScrollView.contentSize = CGSizeMake(1, 600.);
    self.accordionViewScrollView.backgroundColor =[UIColor whiteColor];

    [self.accordionViewScrollView addSubview:self.accordion];
    
    self.firstHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 50)];
    self.firstHeaderView.backgroundColor = [UIColor colorWithRed:0.086 green:0.24 blue:0.137 alpha:1];
    
    UILabel* firstHeaderTitel = [[UILabel alloc] initWithFrame:CGRectMake(6., 12., 250., 40.)];
    firstHeaderTitel.backgroundColor = [UIColor clearColor];
    firstHeaderTitel.textColor = [UIColor whiteColor];
    firstHeaderTitel.text = @"  Financial Details";
    [self setAppFontStyle:@"accordion-header" forView:firstHeaderTitel];
    
    [self.firstHeaderView addSubview:firstHeaderTitel];
    
    [self.accordion addHeader:self.firstHeaderView withView:self.financialDetailsView];

    self.secondHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 50)];
     [self drawTopLineForSubView:self.secondHeaderView];
    self.secondHeaderView.backgroundColor = [UIColor whiteColor];//[UIColor colorWithRed:0.086 green:0.24 blue:0.137 alpha:1];
    
    UILabel* secondHeaderTitel = [[UILabel alloc] initWithFrame:CGRectMake(6., 12., 350., 40.)];
    secondHeaderTitel.backgroundColor = [UIColor clearColor];
    secondHeaderTitel.textColor = [UIColor colorWithRed:0.086 green:0.24 blue:0.137 alpha:1];//[UIColor whiteColor];
    secondHeaderTitel.text = @"  Employer's Details";
    [self setAppFontStyle:@"accordion-header" forView:secondHeaderTitel];
    
    [self.secondHeaderView addSubview:secondHeaderTitel];
    
    [self.accordion addHeader:self.secondHeaderView withView:self.employerDetailsView];

    
    self.thirdHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 50)];
      [self drawTopLineForSubView:self.thirdHeaderView];
    self.thirdHeaderView.backgroundColor = [UIColor whiteColor];//[UIColor colorWithRed:0.086 green:0.24 blue:0.137 alpha:1];
    
    UILabel* thirdHeaderTitel = [[UILabel alloc] initWithFrame:CGRectMake(6., 12., 400., 40.)];
    thirdHeaderTitel.backgroundColor = [UIColor clearColor];
    thirdHeaderTitel.textColor = [UIColor colorWithRed:0.086 green:0.24 blue:0.137 alpha:1];//[UIColor whiteColor];
    thirdHeaderTitel.text = @"  Income and Credit Limit Details";
    [self setAppFontStyle:@"accordion-header" forView:thirdHeaderTitel];
    
    [self.thirdHeaderView addSubview:thirdHeaderTitel];
    
    [self.accordion addHeader:self.thirdHeaderView withView:self.incomeAndCreditDetailsView];
    
    [self.accordion setNeedsLayout];
    
    // Set this if you want to allow multiple selection
    [self.accordion setAllowsMultipleSelection:YES];
    [self setAppFontStyle:@"button" forView:self.selectCurrentOcupationPicker];
    [self setAppFontStyle:@"button" forView:self.startDateButton];
    [self setAppFontStyle:@"button" forView:self.requestedCreditLimitButton];
    [self setAppFontStyle:@"button" forView:self.employmentStatus];
    [self setAppFontStyle:@"button" forView:self.industryButton];
    [self setAppFontStyle:@"button" forView:self.curretOccupationButton];
    [self setAppFontStyle:@"button" forView:self.chooseCountryButton];
    [self setAppFontStyle:@"button" forView:self.provinceButton];
    
    
    [self setDefaultStyles:self.financialDetailsView];
    [self setDefaultStyles:self.employerDetailsView];
    [self setDefaultStyles:self.incomeAndCreditDetailsView];
    

    
}

- (void)refresh
{
    // we need to swap out he header image here based on them clicking on the next button
    
    
    //   self.sageataImage = [[UIImageView alloc] initWithFrame:CGRectMake(489.0, 62.0, 94., 81)];
    //  self.sageataImage.image = [UIImage imageNamed:@"sageata.png"];
    //  [self.view addSubview:self.sageataImage];
}

- (IBAction)nextStep:(id)sender
{
    
    AppDelegate *appDelegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
    
    
    
    [appDelegate addInfoToUser:self.employmentStatus.titleLabel.text andFieldToAddItTo:@"employmentStatus"];
    
    [appDelegate addInfoToUser:self.employerAreaCode.text andFieldToAddItTo:@"employerAreaCode"];
    [appDelegate addInfoToUser:self.employerWorkPhoneNumber.text andFieldToAddItTo:@"workPhone"];
    [appDelegate addInfoToUser:self.employerWorkPrefix.text andFieldToAddItTo:@"employerWorkPrefix"];
    
    [appDelegate addInfoToUser:self.employerStreetAddress.text andFieldToAddItTo:@"employerStreetAddress"];
    [appDelegate addInfoToUser:self.provinceButton.titleLabel.text andFieldToAddItTo:@"employerProvince"];
    [appDelegate addInfoToUser:self.employerCity.text andFieldToAddItTo:@"employerCity"];
    [appDelegate addInfoToUser:self.employerName.text andFieldToAddItTo:@"employerName"];
    [appDelegate addInfoToUser:self.grossAnualIncomeTextField.text andFieldToAddItTo:@"grossAnualIncome"];
    [appDelegate addInfoToUser:self.requestedCreditLimitButton.titleLabel.text andFieldToAddItTo:@"requestedCreditLimit"];
    
    if (self.otherOccupationSelected) {
        
        [appDelegate addInfoToUser:self.otherOccupationTextField.text andFieldToAddItTo:@"currentIndustry"];
        
    }else{
        
        [appDelegate addInfoToUser:self.industryButton.titleLabel.text andFieldToAddItTo:@"currentIndustry"];
    }
    
    if (self.otherOccupationSelected2) {
        
        [appDelegate addInfoToUser:self.specifyOtherOcupationtextField.text andFieldToAddItTo:@"currentOcupation"];
        
    }else{
        
        [appDelegate addInfoToUser:self.curretOccupationButton.titleLabel.text andFieldToAddItTo:@"currentOcupation"];
    }
    
    [appDelegate setNewRootView:appDelegate.pickLocationViewController];
    [appDelegate.pickLocationViewController refresh];
    
}

- (IBAction)previousStep:(id)sender
{
    
    AppDelegate *appDelegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
    
    [appDelegate backOneView];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark
#pragma mark anyMethod called by notification center

-(void)anyMethod:(NSNotification*)sender{
    
    
    if ([sender.object isEqual:self.employerAreaCode]) {
        
        int length = [self.employerAreaCode.text length];
        if (length >= 3) {
            
            [self.employerWorkPrefix becomeFirstResponder];
            
        }
        
    }else if([sender.object isEqual:self.employerWorkPrefix]){
        
        
        int length = [self.employerWorkPrefix.text length];
        if (length >= 3) {
            
            [self.employerWorkPhoneNumber becomeFirstResponder];
            
        }
        
    }else if([sender.object isEqual:self.employerWorkPhoneNumber]){
        
        int length = [self.employerWorkPhoneNumber.text length];
        if (length >= 4) {
            
            [self.employerWorkPhoneNumber resignFirstResponder];
            
        }
        
    }
    
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    
    if (self.firstViewClosed && self.secondViewClosed) {
        
        if (![self.requestedCreditLimitButton.titleLabel.text isEqualToString:@"Limit"] && self.grossAnualIncomeTextField.text.length > 1 && self.householdIncomeTextField.text.length > 1) {
            self.bextSteptButton.enabled = YES;
        }
    }
    
    string = [string lowercaseString];
    
    if ([string isEqualToString:@""]) {
        
        //        [self.textfieldString insertString:string atIndex:self.textfieldString.length];
        [self.textfieldString setString:[self.textfieldString substringToIndex:[self.textfieldString length] - 1]];
        
        NSLog(@"%@",self.textfieldString);
        
    }else{
        
        [self.textfieldString insertString:string atIndex:self.textfieldString.length];
        
       
        
    }
    
    
    
    if ([self.textfieldString isEqualToString:@"other"]) {
        self.otherOccupationTextField.hidden = NO;
    }else{
        self.otherOccupationTextField.hidden = YES;
    }
    
    if (textField == self.occupationTextField ) {
        
        int length = [textField.text length] ;
        if (length >= MAXLENGTHFORFIRSTNAME && ![string isEqualToString:@""]) {
            textField.text = [textField.text substringToIndex:MAXLENGTHFORFIRSTNAME];
            return NO;
        }
        return YES;
        
    }else if(textField == self.employerName){
        
        int length = [textField.text length] ;
        if (length >= MAXLENGTHFOREMPLOYERNAME && ![string isEqualToString:@""]) {
            textField.text = [textField.text substringToIndex:MAXLENGTHFOREMPLOYERNAME];
            return NO;
        }
        return YES;
        
    }else if (textField == self.employerStreetAddress){
        
        int length = [textField.text length] ;
        if (length >= MAXLENGTHFOREMPLOYERSTREET && ![string isEqualToString:@""]) {
            textField.text = [textField.text substringToIndex:MAXLENGTHFOREMPLOYERSTREET];
            return NO;
        }
        return YES;
        
    }else if(textField == self.employerCity){
        
        int length = [textField.text length] ;
        if (length >= MAXLENGTHFORCURRENTCITY && ![string isEqualToString:@""]) {
            textField.text = [textField.text substringToIndex:MAXLENGTHFORCURRENTCITY];
            return NO;
        }
        return YES;
        
        
        
    }else if(textField == self.employerCityTextField){
        
        int length = [textField.text length] ;
        if (length >= MAXLENGTHFORCURRENTCITY && ![string isEqualToString:@""]) {
            textField.text = [textField.text substringToIndex:MAXLENGTHFORCURRENTCITY];
            return NO;
        }
        return YES;
        
    }else if(textField == self.employerAreaCode){
        
        int length = [textField.text length] ;
        if (length >= 3 && ![string isEqualToString:@""]) {
            textField.text = [textField.text substringToIndex:3];
            return NO;
        }
        return YES;
        
    }else if(textField == self.employerWorkPrefix){
        
        int length = [textField.text length] ;
        if (length >= 3 && ![string isEqualToString:@""]) {
            textField.text = [textField.text substringToIndex:3];
            return NO;
        }
        return YES;
        
    }else if(textField == self.employerWorkPhoneNumber){
        
        int length = [textField.text length] ;
        if (length >= 4 && ![string isEqualToString:@""]) {
            textField.text = [textField.text substringToIndex:4];
            return NO;
        }
        return YES;
        
    }
    
    return YES;
}

#pragma mark
#pragma mark industry
//this is industry not occupation
- (IBAction)selectOccupation:(id)sender
{
    
    UIViewController* popoverContent = [[UIViewController alloc] init]; //ViewController
    
    UIView *popoverView = [[UIView alloc] init];   //view
    popoverView.backgroundColor = [UIColor grayColor];

    
    UIToolbar* toolbar = [[UIToolbar alloc] initWithFrame: CGRectMake(0.0, 0.0, 480., 44.0)];
    toolbar.barStyle = UIBarStyleBlack;
    
    UIBarButtonItem* space = [[UIBarButtonItem alloc] initWithBarButtonSystemItem: UIBarButtonSystemItemFlexibleSpace
                                                                           target: nil
                                                                           action: nil];
    UIBarButtonItem* doneButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem: UIBarButtonSystemItemDone
                                                                                target: self
                                                                                action: @selector(chooseOccupation)];
    
    doneButton.tintColor = [UIColor blackColor];
    
    NSMutableArray* toolbarItems = [NSMutableArray array];
    [toolbarItems addObject:space];
    [toolbarItems addObject:doneButton];
    toolbar.items = toolbarItems;
    
    [popoverView addSubview:toolbar];
    
    self.occupationPicker = [[UIPickerView alloc]init];//Date picker
    self.occupationPicker.frame = CGRectMake(0,44,480, 216);
    self.occupationPicker.dataSource = self;
    self.occupationPicker.delegate = self;
    self.occupationPicker.showsSelectionIndicator = YES;
    [popoverView addSubview:self.occupationPicker];
    
    if (![self.industryButton.titleLabel.text isEqualToString:@"Industry"]) {
        
        int index = [self.occupationArray indexOfObject:self.industryButton.titleLabel.text];
        [self.occupationPicker selectRow:index inComponent:0 animated:YES];
    }
    
    CGRect frame;
    
    frame = self.industryButton.frame;
    frame.origin.y = frame.origin.y + 50;
    
    popoverContent.view = popoverView;
    self.popoverController3 = [[UIPopoverController alloc] initWithContentViewController:popoverContent];
    self.popoverController3.delegate = self;
    [self.popoverController3 setPopoverContentSize:CGSizeMake(480, 260) animated:NO];
    [self.popoverController3 presentPopoverFromRect:frame inView:self.accordionViewScrollView permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
    
}

- (void)chooseOccupation
{
    if ([[self.occupationArray objectAtIndex:[self.occupationPicker selectedRowInComponent:0]] isEqualToString:@"Other"]) {
        
        self.otherOccupationTextField.hidden = NO;
        self.otherOccupationSelected = YES;
        
    }else{
        
        self.otherOccupationTextField.hidden = YES;
        self.otherOccupationSelected = NO;
    }
    
    [self.industryButton setTitle:[NSString stringWithFormat:@"%@",[self.occupationArray objectAtIndex:[self.occupationPicker selectedRowInComponent:0]]] forState:UIControlStateNormal];
    [self.popoverController3 dismissPopoverAnimated:YES];
    
}

- (IBAction)showPrivacy:(id)sender
{
    AppDelegate *appDelegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
    
    appDelegate.modalViewController.modalPresentationStyle = UIModalPresentationPageSheet;
    
    [self presentViewController:appDelegate.modalViewController animated:YES completion:^{}];
    [appDelegate.modalViewController whichModalToPresent:@"privacy"];
    
}

- (IBAction)showLegal:(id)sender
{
    
    AppDelegate *appDelegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
    
    appDelegate.modalViewController.modalPresentationStyle = UIModalPresentationPageSheet;
    [self presentViewController:appDelegate.modalViewController animated:YES completion:^{}];
    [appDelegate.modalViewController whichModalToPresent:@"legal"];
    
}

- (IBAction)showSecurity:(id)sender
{
    
    AppDelegate *appDelegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
    
    appDelegate.modalViewController.modalPresentationStyle = UIModalPresentationPageSheet;
    [self presentViewController:appDelegate.modalViewController animated:YES completion:^{}];
    [appDelegate.modalViewController whichModalToPresent:@"security"];
    
}



#pragma mark
#pragma mark closeFinancialDetails

- (IBAction)closeFinancialDetails:(id)sender
{
    
    for (UILabel *tmpLabel in [self.secondHeaderView subviews]) {
        [tmpLabel removeFromSuperview];
    }
    
    for (UIButton *tmpButton in [self.secondHeaderView subviews]) {
        [tmpButton removeFromSuperview];
    }
    
    if (self.secondHeaderView.frame.size.height > 50) {
        
        self.secondHeaderView.frame = CGRectMake(self.secondHeaderView.frame.origin.x, self.secondHeaderView.frame.origin.y, self.secondHeaderView.frame.size.width, self.secondHeaderView.frame.size.height - 50);
        
    }
    
    self.secondHeaderView.backgroundColor = [UIColor colorWithRed:0.086 green:0.24 blue:0.137 alpha:1];
    
    UILabel* firstHeaderTitel = [[UILabel alloc] initWithFrame:CGRectMake(6., 12., 350., 40.)];
    firstHeaderTitel.backgroundColor = [UIColor clearColor];
    firstHeaderTitel.textColor = [UIColor whiteColor];
    firstHeaderTitel.text = @"  Employer's Details";
    [self setAppFontStyle:@"accordion-header" forView:firstHeaderTitel];
    
    [self setAppFontStyle:@"accordion-header" forView:firstHeaderTitel];
    [self.secondHeaderView addSubview:firstHeaderTitel];
    
    //validate the fields here!
    bool isValid = true;
    
    if([self.industryButton.titleLabel.text isEqualToString:@"Industry"]){
        isValid=false;
        //mark field as invalid
        self.industryButton.backgroundColor = [UIColor yellowColor];
    }else{
        self.industryButton.backgroundColor = [UIColor whiteColor];
    }
    //
    if([self.employmentStatus.titleLabel.text isEqualToString:@"Current Employment Status"]){
        isValid=false;
        //mark field as invalid
        self.employmentStatus.backgroundColor = [UIColor yellowColor];
    }else{
        self.employmentStatus.backgroundColor = [UIColor whiteColor];
    }
    
    if(isValid==false){
        UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Info" message:@"Not all mandatory fields have been completed, please go back and fill them!" delegate:self cancelButtonTitle:@"OKAY" otherButtonTitles: nil];
        [alert show];
        
        
        return;
    }
    
    
    
    [self.accordion setSelectedIndex:1];
    UIImage *image2 = [UIImage imageNamed:@"banner-4a.png"];
    [self.financeHeader setImage:image2];
    
    [self changeFirstHeaderHeightAndAddInfo];
    
    self.firstViewClosed = YES;
    
}

- (void)changeFirstHeaderHeightAndAddInfo
{
    self.firstHeaderView.frame = CGRectMake(self.firstHeaderView.frame.origin.x, self.firstHeaderView.frame.origin.y, self.firstHeaderView.frame.size.width, self.firstHeaderView.frame.size.height + 50);
    self.firstHeaderView.backgroundColor = [UIColor whiteColor];
    
    for (UILabel *tmpLabel in [self.firstHeaderView subviews]) {
        tmpLabel.textColor = [UIColor colorWithRed:0.086 green:0.24 blue:0.137 alpha:1];
    }
    [self drawTopLineForSubView:self.firstHeaderView];
    self.editFirstView = [UIButton buttonWithType:UIButtonTypeCustom];
    self.editFirstView.frame = CGRectMake(880, 5., 81., 42.);
    [self.editFirstView setTitle:@"Edit" forState:UIControlStateNormal];
    [self.editFirstView setImage:[UIImage imageNamed:@"btn-edit.png"] forState:UIControlStateNormal];
    [self.editFirstView setImage:[UIImage imageNamed:@"btn-edit-hover.png"] forState:UIControlStateHighlighted];
    [self.editFirstView addTarget:self action:@selector(editFirstViewAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.firstHeaderView addSubview:self.editFirstView];
    
    UILabel* employmentStatus = [[UILabel alloc] initWithFrame:CGRectMake(290., 12., 500., 30.)];
    employmentStatus.textColor = [UIColor blackColor];
    [self setAppFontStyle:@"label" forView:employmentStatus];
    employmentStatus.backgroundColor = [UIColor clearColor];
    employmentStatus.text = [NSString stringWithFormat:@"Employment Status: %@",self.employmentStatus.titleLabel.text];
    [self.firstHeaderView addSubview:employmentStatus];
    
    UILabel* currentOccupation = [[UILabel alloc] initWithFrame:CGRectMake(290., 40., 500., 30.)];
    currentOccupation.textColor = [UIColor blackColor];
    [self setAppFontStyle:@"label" forView:currentOccupation];
    
    currentOccupation.backgroundColor = [UIColor clearColor];
    currentOccupation.text = [NSString stringWithFormat:@"Current Occupation: %@",self.industryButton.titleLabel.text];
    [self.firstHeaderView addSubview:currentOccupation];
    
}

- (void)editFirstViewAction:(id)sender
{
    self.firstHeaderView.frame = CGRectMake(self.firstHeaderView.frame.origin.x, self.firstHeaderView.frame.origin.y, self.firstHeaderView.frame.size.width, self.firstHeaderView.frame.size.height - 50);
    self.firstHeaderView.backgroundColor = [UIColor colorWithRed:0.086 green:0.24 blue:0.137 alpha:1];
    
    for (UILabel *tmpLabel in [self.firstHeaderView subviews]) {
        [tmpLabel removeFromSuperview];
    }
    
    UILabel* firstHeaderTitel = [[UILabel alloc] initWithFrame:CGRectMake(6., 12., 200., 40.)];
    firstHeaderTitel.backgroundColor = [UIColor clearColor];
    firstHeaderTitel.textColor = [UIColor whiteColor];
    firstHeaderTitel.text = @"  Financial Details";
    [self setAppFontStyle:@"accordion-header" forView:firstHeaderTitel];
    
    [self.firstHeaderView addSubview:firstHeaderTitel];
    
    [self.accordion setSelectedIndex:0];
}

#pragma mark
#pragma mark closeEmployerDetails

- (IBAction)closeEmployerDetails:(id)sender
{
    
    //validate the fields here!
    bool isValid = true;
    
    if(self.employerName.text.length < 1){
        isValid=false;
        //mark field as invalid
        self.employerName.backgroundColor = [UIColor yellowColor];
    }else{
        self.employerName.backgroundColor = [UIColor whiteColor];
    }
    
    if(self.employerCityTextField.text.length < 1)
    {
        isValid=false;
        //mark field as invalid
        self.employerCityTextField.backgroundColor = [UIColor yellowColor];
    }else{
        self.employerCityTextField.backgroundColor = [UIColor whiteColor];
        
    }
    
    //
    if(self.employerStreetAddress.text.length < 1){
        isValid=false;
        //mark field as invalid
        self.employerStreetAddress.backgroundColor = [UIColor yellowColor];
    }else{
        self.employerStreetAddress.backgroundColor = [UIColor whiteColor];
    }
    
    if([self.provinceButton.titleLabel.text isEqualToString:@"Province"]){
        isValid=false;
        //mark field as invalid
        self.provinceButton.backgroundColor = [UIColor yellowColor];
    }else{
        self.provinceButton.backgroundColor = [UIColor whiteColor];
    }
    
    if(self.employerWorkPrefix.text.length != 3){
        isValid=false;
        //mark field as invalid
        self.employerWorkPrefix.backgroundColor = [UIColor yellowColor];
    }else{
        self.employerWorkPrefix.backgroundColor = [UIColor whiteColor];
    }
    if(self.employerWorkPhoneNumber.text.length!=4){
        isValid=false;
        //mark field as invalid
        self.employerWorkPhoneNumber.backgroundColor = [UIColor yellowColor];
    }else{
        self.employerWorkPhoneNumber.backgroundColor = [UIColor whiteColor];
    }
    if(self.employerAreaCode.text.length!=3){
        isValid=false;
        //mark field as invalid
        self.employerAreaCode.backgroundColor = [UIColor yellowColor];
    }else{
        self.employerAreaCode.backgroundColor = [UIColor whiteColor];
    }
    
    if(isValid==false){
        UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Info" message:@"Not all mandatory fields have been completed, please go back and fill them!" delegate:self cancelButtonTitle:@"OKAY" otherButtonTitles: nil];
        [alert show];
        
        
        return;
    }
    
    NSString *query = [NSString stringWithFormat:@"%@ %@ %@", self.employerStreetAddress.text, self.employerCityTextField.text, self.provinceButton.titleLabel.text];
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    [geocoder geocodeAddressString:query completionHandler:^(NSArray *placemarks, NSError *error){
        if ([placemarks count] > 0) {
            
            self.employerStreetAddress.backgroundColor = [UIColor whiteColor];
            UIImage *image2 = [UIImage imageNamed:@"banner-4b.png"];
            [self.financeHeader setImage:image2];
            [self.accordion setSelectedIndex:2];
            
            [self changeSecondHeaderHeightAndAddInfo];
            
            self.secondViewClosed = YES;
            
            
            
            
        } else {
            
            self.employerStreetAddress.backgroundColor = [UIColor yellowColor];
            
            UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"We could not find your employer's addresss.  Please make sure it was entered correctly." delegate:self cancelButtonTitle:@"OKAY" otherButtonTitles: nil];
            [alert show];
            
        }}];
    
   
    
}

- (void)changeSecondHeaderHeightAndAddInfo
{
    self.secondHeaderView.frame = CGRectMake(self.secondHeaderView.frame.origin.x, self.secondHeaderView.frame.origin.y, self.secondHeaderView.frame.size.width, self.secondHeaderView.frame.size.height + 50);
    self.secondHeaderView.backgroundColor = [UIColor whiteColor];
    
    for (UILabel *tmpLabel in [self.secondHeaderView subviews]) {
        tmpLabel.textColor = [UIColor colorWithRed:0.086 green:0.24 blue:0.137 alpha:1];
    }
    [self drawTopLineForSubView:self.secondHeaderView];

    self.editSecondView = [UIButton buttonWithType:UIButtonTypeCustom];
    self.editSecondView.frame = CGRectMake(880., 5., 81., 42.);
    [self.editSecondView setTitle:@"Edit" forState:UIControlStateNormal];
    [self.editSecondView setImage:[UIImage imageNamed:@"btn-edit.png"] forState:UIControlStateNormal];
    [self.editSecondView setImage:[UIImage imageNamed:@"btn-edit-hover.png"] forState:UIControlStateHighlighted];
    [self.editSecondView addTarget:self action:@selector(editSecondViewAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.secondHeaderView addSubview:self.editSecondView];
    
    UILabel* employerName = [[UILabel alloc] initWithFrame:CGRectMake(290., 12., 300., 30.)];
    employerName.textColor = [UIColor blackColor];
    [self setAppFontStyle:@"label" forView:employerName];
    
    employerName.backgroundColor = [UIColor clearColor];
    employerName.numberOfLines = 0;
    employerName.text = [NSString stringWithFormat:@"Employment Name: %@",self.employerName.text];
    [self.secondHeaderView addSubview:employerName];
    
    UILabel* startDateLabel = [[UILabel alloc] initWithFrame:CGRectMake(290., 33., 300., 30.)];
    startDateLabel.textColor = [UIColor blackColor];
    [self setAppFontStyle:@"data-label-bold" forView:startDateLabel];
    
    startDateLabel.backgroundColor = [UIColor clearColor];
    startDateLabel.numberOfLines = 0;
    startDateLabel.text = [NSString stringWithFormat:@"Start date:"];
    [self.secondHeaderView addSubview:startDateLabel];
    
    UILabel* employerStreetAddressLabel = [[UILabel alloc] initWithFrame:CGRectMake(590., 3., 400., 30.)];
    employerStreetAddressLabel.textColor = [UIColor blackColor];
    employerStreetAddressLabel.numberOfLines = 0;
    
    employerStreetAddressLabel.backgroundColor = [UIColor clearColor];
    employerStreetAddressLabel.text = [NSString stringWithFormat:@"%@ %@ %@",self.employerStreetAddress.text, self.employerCityTextField.text, self.provinceButton.titleLabel.text];
    [self.secondHeaderView addSubview:employerStreetAddressLabel];
    
    
    
}

- (void)editSecondViewAction:(id)sender
{
    self.secondHeaderView.frame = CGRectMake(self.secondHeaderView.frame.origin.x, self.secondHeaderView.frame.origin.y, self.secondHeaderView.frame.size.width, self.secondHeaderView.frame.size.height - 50);
    self.secondHeaderView.backgroundColor = [UIColor colorWithRed:0.086 green:0.24 blue:0.137 alpha:1];
    
    for (UILabel *tmpLabel in [self.secondHeaderView subviews]) {
        [tmpLabel removeFromSuperview];
    }
    
    UILabel* firstHeaderTitel = [[UILabel alloc] initWithFrame:CGRectMake(6., 12., 350., 40.)];
    firstHeaderTitel.backgroundColor = [UIColor clearColor];
    firstHeaderTitel.textColor = [UIColor whiteColor];
    firstHeaderTitel.text = @"  Employer's Details";
    [self setAppFontStyle:@"accordion-header" forView:firstHeaderTitel];
    
    [self.secondHeaderView addSubview:firstHeaderTitel];
    
    [self.accordion setSelectedIndex:1];
}

#pragma mark
#pragma mark closeIncomeAndCreditLimitDetails

- (IBAction)closeIncomeAndCreditLimitDetails:(id)sender
{
    bool isValid = true;
    if([self.grossAnualIncomeTextField.text isEqualToString:@""] &&
       [self.householdIncomeTextField.text isEqualToString:@""]){
        isValid=false;
        //mark field as invalid
        self.grossAnualIncomeTextField.backgroundColor = [UIColor yellowColor];
        self.householdIncomeTextField.backgroundColor = [UIColor yellowColor];
        
    }else{
        
        self.grossAnualIncomeTextField.backgroundColor = [UIColor whiteColor];
        self.householdIncomeTextField.backgroundColor = [UIColor whiteColor];
    }
    
    
    if(isValid==false){
        UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Info" message:@"Not all mandatory fields have been completed, please go back and fill them!" delegate:self cancelButtonTitle:@"OKAY" otherButtonTitles: nil];
        [alert show];
        
        
        return;
    }
    
    
    
    
    
    [self.accordion setSelectedIndex:3];
    [self changeThirdHeaderHeightAndAddInfo];
    self.bextSteptButton.enabled = YES;
    
}

- (void)changeThirdHeaderHeightAndAddInfo
{
    self.thirdHeaderView.frame = CGRectMake(self.thirdHeaderView.frame.origin.x, self.thirdHeaderView.frame.origin.y, self.thirdHeaderView.frame.size.width, self.thirdHeaderView.frame.size.height + 50);
    self.thirdHeaderView.backgroundColor = [UIColor whiteColor];
    
    for (UILabel *tmpLabel in [self.thirdHeaderView subviews]) {
        tmpLabel.textColor = [UIColor colorWithRed:0.086 green:0.24 blue:0.137 alpha:1];
    }
    [self drawTopLineForSubView:self.thirdHeaderView];

    self.editThirdView = [UIButton buttonWithType:UIButtonTypeCustom];
    self.editThirdView.frame = CGRectMake(880., 5., 81., 42.);
    [self.editThirdView setTitle:@"Edit" forState:UIControlStateNormal];
    [self.editThirdView setImage:[UIImage imageNamed:@"btn-edit.png"] forState:UIControlStateNormal];
    [self.editThirdView setImage:[UIImage imageNamed:@"btn-edit-hover.png"] forState:UIControlStateHighlighted];
    [self.editThirdView addTarget:self action:@selector(editThirdViewAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.thirdHeaderView addSubview:self.editThirdView];
    
    UILabel* employerName = [[UILabel alloc] initWithFrame:CGRectMake(290., 3., 300., 30.)];
    employerName.textColor = [UIColor blackColor];
    [self setAppFontStyle:@"data-label" forView:employerName];
    employerName.backgroundColor = [UIColor clearColor];
    employerName.numberOfLines = 0;
    employerName.text = [NSString stringWithFormat:@"Requested Credit Limit: %@",self.requestedCreditLimitButton.titleLabel.text];
    [self.thirdHeaderView addSubview:employerName];
    
    UILabel* startDateLabel = [[UILabel alloc] initWithFrame:CGRectMake(290., 33., 300., 30.)];
    startDateLabel.textColor = [UIColor blackColor];
    [self setAppFontStyle:@"data-label" forView:startDateLabel];
    
    startDateLabel.backgroundColor = [UIColor clearColor];
    startDateLabel.numberOfLines = 0;
    startDateLabel.text = [NSString stringWithFormat:@"Gross Anual Income: %@", self.grossAnualIncomeTextField.text];
    [self.thirdHeaderView addSubview:startDateLabel];
    
}

- (void)editThirdViewAction:(id)sender
{
    self.thirdHeaderView.frame = CGRectMake(self.thirdHeaderView.frame.origin.x, self.thirdHeaderView.frame.origin.y, self.thirdHeaderView.frame.size.width, self.thirdHeaderView.frame.size.height - 50);
    self.thirdHeaderView.backgroundColor = [UIColor colorWithRed:0.086 green:0.24 blue:0.137 alpha:1];
    
    for (UILabel *tmpLabel in [self.thirdHeaderView subviews]) {
        [tmpLabel removeFromSuperview];
    }
    
    UILabel* firstHeaderTitel = [[UILabel alloc] initWithFrame:CGRectMake(6., 12., 200., 40.)];
    firstHeaderTitel.backgroundColor = [UIColor clearColor];
    firstHeaderTitel.textColor = [UIColor whiteColor];
    firstHeaderTitel.text = @"  Income and Credit Limit Details";
    [self setAppFontStyle:@"accordion-header" forView:firstHeaderTitel];
    
    [self.thirdHeaderView addSubview:firstHeaderTitel];
    
    [self.accordion setSelectedIndex:2];
}

#pragma mark
#pragma mark requesteCreditLimitAction

- (IBAction)requesteCreditLimitAction:(id)sender
{
    
    UIViewController* popoverContent = [[UIViewController alloc] init]; //ViewController
    
    UIView *popoverView = [[UIView alloc] init];   //view
    popoverView.backgroundColor = [UIColor grayColor];
    
    UIToolbar* toolbar = [[UIToolbar alloc] initWithFrame: CGRectMake(0.0, 0.0, 320., 44.0)];
    toolbar.barStyle = UIBarStyleBlack;
    
    UIBarButtonItem* space = [[UIBarButtonItem alloc] initWithBarButtonSystemItem: UIBarButtonSystemItemFlexibleSpace
                                                                           target: nil
                                                                           action: nil];
    UIBarButtonItem* doneButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem: UIBarButtonSystemItemDone
                                                                                target: self
                                                                                action: @selector(selectRequestedCreditLimit)];
    
    doneButton.tintColor = [UIColor blackColor];
    
    NSMutableArray* toolbarItems = [NSMutableArray array];
    [toolbarItems addObject:space];
    [toolbarItems addObject:doneButton];
    toolbar.items = toolbarItems;
    
    [popoverView addSubview:toolbar];
    
    self.requesteCreditLimitPicker = [[UIPickerView alloc]init];//Date picker
    self.requesteCreditLimitPicker.frame = CGRectMake(0,44,320, 216);
    self.requesteCreditLimitPicker.dataSource = self;
    self.requesteCreditLimitPicker.delegate = self;
    self.requesteCreditLimitPicker.showsSelectionIndicator = YES;
    [popoverView addSubview:self.requesteCreditLimitPicker];
    
    CGRect frame;
    
    frame = self.requestedCreditLimitButton.frame;
    frame.origin.y = frame.origin.y + 240;
    
    popoverContent.view = popoverView;
    self.popoverController4 = [[UIPopoverController alloc] initWithContentViewController:popoverContent];
    self.popoverController4.delegate = self;
    [self.popoverController4 setPopoverContentSize:CGSizeMake(320, 260) animated:NO];
    [self.popoverController4 presentPopoverFromRect:frame inView:self.accordionViewScrollView permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
    
}

- (void)selectRequestedCreditLimit{
    
    
    
    [self.requestedCreditLimitButton setTitle:[NSString stringWithFormat:@"%@",[self.requesteCreditLimitArray objectAtIndex:[self.requesteCreditLimitPicker selectedRowInComponent:0]]] forState:UIControlStateNormal];
//    [self.requestedCreditLimitButton setTitle:[NSString stringWithFormat:@"%@",self.requesteCreditLimitString] forState:UIControlStateNormal];
    [self.popoverController4 dismissPopoverAnimated:YES];
    
    if (self.firstViewClosed && self.secondViewClosed) {
        
        if (![self.requestedCreditLimitButton.titleLabel.text isEqualToString:@"Limit"] && self.grossAnualIncomeTextField.text.length > 1 && self.householdIncomeTextField.text.length > 1) {
            self.bextSteptButton.enabled = YES;
        }
    }
    
}

- (IBAction)chooseStartDate:(id)sender
{
    
    UIViewController* popoverContent = [[UIViewController alloc] init]; //ViewController
    
    UIView *popoverView = [[UIView alloc] init];   //view
    popoverView.backgroundColor = [UIColor grayColor];
    
    
    UIToolbar* toolbar = [[UIToolbar alloc] initWithFrame: CGRectMake(0.0, 0.0, 320., 44.0)];
    toolbar.barStyle = UIBarStyleBlack;
    
    UIBarButtonItem* space = [[UIBarButtonItem alloc] initWithBarButtonSystemItem: UIBarButtonSystemItemFlexibleSpace
                                                                           target: nil
                                                                           action: nil];
    UIBarButtonItem* doneButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem: UIBarButtonSystemItemDone
                                                                                target: self
                                                                                action: @selector(selectStartDate)];
    
    doneButton.tintColor = [UIColor blackColor];
    
    NSMutableArray* toolbarItems = [NSMutableArray array];
    [toolbarItems addObject:space];
    [toolbarItems addObject:doneButton];
    toolbar.items = toolbarItems;
    
    [popoverView addSubview:toolbar];
    
    self.startDatePicker = [[UIDatePicker alloc]init];//Date picker
    self.startDatePicker.frame = CGRectMake(0,44,320, 216);
    self.startDatePicker.datePickerMode = UIDatePickerModeDate;
    [self.startDatePicker setTag:10];
    [self.startDatePicker addTarget:self action:@selector(result:) forControlEvents:UIControlEventValueChanged];
    [popoverView addSubview:self.startDatePicker];
    
    CGRect frame;
    
    frame = self.startDateButton.frame;
    frame.origin.y = frame.origin.y + 150;
    
    popoverContent.view = popoverView;
    self.popoverController5 = [[UIPopoverController alloc] initWithContentViewController:popoverContent];
    self.popoverController5.delegate = self;
    [self.popoverController5 setPopoverContentSize:CGSizeMake(320, 264) animated:NO];
    [self.popoverController5 presentPopoverFromRect:frame inView:self.accordionViewScrollView permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];//tempButton.frame where you need you can put that frame
    
}

- (void)selectStartDate
{
    
    AppDelegate *appDelegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
    
    
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
	df.dateStyle = NSDateFormatterMediumStyle;
	NSLog(@"%@",self.startDatePicker.date);
    NSDateFormatter *formatter;
    NSString        *dateString;
    
    formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"MMM dd, yyyy"];
    
    dateString = [formatter stringFromDate:self.startDatePicker.date];
    [self.startDateButton setTitle:dateString forState:UIControlStateNormal];
    [appDelegate addInfoToUser:self.startDatePicker.date andFieldToAddItTo:@"startDateForWork"];
    
    [self.popoverController5 dismissPopoverAnimated:YES];
}

- (void)result:(id)sender
{
    
    
    NSDate* now = [NSDate date];
    
    NSLog(@"%f",[self.startDatePicker.date timeIntervalSinceDate:now]);
    
    NSTimeInterval theTimeInterval = [self.startDatePicker.date timeIntervalSinceDate:now];
    
    NSCalendar *sysCalendar = [NSCalendar currentCalendar];
    
    NSDate *date1 = [[NSDate alloc] init];
    NSDate *date2 = [[NSDate alloc] initWithTimeInterval:theTimeInterval sinceDate:date1];
    
    unsigned int unitFlags = NSHourCalendarUnit | NSMinuteCalendarUnit | NSDayCalendarUnit | NSMonthCalendarUnit | NSYearCalendarUnit;
    
    NSDateComponents *breakdownInfo = [sysCalendar components:unitFlags fromDate:date1  toDate:date2  options:0];
    
    NSLog(@"Break down: %dyears", [breakdownInfo year]);
    
    
}


- (IBAction)selectCurrentOccupation:(id)sender
{
    
    UIViewController* popoverContent = [[UIViewController alloc] init]; //ViewController
    
    UIView *popoverView = [[UIView alloc] init];   //view
    popoverView.backgroundColor = [UIColor grayColor];
    
    
    UIToolbar* toolbar = [[UIToolbar alloc] initWithFrame: CGRectMake(0.0, 0.0, 480., 44.0)];
    toolbar.barStyle = UIBarStyleBlack;
    
    UIBarButtonItem* space = [[UIBarButtonItem alloc] initWithBarButtonSystemItem: UIBarButtonSystemItemFlexibleSpace
                                                                           target: nil
                                                                           action: nil];
    UIBarButtonItem* doneButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem: UIBarButtonSystemItemDone
                                                                                target: self
                                                                                action: @selector(chooseCurrentOccupation)];
    
    doneButton.tintColor = [UIColor blackColor];
    
    NSMutableArray* toolbarItems = [NSMutableArray array];
    [toolbarItems addObject:space];
    [toolbarItems addObject:doneButton];
    toolbar.items = toolbarItems;
    
    [popoverView addSubview:toolbar];
    
    self.selectCurrentOcupationPicker = [[UIPickerView alloc]init];//Date picker
    self.selectCurrentOcupationPicker.frame = CGRectMake(0,44,480., 216);
    self.selectCurrentOcupationPicker.dataSource = self;
    self.selectCurrentOcupationPicker.delegate = self;
    self.selectCurrentOcupationPicker.showsSelectionIndicator = YES;
    [popoverView addSubview:self.selectCurrentOcupationPicker];
    
    CGRect frame;
    
    frame = self.curretOccupationButton.frame;
    frame.origin.y = frame.origin.y + 50;
    
    popoverContent.view = popoverView;
    self.popoverController6 = [[UIPopoverController alloc] initWithContentViewController:popoverContent];
    self.popoverController6.delegate = self;
    [self.popoverController6 setPopoverContentSize:CGSizeMake(480., 260) animated:NO];
    [self.popoverController6 presentPopoverFromRect:frame inView:self.accordionViewScrollView permittedArrowDirections:UIPopoverArrowDirectionRight animated:YES];
    
}

- (IBAction)startOver:(id)sender
{
    
    AppDelegate *appDelegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
    
    [appDelegate startOver];
    
    
}

- (void)chooseCurrentOccupation{
    
    if ([self.industryButton.titleLabel.text isEqualToString:@"Industry"] || [self.industryButton.titleLabel.text isEqualToString:@"Other"]) {
        [self.popoverController6 dismissPopoverAnimated:YES];
        return;
    }
    
    NSString* current = [NSString stringWithFormat:@"%@",[self.occupationArray objectAtIndex:[self.occupationPicker selectedRowInComponent:0]]];
    NSArray* array2 = [NSArray new];
    
    
    if ([current isEqualToString:@"Accounting/Finance/Insurance"]) {
        
        array2 = self.accountingFinanceInsurance;
        
    }else if([current isEqualToString:@"Installation/Maintenance/Repair"]){
        
        array2 = self.installationMaintenanceRepair;
        
    }else if([current isEqualToString:@"IT/Software Development"]){
        
        array2 = self.ITSoftwareDevelopment;
        
    }else if([current isEqualToString:@"Legal"]){
        
        array2 = self.legal;
        
    }else if([current isEqualToString:@"Administrative/Clarical"]){
        
        array2 = self.administrativeClerical;
        
    }else if([current isEqualToString:@"Logistics/Transportation"]){
        
        array2 = self.logisticsTransportation;
        
    }else if([current isEqualToString:@"Banking/Real Estate/Mortgage Professionals"]){
        
        array2 = self.bankingRealEstateMortgageProfessionals;
        
    }else if([current isEqualToString:@"Biotech/R&D/Science"]){
        
        array2 = self.biotechRDScience;
        
    }else if([current isEqualToString:@"Manufacturing/Production/Operations"]){
        
        array2 = self.manufacturingProductionOperations;
        
    }else if([current isEqualToString:@"Building Construction/Skilled Trades"]){
        
        array2 = self.buildingConstructionSkilledTrades;
        
    }else if([current isEqualToString:@"Marketing/Product"]){
        
        array2 = self.marketingProduct;
        
    }else if([current isEqualToString:@"Business/Strategic Management"]){
        
        array2 = self.businessStrategicManagement;
        
    }
    
    //there are no jobs for this industry
    if ([array2 count] == 0) {
        [self.popoverController6 dismissPopoverAnimated:YES];
        return;
    }
    
    NSString* otherString = [NSString stringWithFormat:@"%@",[array2 objectAtIndex:[self.selectCurrentOcupationPicker selectedRowInComponent:0]]];
    
    [otherString lowercaseString];
    
    if ([otherString rangeOfString:@"Other"].location == NSNotFound) {
        self.specifyOtherOcupationtextField.hidden = YES;
        self.otherOccupationSelected2 = NO;
        
        
    } else {
        
        self.specifyOtherOcupationtextField.hidden = NO;
        self.otherOccupationSelected2 = YES;
        
    }
    
    [self.curretOccupationButton setTitle:[NSString stringWithFormat:@"%@",[array2 objectAtIndex:[self.selectCurrentOcupationPicker selectedRowInComponent:0]]] forState:UIControlStateNormal];
    [self.popoverController6 dismissPopoverAnimated:YES];
    
    
    
}

- (IBAction)selectCountryAction:(id)sender
{
    
    UIViewController* popoverContent = [[UIViewController alloc] init]; //ViewController
    
    UIView *popoverView = [[UIView alloc] init];   //view
    popoverView.backgroundColor = [UIColor grayColor];
    
    UIToolbar* toolbar = [[UIToolbar alloc] initWithFrame: CGRectMake(0.0, 0.0, 320., 44.0)];
    toolbar.barStyle = UIBarStyleBlack;
    
    UIBarButtonItem* space = [[UIBarButtonItem alloc] initWithBarButtonSystemItem: UIBarButtonSystemItemFlexibleSpace
                                                                           target: nil
                                                                           action: nil];
    UIBarButtonItem* doneButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem: UIBarButtonSystemItemDone
                                                                                target: self
                                                                                action: @selector(selectCountry)];
    
    doneButton.tintColor = [UIColor blackColor];
    
    NSMutableArray* toolbarItems = [NSMutableArray array];
    [toolbarItems addObject:space];
    [toolbarItems addObject:doneButton];
    toolbar.items = toolbarItems;
    
    [popoverView addSubview:toolbar];
    
    self.selectCountryPicker = [[UIPickerView alloc]init];//Date picker
    self.selectCountryPicker.frame = CGRectMake(0,44,320, 216);
    self.selectCountryPicker.dataSource = self;
    self.selectCountryPicker.delegate = self;
    self.selectCountryPicker.showsSelectionIndicator = YES;
    [popoverView addSubview:self.selectCountryPicker];
    
    if (![self.chooseCountryButton.titleLabel.text isEqualToString:@"Country"]) {
        
        int index = [self.countryArray indexOfObject:[NSString stringWithFormat:@"%@",self.chooseCountryButton.titleLabel.text]];
        
        [self.selectCountryPicker selectRow:index inComponent:0 animated:YES];
        
    }
    
    CGRect frame;
    
    frame = self.chooseCountryButton.frame;
    frame.origin.y = frame.origin.y + 150;
    
    popoverContent.view = popoverView;
    self.popoverController7 = [[UIPopoverController alloc] initWithContentViewController:popoverContent];
    self.popoverController7.delegate = self;
    [self.popoverController7 setPopoverContentSize:CGSizeMake(320, 260) animated:NO];
    [self.popoverController7 presentPopoverFromRect:frame inView:self.accordionViewScrollView permittedArrowDirections:UIPopoverArrowDirectionRight animated:YES];
    
}

- (void)selectCountry
{
    
    [self.chooseCountryButton setTitle:[NSString stringWithFormat:@"%@",[self.countryArray objectAtIndex:[self.selectCountryPicker selectedRowInComponent:0]]] forState:UIControlStateNormal];
    [self.popoverController7 dismissPopoverAnimated:YES];
    
}

@end
