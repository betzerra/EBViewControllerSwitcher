//
//  TTFFadeTransition.m
//  EBViewControllerSwitcher
//
//  Created by Ezequiel A Becerra on 4/29/14.
//  Copyright (c) 2014 Betzerra. All rights reserved.
//

#import "FadeTransition.h"

@implementation FadeTransition

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{
    return 0.3;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext{
    // Get the two view controllers
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    // Get the container view - where the animation has to happen
    UIView *containerView = [transitionContext containerView];
    
    // Add the two VC views to the container
    [containerView addSubview:fromVC.view];
    [containerView addSubview:toVC.view];
    
    toVC.view.alpha = 0.0;
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext]
                          delay:0
                        options:0
                     animations:^{
                         toVC.view.alpha = 1.f;
                     }
                     completion:^(BOOL finished) {
                         // Let's get rid of the old VC view
                         [fromVC.view removeFromSuperview];
                         // And then we need to tell the context that we're done
                         [transitionContext completeTransition:YES];
                     }];
}

@end
