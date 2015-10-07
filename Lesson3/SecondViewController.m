//
//  SecondViewController.m
//  Lesson3
//
//  Created by Azat Almeev on 04.10.15.
//  Copyright © 2015 Azat Almeev. All rights reserved.
//

#import "SecondViewController.h"
///////////1
//#import "DropDownTransition.h"
#import "PushTransition.h"

@interface SecondViewController () <UINavigationControllerDelegate>
@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    ////////////////2
//    self.navigationController.delegate = self;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    self.navigationController.delegate = self;
}

- (id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC {
    /////////////1
//    return [DropDownTransition new];
    return [PushTransition transitionWithOperation:operation];
}



@end
