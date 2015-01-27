//
//  GameScene.m
//  DOTmaze
//
//  Created by Michael Paynter on 1/13/15.
//  Copyright (c) 2015 Michael Paynter. All rights reserved.
//

#import "GameScene.h"

@implementation GameScene {
    
    int activeMaze;
    int difficultyLevel;
}

-(void)didMoveToView:(SKView *)view {
    
    //----------------------Background Color-----------------------//
    self.backgroundColorLightBlue = [UIColor colorWithRed:74.0f/255.0f green:206.0f/255.0f blue:226.0f/255.0f alpha:1];
    self.backgroundColorAquaBlue = [UIColor colorWithRed:26.0f/255.0f green:231.0f/255.0f blue:249.0f/255.0f alpha:1];

    self.backgroundColor = self.backgroundColorAquaBlue;

    //----------------------Spawn title----------------------//
    
    self.title = [[Title alloc] initWithFrame:self.frame];
    //[self addChild:self.title];
    
    //----------------------Spawn Restart Button --------------------//
    self.restartButton = [[RestartButton alloc] initWithFrame:self.frame];
    [self addChild:self.restartButton];
    
    //----------------------Game Presets------------------------//
    self.touchDotIsActive = YES;
    self.touchOffset = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame) + 100);
    self.touchLocationDot.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
    
    //----------------------Select Maze---------------------//
    activeMaze = 2;
    difficultyLevel = 2;
    //----------------------Spawn Maze----------------------//
    [self spawnTouchLocationDot];
    [self spawnTileGrid];
    [self.gridTileArray setupMaze:activeMaze andDifficulty:difficultyLevel];
}

- (void) spawnTouchLocationDot {
    
    self.touchLocationDot = [[TouchLocationDot alloc] initAt:CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame))];
    [self addChild:self.touchLocationDot];
    
}

- (void) spawnTileGrid {
    
    self.parentGridNode = [[SKNode alloc] init];
    [self addChild:self.parentGridNode];
    
    self.gridTileArray = [[GridTileArray alloc] init];
    [self.gridTileArray theGridTileArray];
    
    self.tileSize = 60; //a float

    switch (activeMaze) {
        case 2:
            self.tileSize = 80;
            break;
            
        default:
            break;
    }
    
    for (int x = 0; x < 56; x++) {
        
        self.gridTile = [[GridTile alloc] initWithColor:[UIColor clearColor/*whiteColor*/] size:CGSizeMake(self.tileSize, self.tileSize)];
//        self.gridTile.alpha = .5;
//        if (x % 2 != 0 ) {
//            self.gridTile.alpha = .25;
//        }
        [self.parentGridNode addChild:self.gridTile];
        [self.gridTileArray addObject:self.gridTile];
    }
    
    [self.gridTileArray positionTilesInFrame:self.frame];
    
}

#pragma mark Touch Methods

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
        
    if (self.touchDotIsActive) {
        UITouch *touch = [[event allTouches] anyObject];
        CGPoint theTouchLocation = [touch locationInNode:self];

        self.touchOffset = theTouchLocation;
        self.touchOffset = CGPointMake(self.touchOffset.x - 50, self.touchOffset.y + 50);

    //    self.touchLocationDot.position = self.theTouchLocation;
        
    }
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {

    if (self.touchDotIsActive) {
        UITouch *touch = [[event allTouches] anyObject];
        CGPoint theTouchLocation = [touch locationInNode:self];
        self.touchOffset = theTouchLocation;
        
//        int xOffset = 50;
//        
//        if (theTouchLocation.x >= 610) {
//            
//            xOffset = 660 - (int)theTouchLocation.x;
//            
//            if (xOffset < 0) {
//                xOffset = 0;
//            }
//        }
        
        self.touchOffset = CGPointMake(self.touchOffset.x - 20, self.touchOffset.y + 60);

        
       // NSLog(@"the Touch Location: %f,  x offset:%i",theTouchLocation.x, xOffset);
        
        self.movementX = 0;
        self.movementY = 0;
        
        if (self.touchLocationDot.position.x != self.touchOffset.x) {
            self.movementX = self.touchOffset.x - self.touchLocationDot.position.x;
            
            if (self.movementX > 5) {
                self.movementX = 5;
            } else if (self.movementX < -5) {
                self.movementX = -5;
            }
        }
        if (self.touchLocationDot.position.y != self.touchOffset.y) {
            self.movementY = self.touchOffset.y - self.touchLocationDot.position.y;
            
            if (self.movementY > 5) {
                self.movementY = 5;
            } else if (self.movementY < -5) {
                self.movementY = -5;
            }
        }
        
//        for (GridTile *aTile in self.gridTileArray.theGridTileArray) {
//            if ([self.touchLocationDot intersectsNode:aTile] && aTile.isActive == YES) {
//                self.movementY = 0;
//            }
//        }
        
     //   NSLog(@"%f", self.movementY);
        
        self.touchLocationDot.position = CGPointMake(self.touchLocationDot.position.x + self.movementX, self.touchLocationDot.position.y + self.movementY);

        for (GridTile *aTile in self.gridTileArray.theGridTileArray) {
            if ([self.touchLocationDot intersectsNode:aTile] && aTile.isActive == YES) {
                                    
                if (aTile.hasSwitchedBeingTouched == NO) {
                    aTile.hasSwitchedBeingTouched = YES;
                        
                    if (aTile.hasDot == NO) {
                        aTile.hasDot = YES;
                        [aTile addDot:1];
                    } else {
                        
                        if (aTile.dotNumber > 1) {
                            [aTile decreaseDot];
                        } else {
                            aTile.hasDot = NO;
                            [aTile removeDot];
                        }
                    }
                }
            } else {
                
                aTile.hasSwitchedBeingTouched = NO;
            }
        }
    }
}


-(void)update:(CFTimeInterval)currentTime {
    
    if (self.touchDotIsActive) {
        
        self.movementX = 0;
        self.movementY = 0;
        
        if (self.touchLocationDot.position.x != self.touchOffset.x) {
            self.movementX = self.touchOffset.x - self.touchLocationDot.position.x;
            
            if (self.movementX > 5) {
                self.movementX = 5;
            } else if (self.movementX < -5) {
                self.movementX = -5;
            }
            
        }
        if (self.touchLocationDot.position.y != self.touchOffset.y) {
            self.movementY = self.touchOffset.y - self.touchLocationDot.position.y;
            
            if (self.movementY > 5) {
                self.movementY = 5;
            } else if (self.movementY < -5) {
                self.movementY = -5;
            }
        }
        
//        for (GridTile *aTile in self.gridTileArray.theGridTileArray) {
//            if ([self.touchLocationDot intersectsNode:aTile] && aTile.isActive == YES) {
//                self.movementY = 0;
//            }
//        }
        
        self.touchLocationDot.position = CGPointMake(self.touchLocationDot.position.x + self.movementX, self.touchLocationDot.position.y + self.movementY);
    }
    
    //TEMPORARY
    if ([self.touchLocationDot intersectsNode:self.restartButton] && self.restartButton.resetAvailable == YES) {
        [self.gridTileArray clearBoard];
        [self.gridTileArray setupMaze:activeMaze andDifficulty:difficultyLevel];
        self.restartButton.resetAvailable = NO;
        NSTimer *resetAvailableTimer = [NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(resetTimer) userInfo:nil repeats:NO];
        
    }
}


//TEMPORARY
- (void) resetTimer {
    self.restartButton.resetAvailable = YES;
}


@end


