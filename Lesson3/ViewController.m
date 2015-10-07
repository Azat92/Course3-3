//
//  ViewController.m
//  Lesson3
//
//  Created by Azat Almeev on 04.10.15.
//  Copyright © 2015 Azat Almeev. All rights reserved.
//

#import "ViewController.h"
#import "DropDownTransition.h"

@interface ViewController () <UIViewControllerTransitioningDelegate>

@end

@implementation ViewController

- (IBAction)returnToRootPage:(UIStoryboardSegue *)sender {
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"NextSegue"]) {
        UIViewController *dvc = segue.destinationViewController;
        dvc.transitioningDelegate = self;
        dvc.modalPresentationStyle = UIModalPresentationCustom;
    }
}

- (id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    return [DropDownTransition new];
}

- (id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    return [DropDownTransition transitionForDismissing];
}

@end
