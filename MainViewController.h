//
//  MainViewController.h
//  TD VISA FORM
//
//  Created by MATTHEW KANTOR on 12/12/12.
//  Copyright (c) 2012 Adrian Somesan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController

@property (nonatomic, strong) NSTimer *idleTimer;
@property (nonatomic, readwrite)BOOL clearUserDataFromTheApp;
 

-(void)setFontFamily:(NSString*)fontFamily forView:(UIView*)view andSubViews:(BOOL)isSubViews;
-(void)resetIdleTimer;

@end
