//
//  DropDownTransition.h
//  Lesson3
//
//  Created by Azat Almeev on 04.10.15.
//  Copyright © 2015 Azat Almeev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DropDownTransition : NSObject <UIViewControllerAnimatedTransitioning>
+ (instancetype)transitionForDismissing;
@end
