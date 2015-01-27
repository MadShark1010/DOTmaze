//
//  Dots.m
//  DOTmaze
//
//  Created by Michael Paynter on 1/15/15.
//  Copyright (c) 2015 Michael Paynter. All rights reserved.
//

#import "Dot.h"

@implementation Dot

-(id)initWithNumber:(int)theNumber {
    
    switch (theNumber) {
        case 1:
            self = [super initWithImageNamed:@"OneDot"];
            self.dotValue = 1;
            break;
        case 2:
            self = [super initWithImageNamed:@"TwoDot"];
            self.dotValue = 2;
            break;
        case 3:
            self = [super initWithImageNamed:@"ThreeDot"];
            self.dotValue = 3;
            break;
        case 4:
            self = [super initWithImageNamed:@"FourDot"];
            self.dotValue = 4;
            break;
        case 5:
            self = [super initWithImageNamed:@"FiveDot"];
            self.dotValue = 5;
            break;
        case 6:
            self = [super initWithImageNamed:@"SixDot"];
            self.dotValue = 6;
            break;
        case 7:
            self = [super initWithImageNamed:@"SevenDot"];
            self.dotValue = 7;
            break;
        case 8:
            self = [super initWithImageNamed:@"EightDot"];
            self.dotValue = 8;
            break;
        case 9:
            self = [super initWithImageNamed:@"NineDot"];
            self.dotValue = 9;
            break;
        default:
            break;
    }
    
    
    if (self) {
        self.size = CGSizeMake(35, 35);
    }
    
    return self;
}


@end
