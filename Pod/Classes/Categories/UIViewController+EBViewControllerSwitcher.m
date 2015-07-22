//
//  UIViewController+EBViewControllerSwitcher.m
//  EBViewControllerSwitcher
//
//  Created by Ezequiel Becerra on 4/9/15.
//  Copyright (c) 2015 Betzerra. All rights reserved.
//

#import "UIViewController+EBViewControllerSwitcher.h"
#import "EBViewControllerSwitcher.h"

@implementation UIViewController (EBViewControllerSwitcher)

- (EBViewControllerSwitcher *)eb_controllerSwitcher {
    UIViewController *parent = self.parentViewController;
    while (parent != nil && ![parent isMemberOfClass:[EBViewControllerSwitcher class]]) {
        parent = parent.parentViewController;
    }

    return (EBViewControllerSwitcher *)parent;
}

@end
