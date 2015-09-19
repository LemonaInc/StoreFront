//
//  SiteDetailViewController.m
//  findr
//
//  Created by Jaxon Stevens on 05/08/14.
//  Copyright (c) 2014 Lemona Inc. All rights reserved.
//

#import "SiteDetailViewController.h"
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>


@interface SiteDetailViewController()
@property (nonatomic, copy) NSString *phoneNumber;
@property (nonatomic, weak) IBOutlet UIScrollView *scrollContent;
@end


@implementation SiteDetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Do any additional setup after loading the view, typically from a nib.
    
        self.navigationController.navigationBar.hidden = YES;
      [_scrollContent setContentOffset:CGPointMake(0, 0) animated:YES];
    
}

-(IBAction)backBtnTapped:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning
{
    
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}















    


@end
