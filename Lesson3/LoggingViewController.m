//
//  LoggingViewController.m
//  Lesson3
//
//  Created by Azat Almeev on 04.10.15.
//  Copyright © 2015 Azat Almeev. All rights reserved.
//

#import "LoggingViewController.h"

@interface LoggingViewController ()

@end

@implementation LoggingViewController

#define me [NSString stringWithFormat:@"%s", __PRETTY_FUNCTION__]

- (void)logEvent:(NSString *)event {
    NSLog(@"%@ %@", NSStringFromClass([self class]), event);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self logEvent:me];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self logEvent:me];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self logEvent:me];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self logEvent:me];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    [self logEvent:me];
}

- (void)dealloc {
    [self logEvent:me];
}

@end
