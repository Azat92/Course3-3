//
//  PushTransition.h
//  Lesson3
//
//  Created by Azat Almeev on 04.10.15.
//  Copyright © 2015 Azat Almeev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PushTransition : UIPercentDrivenInteractiveTransition <UIViewControllerAnimatedTransitioning>
@property (nonatomic) UINavigationControllerOperation operation;
+ (instancetype)transitionWithOperation:(UINavigationControllerOperation)operation;
@end
