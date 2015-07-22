//
//  EBViewControllerSwitcher.h
//  EBViewControllerSwitcher
//
//  Created by Ezequiel Becerra on 4/8/15.
//  Copyright (c) 2015 Betzerra. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIViewController+EBViewControllerSwitcher.h"

@interface EBViewControllerSwitcher : UIViewController

@property (readonly) UIViewController *currentViewController;
@property (strong) NSString *initialViewControllerIdentifier;

- (void) setViewController:(UIViewController *)toViewController
                  animator:(NSObject <UIViewControllerAnimatedTransitioning>*)animator;
@end
