//
//  EBViewController.h
//  EBViewControllerSwitcher
//
//  Created by Ezequiel Becerra on 07/22/2015.
//  Copyright (c) 2015 Ezequiel Becerra. All rights reserved.
//

@import UIKit;

@interface EBViewController : UIViewController

- (IBAction)newViewControllerNoAnimationButtonPressed:(id)sender;
- (IBAction)newViewControllerFadeAnimationButtonPressed:(id)sender;
- (IBAction)newViewControllerFancyAnimationButtonPressed:(id)sender;

@end
