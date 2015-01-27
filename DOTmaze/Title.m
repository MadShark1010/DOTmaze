//
//  Title.m
//  DOTmaze
//
//  Created by Michael Paynter on 1/13/15.
//  Copyright (c) 2015 Michael Paynter. All rights reserved.
//

#import "Title.h"

@implementation Title

- (id) initWithFrame:(CGRect)theFrame {
    
    self = [super init];
    
    int theFontSize = 60;
    float titleOffset = theFrame.size.height / 3;
    
    if (iPad) {
        
    }
    
    if (self) {
        self.fontName = @"Santana";
        self.text = @"DOTmaze";
        self.fontSize = theFontSize;
        self.position = CGPointMake(CGRectGetMidX(theFrame), CGRectGetMidY(theFrame) + titleOffset);
        
    }
    
    return self;
}

@end
