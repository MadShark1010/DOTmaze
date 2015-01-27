//
//  GridTileArray.h
//  DOTmaze
//
//  Created by Michael Paynter on 1/13/15.
//  Copyright (c) 2015 Michael Paynter. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "GameStructs.h"
#import "GridTile.h"

@interface GridTileArray : SKNode

@property (nonatomic, strong) NSMutableArray *theGridTileArray;


- (void) addObject:(SKSpriteNode*)aTile;
- (void) positionTilesInFrame:(CGRect)theFrame;

//maze layouts
- (void) setupMaze:(int)mazeLevel andDifficulty:(int)difficultyLevel;

- (void) clearBoard;

@end
