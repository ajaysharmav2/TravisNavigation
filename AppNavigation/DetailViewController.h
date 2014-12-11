//
//  DetailViewController.h
//  AppNavigation
//
//  Created by Ajay Sharma on 12/10/14.
//  Copyright (c) 2014 ___v2Tech Ventures___. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

