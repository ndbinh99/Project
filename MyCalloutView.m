// Several authors. Based on code by Asynchrony Solutions.
// See http://stackoverflow.com/questions/8018841/customize-the-mkannotationview-callout/8019308#8019308

#import "MyCalloutView.h"


@implementation MyCalloutView

@synthesize title = _title;


- (IBAction)closePopup:(id)sender {
}


    
       
 
    


- (IBAction)cancelBank:(id)sender {
    
    [self  removeFromSuperview];
}

-(IBAction) handleTouch:(id)sender {
    NSLog(@"touch %@", sender);
}


- (id)initWithAnnotation:(CalloutAnnotation*)annotation {
    self = [super initWithAnnotation:annotation];
    
    NSString *title = [annotation.content.values objectForKey:@"branchId"];
   
    self.title.text = title;
    
    //set all the other stuff here
    
    

    
    return self;
}

- (IBAction)chooseBank:(id)sender {
    //start function
    NSString *notificationName = MAP_NOTIFIER_KEY;
    
    NSString *key = @"BranchId";
    
    NSDictionary *dictionary = [NSDictionary dictionaryWithObject:self.title.text forKey:key];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:notificationName object:self.title.text userInfo:dictionary];
   //this is buggy!
    [self  removeFromSuperview];
    
}

- (void)setAnnotation:(CalloutAnnotation *)annotation
{
    self.title.text = [annotation.content.values objectForKey:@"branchid"];
    self.address.text = [annotation.content.values objectForKey:@"address"];
    self.city.text = [[NSString stringWithFormat:@"%@ %@", [annotation.content.values objectForKey:@"city"], [annotation.content.values objectForKey:@"prov"]]capitalizedString];;
    [super setAnnotation:annotation];
}



@end
