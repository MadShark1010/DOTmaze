//
//  Dots.h
//  DOTmaze
//
//  Created by Michael Paynter on 1/15/15.
//  Copyright (c) 2015 Michael Paynter. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface Dot : SKSpriteNode

-(id)initWithNumber:(int)theNumber;

@property (nonatomic) int dotValue;

@end
