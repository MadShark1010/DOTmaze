//
//  GridTile.m
//  DOTmaze
//
//  Created by Michael Paynter on 1/13/15.
//  Copyright (c) 2015 Michael Paynter. All rights reserved.
//

#import "GridTile.h"

@implementation GridTile

-(id)initWithColor:(UIColor *)color size:(CGSize)size {
    
    self = [super initWithColor:color size:size];

    if (self) {

        _hasDot = NO;
        _isBeingTouched = NO;
        _hasSwitchedBeingTouched = NO;
        _isActive = NO;
        _row = 0;
        _column = 0;
        self.zPosition = -1;
        self.alpha = 1;
        
    }
    
    return self;
}

- (void) addDot:(int)dotNumber {
    
    self.aDot = [[Dot alloc] initWithNumber:dotNumber];
    self.dotNumber = dotNumber;
    self.hasDot = YES;
    [self addChild:self.aDot];
}

- (void) decreaseDot {
    
    self.dotNumber--;
    
    switch (self.dotNumber) {
        case 1:
            self.aDot.texture = [SKTexture textureWithImageNamed:@"OneDot"];
            break;
        case 2:
            self.aDot.texture = [SKTexture textureWithImageNamed:@"TwoDot"];
            break;
        case 3:
            self.aDot.texture = [SKTexture textureWithImageNamed:@"ThreeDot"];
            break;
        case 4:
            self.aDot.texture = [SKTexture textureWithImageNamed:@"FourDot"];
            break;
        case 5:
            self.aDot.texture = [SKTexture textureWithImageNamed:@"FiveDot"];
            break;
        case 6:
            self.aDot.texture = [SKTexture textureWithImageNamed:@"SixDot"];
            break;
        case 7:
            self.aDot.texture = [SKTexture textureWithImageNamed:@"SevenDot"];
            break;
        case 8:
            self.aDot.texture = [SKTexture textureWithImageNamed:@"EightDot"];
            break;
        default:
            break;
    }
}

- (void) removeDot{

    [self removeAllChildren];
    self.hasDot = NO;
}

- (void) addTexture:(int)theTexture {
    
    switch (theTexture) {
        case 1:
            self.texture = [SKTexture textureWithImageNamed:@"HorizontalParallel"];
            break;
        case 2:
            self.texture = [SKTexture textureWithImageNamed:@"VerticalParallel"];
            break;
        case 3:
            self.texture = [SKTexture textureWithImageNamed:@"TopOnly"];
            break;
        case 4:
            self.texture = [SKTexture textureWithImageNamed:@"RightOnly"];
            break;
        case 5:
            self.texture = [SKTexture textureWithImageNamed:@"BottomOnly"];
            break;
        case 6:
            self.texture = [SKTexture textureWithImageNamed:@"LeftOnly"];
            break;
        case 7:
            self.texture = [SKTexture textureWithImageNamed:@"TopRight"];
            break;
        case 8:
            self.texture = [SKTexture textureWithImageNamed:@"BottomRight"];
            break;
        case 9:
            self.texture = [SKTexture textureWithImageNamed:@"BottomLeft"];
            break;
        case 10:
            self.texture = [SKTexture textureWithImageNamed:@"TopLeft"];
            break;
        case 11:
            self.texture = [SKTexture textureWithImageNamed:@"EndPieceOpenUp"];
            break;
        case 12:
            self.texture = [SKTexture textureWithImageNamed:@"EndPieceOpenRight"];
            break;
        case 13:
            self.texture = [SKTexture textureWithImageNamed:@"EndPieceOpenDown"];
            break;
        case 14:
            self.texture = [SKTexture textureWithImageNamed:@"EndPieceOpenLeft"];
            break;
        default:
            break;
    }
}



@end
