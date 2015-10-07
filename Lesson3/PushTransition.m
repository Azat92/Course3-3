//
//  PushTransition.m
//  Lesson3
//
//  Created by Azat Almeev on 04.10.15.
//  Copyright © 2015 Azat Almeev. All rights reserved.
//

#import "PushTransition.h"

@interface PushTransition () {
    UIView *leftView;
    UIView *rightView;
    CGRect endFrame;
}
@end

@implementation PushTransition

+ (instancetype)transitionWithOperation:(UINavigationControllerOperation)operation {
    PushTransition *transition = [PushTransition new];
    transition.operation = operation;
    return transition;
}

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 1;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    UIView *container = [transitionContext containerView];
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    CGRect endFrame = [transitionContext finalFrameForViewController:toVC];
    
    //////////////////////1
//    toView.frame = endFrame;
//    toView.transform = CGAffineTransformMakeRotation(-M_PI_2);
//    toView.transform = CGAffineTransformTranslate(toView.transform, endFrame.size.width, endFrame.size.height);
//    [container addSubview:toView];
//    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
//        toView.transform = CGAffineTransformIdentity;
//    } completion:^(BOOL finished) {
//        [transitionContext completeTransition:finished];
//    }];

    ///////////////////////2
//    fromView.frame = endFrame;
//    [container addSubview:fromView];
//    toView.frame = endFrame;
//    toView.transform = CGAffineTransformMakeTranslation(endFrame.size.width, 0);
//    [container addSubview:toView];
//    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
//        CGAffineTransform transform = CGAffineTransformMakeTranslation(-endFrame.size.width / 2, 0);
//        fromView.transform = CGAffineTransformScale(transform, 0.01, 1);
//        toView.transform = CGAffineTransformIdentity;
//    } completion:^(BOOL finished) {
//        [transitionContext completeTransition:finished];
//    }];
    
    BOOL push = self.operation == UINavigationControllerOperationPush;
    
    UIView *leftView = push ? fromView : toView;
    UIView *rightView = push ? toView : fromView;
    CGAffineTransform scaledTransform = CGAffineTransformMakeTranslation(-endFrame.size.width / 2, 0);
    scaledTransform = CGAffineTransformScale(scaledTransform, 0.01, 1);
    CGAffineTransform shifted = CGAffineTransformMakeTranslation(endFrame.size.width, 0);
    
    fromView.frame = endFrame;
    toView.frame = endFrame;
    if (push)
        rightView.transform = shifted;
    else
        leftView.transform = scaledTransform;

    [container addSubview:leftView];
    [container addSubview:rightView];
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        if (push) {
            leftView.transform = scaledTransform;
            rightView.transform = CGAffineTransformIdentity;
        }
        else {
            leftView.transform = CGAffineTransformIdentity;
            rightView.transform = shifted;
        }
    } completion:^(BOOL finished) {
        leftView.transform = CGAffineTransformIdentity;
        [transitionContext completeTransition:finished];
    }];
}

- (void)startInteractiveTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    UIView *container = [transitionContext containerView];
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    endFrame = [transitionContext finalFrameForViewController:toVC];
    
    leftView = toView;
    rightView = fromView;
    CGAffineTransform scaledTransform = CGAffineTransformMakeTranslation(-endFrame.size.width / 2, 0);
    scaledTransform = CGAffineTransformScale(scaledTransform, 0.01, 1);
    
    fromView.frame = endFrame;
    toView.frame = endFrame;
    leftView.transform = scaledTransform;
    
    [container addSubview:leftView];
    [container addSubview:rightView];
}

- (void)updateInteractiveTransition:(CGFloat)percentComplete {
    CGAffineTransform scaledTransform = CGAffineTransformMakeTranslation(-endFrame.size.width / 2 * (1 - percentComplete), 0);
    scaledTransform = CGAffineTransformScale(scaledTransform, percentComplete, 1);
    leftView.transform = scaledTransform;
    rightView.transform = CGAffineTransformMakeTranslation(endFrame.size.width * percentComplete, 0);
}

- (void)finishInteractiveTransition {
    
}

- (void)cancelInteractiveTransition {
    
}

@end
