//
//  EBTransitionContext.h
//  EBViewControllerSwitcher
//
//  Created by Ezequiel Becerra on 4/8/15.
//  Copyright (c) 2015 Betzerra. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface EBTransitionContext : NSObject <UIViewControllerContextTransitioning> {
    NSDictionary *_viewControllers;
    UIView *_containerView;
}

- (instancetype)initWithFromViewController:(UIViewController *)fromViewController
                          toViewController:(UIViewController *)toViewController;

@property (nonatomic, copy) void (^completionBlock)(BOOL didComplete);
@property (nonatomic, assign, getter=isAnimated) BOOL animated;
@property (nonatomic, assign, getter=isInteractive) BOOL interactive;

@end
