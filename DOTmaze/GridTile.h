//
//  GridTile.h
//  DOTmaze
//
//  Created by Michael Paynter on 1/13/15.
//  Copyright (c) 2015 Michael Paynter. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "GameStructs.h"
#import "Dot.h"

@interface GridTile : SKSpriteNode

-(id)initWithColor:(UIColor *)color size:(CGSize)size;

@property (nonatomic) BOOL hasDot;
@property (nonatomic) BOOL isBeingTouched;
@property (nonatomic) BOOL hasSwitchedBeingTouched;
@property (nonatomic) BOOL isActive;
@property (nonatomic) int row;
@property (nonatomic) int column;
@property (nonatomic) int dotNumber;

@property (nonatomic, strong) SKSpriteNode *aDot;

//children
-(void) addDot:(int)dotNumber;
-(void) removeDot;
- (void) decreaseDot;

//textures
-(void) addTexture:(int)theTexture;

@end
