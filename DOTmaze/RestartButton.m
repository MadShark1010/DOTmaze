//
//  RestartButton.m
//  DOTmaze
//
//  Created by Michael Paynter on 1/17/15.
//  Copyright (c) 2015 Michael Paynter. All rights reserved.
//

#import "RestartButton.h"

@implementation RestartButton

- (id) initWithFrame:(CGRect)theFrame {
    
    self = [super initWithImageNamed:@"RestartButton"];
    
    if (self) {
        self.position = CGPointMake(CGRectGetMidX(theFrame), CGRectGetMaxY(theFrame) - 45);
        self.size = CGSizeMake(60, 60);
        self.resetAvailable = YES;
    }
    
    return self;
}

@end
