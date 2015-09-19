//
//  ParentViewController.m
//  iMate
//
//  Created by Jimmy on 23/05/14.
//  Copyright (c) 2014 MyAppTemplates. All rights reserved.
//

#import "ParentViewController.h"


@interface ParentViewController ()

@end

@implementation ParentViewController


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
    // Sets iMate logo as navigation bar title if there is no title available
    if (self.title.length == 0)
        self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"logo-topbar.png"]];
    else
        self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
    
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    // Set search icon as right bar button item for all the view controllers inherited by this controller.
    
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    
    
    
}


-(UIViewController *) viewFromStoryboard:(NSString *)storyboardID
{
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController * controller = [storyBoard instantiateViewControllerWithIdentifier:storyboardID];
    
    return controller;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
