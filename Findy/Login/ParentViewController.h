//
//  ParentViewController.h
//  iMate
//
//  Created by Jimmy on 23/05/14.
//  Copyright (c) 2014 MyAppTemplates. All rights reserved.
//

#import <UIKit/UIKit.h>


/**
 *  ViewControllers inheriting this class will have iMate image on its navigation bar title.ß
 */
@interface ParentViewController : UIViewController

-(UIViewController *) viewFromStoryboard:(NSString *)storyboardID;
@end
