//
//  TouchLocationDot.m
//  DOTmaze
//
//  Created by Michael Paynter on 1/13/15.
//  Copyright (c) 2015 Michael Paynter. All rights reserved.
//

#import "TouchLocationDot.h"

@implementation TouchLocationDot

- (id) initAt:(CGPoint)theLocation {
    
    self = [super initWithImageNamed:@"TouchLocation"];
    
    if (self) {
        self.position = theLocation;
        self.size = CGSizeMake(25, 25);
        
    }
    
    return self;
}

@end
