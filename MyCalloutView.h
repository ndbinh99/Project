
// Several authors. Based on code by Asynchrony Solutions.
// See http://stackoverflow.com/questions/8018841/customize-the-mkannotationview-callout/8019308#8019308

#import "CalloutView.h"
#import "CalloutAnnotation.h"

@interface MyCalloutView : CalloutView

@property (nonatomic, retain) IBOutlet UILabel* title;
@property (strong, nonatomic) IBOutlet UIButton *chooseBankButton;
@property (strong, nonatomic) IBOutlet UILabel *address;
@property (strong, nonatomic) IBOutlet UILabel *city;
@property (strong, nonatomic) IBOutlet UILabel *monday;

@property (strong, nonatomic) IBOutlet UILabel *tuesday;
@property (strong, nonatomic) IBOutlet UILabel *wednesday;
@property (strong, nonatomic) IBOutlet UILabel *thursday;
@property (strong, nonatomic) IBOutlet UILabel *friday;
@property (strong, nonatomic) IBOutlet UILabel *saturday;
@property (strong, nonatomic) IBOutlet UILabel *sunday;

//small one

@property (strong, nonatomic) IBOutlet UILabel *smallTitle;
@property (strong, nonatomic) IBOutlet UILabel *smallAddress;
@property (strong, nonatomic) IBOutlet UILabel *smallCity;
- (IBAction)smallDone:(id)sender;
- (IBAction)smallChooseBranch:(id)sender;



- (IBAction)cancelBank:(id)sender;


- (IBAction) handleTouch:(id)sender;
- (id) initWithAnnotation:(CalloutAnnotation*)annotation;
- (IBAction)chooseBank:(id)sender;
- (void)Register_Notification:(NSString*)branch;
@end
