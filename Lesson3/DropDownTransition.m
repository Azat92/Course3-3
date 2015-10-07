//
//  DropDownTransition.m
//  Lesson3
//
//  Created by Azat Almeev on 04.10.15.
//  Copyright © 2015 Azat Almeev. All rights reserved.
//

#import "DropDownTransition.h"

typedef enum : NSUInteger {
    DropDownTransitionTypePresent,
    DropDownTransitionTypeDismiss
} DropDownTransitionType;

@interface DropDownTransition ()
@property (nonatomic) DropDownTransitionType type;
@end

@implementation DropDownTransition

+ (instancetype)transitionForDismissing {
    DropDownTransition *transition = [DropDownTransition new];
    transition.type = DropDownTransitionTypeDismiss;
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
    
    /////////////////1
//    CGRect initRect = [transitionContext initialFrameForViewController:toVC];
//    CGRect endRect = [transitionContext finalFrameForViewController:toVC];
//    initRect.size.width = endRect.size.width;
//    toView.frame = initRect;
//    [container addSubview:toView];
//    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
//        CGRect frame = toView.frame;
//        frame.size.height = endRect.size.height;
//        toView.frame = frame;
//    } completion:^(BOOL finished) {
//        [transitionContext completeTransition:finished];
//    }];

    /////////////////2
//    CGRect endRect = [transitionContext finalFrameForViewController:toVC];
//    toView.frame = endRect;
//    toView.transform = CGAffineTransformMakeTranslation(0, -endRect.size.height);
//    [container addSubview:toView];
//    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
//        toView.transform = CGAffineTransformIdentity;
//    } completion:^(BOOL finished) {
//        [transitionContext completeTransition:finished];
//    }];

    ////////////////3
//    [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
//        toView.transform = CGAffineTransformIdentity;
//    } completion:^(BOOL finished) {
//        [transitionContext completeTransition:finished];
//    }];

    /////////////////4
//    CGRect endRect = [transitionContext finalFrameForViewController:toVC];
//    toView.frame = endRect;
//    toView.transform = CGAffineTransformMakeTranslation(0, -endRect.size.height);
//    [container addSubview:toView];
//    [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0 usingSpringWithDamping:.5 initialSpringVelocity:.5 options:UIViewAnimationOptionCurveEaseOut animations:^{
//        toView.transform = CGAffineTransformIdentity;
//    } completion:^(BOOL finished) {
//        [transitionContext completeTransition:finished];
//    }];
    
    //embed simple vc into navigation stack
    
    UIView *transformView = self.type == DropDownTransitionTypePresent ? toView : fromView;
    CGRect endRect = [transitionContext finalFrameForViewController:toVC];
    transformView.frame = endRect;
    CGAffineTransform shiftedTransform = CGAffineTransformMakeTranslation(0, -endRect.size.height);
    transformView.transform = self.type == DropDownTransitionTypePresent ? shiftedTransform : CGAffineTransformIdentity;
    [container addSubview:transformView];
    //damping: self.type == DropDownTransitionTypePresent ? .5 : 1
    [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0 usingSpringWithDamping:1 initialSpringVelocity:.5 options:UIViewAnimationOptionCurveEaseOut animations:^{
        transformView.transform = self.type == DropDownTransitionTypePresent ? CGAffineTransformIdentity : shiftedTransform;
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:finished];
    }];
    
    //show how it works in different rotations
    
    //add child to second VC and make unwind to root from there
}

@end
