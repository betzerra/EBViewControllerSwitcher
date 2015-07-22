//
//  EBViewControllerSwitcher.m
//  EBViewControllerSwitcher
//
//  Created by Ezequiel Becerra on 4/8/15.
//  Copyright (c) 2015 Betzerra. All rights reserved.
//

#import "EBViewControllerSwitcher.h"

//  Helpers
#import "EBTransitionContext.h"

@interface EBViewControllerSwitcher()

@end

@implementation EBViewControllerSwitcher

#pragma mark - Private


#pragma mark - Public

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //  If there is an initialViewControllerIdentifier set, instantiate that
    if (self.initialViewControllerIdentifier) {
        UIViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:self.initialViewControllerIdentifier];
        [self setViewController:vc animator:nil];
    }
}

- (void) setViewController:(UIViewController *)toViewController
                  animator:(NSObject<UIViewControllerAnimatedTransitioning> *)animator {
    
    dispatch_async(dispatch_get_main_queue(), ^{
        if (!animator) {
            //  No animator, so there's no transition.
            [self willMoveToParentViewController:nil];
            [self addChildViewController:toViewController];
            [self.view addSubview:toViewController.view];
            
            [self.currentViewController.view removeFromSuperview];
            [self.currentViewController removeFromParentViewController];
            [toViewController didMoveToParentViewController:self];
            
            _currentViewController = toViewController;
            [self setNeedsStatusBarAppearanceUpdate];            
        } else {
            //  Will use animator on parameter
            [self willMoveToParentViewController:nil];
            [self addChildViewController:toViewController];
            
            EBTransitionContext *transitionContext = [[EBTransitionContext alloc] initWithFromViewController:self.currentViewController
                                                                                            toViewController:toViewController];
            
            transitionContext.animated = YES;
            transitionContext.interactive = NO;
            transitionContext.completionBlock = ^(BOOL didComplete) {
                [self.currentViewController.view removeFromSuperview];
                [self.currentViewController removeFromParentViewController];
                [toViewController didMoveToParentViewController:self];
                
                //  If animator implements animationEnded: call it
                if ([animator respondsToSelector:@selector (animationEnded:)]) {
                    [animator animationEnded:didComplete];
                }
                
                _currentViewController = toViewController;
                [self setNeedsStatusBarAppearanceUpdate];
            };
            
            [animator animateTransition:transitionContext];
        }
    });
}

- (UIStatusBarStyle)preferredStatusBarStyle {
  UIStatusBarStyle retVal = UIStatusBarStyleDefault;
  
  if (self.currentViewController) {
    if ([self.currentViewController respondsToSelector:@selector(selectedViewController)]) {
      // UITabBarController has a selectedViewController, so we have to forward that call to it
      UIViewController *selectedViewController = [self.currentViewController performSelector:@selector(selectedViewController) withObject:nil];
      retVal = [selectedViewController preferredStatusBarStyle];
      
    } else if ([self.currentViewController respondsToSelector:@selector(topViewController)]) {
      //  UINavigationController has a topViewController, so we have to forward taht call to it
      UIViewController *topViewController = [(UINavigationController *)self.currentViewController topViewController];
      retVal = [topViewController preferredStatusBarStyle];
      
    } else {
      retVal = [self.currentViewController preferredStatusBarStyle];
    }
  }
  
  return retVal;
}
@end
