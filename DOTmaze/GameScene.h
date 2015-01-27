//
//  GameScene.h
//  DOTmaze
//

//  Copyright (c) 2015 Michael Paynter. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "Title.h"
#import "TouchLocationDot.h"
#import "GridTile.h"
#import "GridTileArray.h"
#import "RestartButton.h"

@interface GameScene : SKScene

//Game Settings
@property (nonatomic) BOOL touchDotIsActive;
@property (nonatomic, strong) UIColor *backgroundColorLightBlue;
@property (nonatomic, strong) UIColor *backgroundColorAquaBlue;

//Title Screen
@property (nonatomic, strong) Title *title;

//Touch Location
@property (nonatomic, strong) SKSpriteNode *touchLocationDot;
@property (nonatomic) CGPoint touchOffset;
@property (nonatomic) float movementX;
@property (nonatomic) float movementY;

//Tile Grid
@property (nonatomic) SKNode *parentGridNode;
@property (nonatomic, strong) GridTile *gridTile;
@property (nonatomic, strong) GridTileArray *gridTileArray;
@property (nonatomic) float tileSize;

//In-game Interface
@property (nonatomic, strong) RestartButton *restartButton;

@end
