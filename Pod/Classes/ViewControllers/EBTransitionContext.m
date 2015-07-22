//
//  EBTransitionContext.m
//  EBViewControllerSwitcher
//
//  Created by Ezequiel Becerra on 4/8/15.
//  Copyright (c) 2015 Betzerra. All rights reserved.
//

#import "EBTransitionContext.h"

@implementation EBTransitionContext

- (instancetype)initWithFromViewController:(UIViewController *)fromViewController
                          toViewController:(UIViewController *)toViewController {
    
    if ((self = [super init])) {
        _containerView = fromViewController.view.superview;
        _viewControllers = @{
                             UITransitionContextFromViewControllerKey:fromViewController,
                             UITransitionContextToViewControllerKey:toViewController
                             };
    }
    
    return self;
}

#pragma mark - UIViewControllerContextTransitioning

- (CGRect)initialFrameForViewController:(UIViewController *)vc {
    return vc.view.frame;
}

- (CGRect)finalFrameForViewController:(UIViewController *)vc {
    return vc.view.frame;
}

- (UIViewController *)viewControllerForKey:(NSString *)key {
    return _viewControllers[key];
}

- (UIModalPresentationStyle)presentationStyle {
    return UIModalPresentationCustom;
}

- (void)completeTransition:(BOOL)didComplete {
    if (self.completionBlock) {
        self.completionBlock (didComplete);
    }
}

- (UIView *)containerView {
    UIViewController *fromViewController = _viewControllers[UITransitionContextFromViewControllerKey];
    return fromViewController.view.superview;
}

#pragma mark iOS 8

- (UIView *)viewForKey:(NSString *)key {
    //  Not using this since we support iOS 7 yet
    return nil;
}

- (CGAffineTransform)targetTransform {
    //  Not using this since we support iOS 7 yet        
    return CGAffineTransformIdentity;
}

#pragma mark Interactive Transitions

- (BOOL)transitionWasCancelled {
    //  Interactive Transitions are not supported
    return NO;
}

- (void)updateInteractiveTransition:(CGFloat)percentComplete {
    //  Interactive Transitions are not supported
}

- (void)finishInteractiveTransition {
    //  Interactive Transitions are not supported
}

- (void)cancelInteractiveTransition {
    //  Interactive Transitions are not supported
}

@end
