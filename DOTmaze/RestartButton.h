//
//  RestartButton.h
//  DOTmaze
//
//  Created by Michael Paynter on 1/17/15.
//  Copyright (c) 2015 Michael Paynter. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface RestartButton : SKSpriteNode

-(id) initWithFrame:(CGRect)theFrame;

@property (nonatomic) BOOL resetAvailable;

@end
