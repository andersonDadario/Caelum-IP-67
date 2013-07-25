//
//  UIViewController+withNavigator.m
//  Contatos
//
//  Created by ios3644 on 23/07/13.
//  Copyright (c) 2013 Caelum. All rights reserved.
//

#import "UIViewController+withNavigator.h"

@implementation UIViewController (withNavigator)

- (UINavigationController *) withNavigator
{
    return [[UINavigationController alloc] initWithRootViewController:self];
}

@end
