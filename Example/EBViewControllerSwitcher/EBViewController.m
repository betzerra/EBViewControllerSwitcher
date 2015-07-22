//
//  EBViewController.m
//  EBViewControllerSwitcher
//
//  Created by Ezequiel Becerra on 07/22/2015.
//  Copyright (c) 2015 Ezequiel Becerra. All rights reserved.
//

#import "EBViewController.h"

//  Pods
@import EBViewControllerSwitcher;

//  Custom Transitions
#import "FadeTransition.h"
#import "ShrinkTransition.h"

@interface EBViewController ()

@end

@implementation EBViewController

#pragma mark - Public

- (IBAction)newViewControllerNoAnimationButtonPressed:(id)sender {
  UIViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"viewController1"];
  [self.eb_controllerSwitcher setViewController:vc animator:nil];
}

- (IBAction)newViewControllerFadeAnimationButtonPressed:(id)sender {
  FadeTransition *animator = [[FadeTransition alloc] init];
  
  UIViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"viewController1"];
  [self.eb_controllerSwitcher setViewController:vc animator:animator];
}

- (IBAction)newViewControllerFancyAnimationButtonPressed:(id)sender {
  ShrinkTransition *animator = [[ShrinkTransition alloc] init];
  
  UIViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"viewController1"];
  [self.eb_controllerSwitcher setViewController:vc animator:animator];
}

- (void)viewDidLoad {
  [super viewDidLoad];
  
  NSArray *colors = @[
                      [UIColor redColor],
                      [UIColor blueColor],
                      [UIColor greenColor],
                      [UIColor brownColor],
                      [UIColor blackColor],
                      [UIColor darkGrayColor]
                      ];
  NSInteger randomColorIndex = arc4random() % [colors count];
  
  self.view.backgroundColor = colors[randomColorIndex];
}

@end
