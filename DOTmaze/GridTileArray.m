//
//  GridTileArray.m
//  DOTmaze
//
//  Created by Michael Paynter on 1/13/15.
//  Copyright (c) 2015 Michael Paynter. All rights reserved.
//

#import "GridTileArray.h"


@implementation GridTileArray

- (NSMutableArray *) theGridTileArray {
    
    if (!_theGridTileArray) {
        _theGridTileArray = [NSMutableArray array];
    }

    return _theGridTileArray;
}

- (void) addObject:(SKSpriteNode *)aTile {
    
    [_theGridTileArray addObject:aTile];

}

- (void) positionTilesInFrame:(CGRect)theFrame {
    
    //SPACERS NOT CURRENTLY USED
    int spacer = 2;
    
    if (iPad) {
        spacer = 4;
    }

    int theRow = 1;
    int theColumn = 1;
    
    for (GridTile *aTile in _theGridTileArray) {
        aTile.position = CGPointMake(CGRectGetMidX(theFrame), CGRectGetMidY(theFrame));
        
        aTile.row = theRow;
        aTile.column = theColumn;
        
        theColumn++;
        
        if (theColumn == 8) {
            theColumn = 1;
            theRow++;
        }
    }
    
    float tileSize = [[_theGridTileArray objectAtIndex:0] size].height;
    float startingX = tileSize*3;
    float placementX = startingX;
    float placementY = startingX;
    int x = 0;
    
    for (SKSpriteNode *aTile in _theGridTileArray) {
        
        
        aTile.position = CGPointMake(aTile.position.x - placementX, aTile.position.y + placementY);        
        
        placementX = placementX - tileSize;
        
        x++;
        
        if (x >= 7) {
            placementX = startingX;
            placementY = placementY - tileSize;
            x = 0;
        }
    }
}

#pragma mark Maze Layouts

- (void) setupMaze:(int)mazeLevel andDifficulty:(int)difficultyLevel {
    
    NSNumber *one = [NSNumber numberWithInt:1];
    NSNumber *two = [NSNumber numberWithInt:2];
    NSNumber *three = [NSNumber numberWithInt:3];
    NSNumber *four = [NSNumber numberWithInt:4];
    NSNumber *five = [NSNumber numberWithInt:5];
    NSNumber *six = [NSNumber numberWithInt:6];
    NSNumber *seven = [NSNumber numberWithInt:7];
    NSNumber *eight = [NSNumber numberWithInt:8];
    NSNumber *nine = [NSNumber numberWithInt:9];

    NSArray *onesArray;
    NSArray *twosArray;
    NSArray *threesArray;
    NSArray *foursArray;
    NSArray *fivesArray;
    NSArray *sixesArray;
    NSArray *sevensArray;
    NSArray *eightsArray;
    NSArray *ninesArray;
    
    NSArray *topOnlyArray;
    NSArray *rightOnlyArray;
    NSArray *bottomOnlyArray;
    NSArray *leftOnlyArray;
    NSArray *topRightArray;
    NSArray *bottomRightArray;
    NSArray *bottomLeftArray;
    NSArray *topLeftArray;
    NSArray *endPieceOpenUpArray;
    NSArray *endPieceOpenRightArray;
    NSArray *endPieceOpenDownArray;
    NSArray *endPieceOpenLeftArray;
    NSArray *verticalParallelArray;
    NSArray *horizontalParallelArray;
    NSArray *activeTileArray;
    
    switch (mazeLevel) {
        case 1:
        {
            switch (difficultyLevel) {
                case 1:
                {
                    onesArray = [NSArray arrayWithObjects: two, two, two, three, two, four, two, five, two, six, nil];
                    twosArray = [NSArray arrayWithObjects:  nil];
                    threesArray = [NSArray arrayWithObjects:  nil];
                    foursArray = [NSArray arrayWithObjects:  nil];
                    fivesArray = [NSArray arrayWithObjects:  nil];
                    sixesArray = [NSArray arrayWithObjects:  nil];
                    sevensArray = [NSArray arrayWithObjects:  nil];
                    eightsArray = [NSArray arrayWithObjects:  nil];
                    ninesArray = [NSArray arrayWithObjects:  nil];
                }
                    break;
                case 2:
                {
                    onesArray = [NSArray arrayWithObjects: two, two, nil];
                    twosArray = [NSArray arrayWithObjects: two, six, nil];
                    threesArray = [NSArray arrayWithObjects: two, three, nil];
                    foursArray = [NSArray arrayWithObjects: two, five, nil];
                    fivesArray = [NSArray arrayWithObjects: two, four, nil];
                    sixesArray = [NSArray arrayWithObjects:  nil];
                    sevensArray = [NSArray arrayWithObjects:  nil];
                    eightsArray = [NSArray arrayWithObjects:  nil];
                    ninesArray = [NSArray arrayWithObjects:  nil];
                }
                    break;
                default:
                    break;
            }
            
            
            topOnlyArray = [NSArray arrayWithObjects: nil];
            rightOnlyArray = [NSArray arrayWithObjects: nil];
            bottomOnlyArray = [NSArray arrayWithObjects: nil];
            leftOnlyArray = [NSArray arrayWithObjects: nil];
            topRightArray = [NSArray arrayWithObjects: nil];
            bottomRightArray = [NSArray arrayWithObjects: nil];
            bottomLeftArray = [NSArray arrayWithObjects: nil];
            topLeftArray = [NSArray arrayWithObjects: nil];
            endPieceOpenUpArray = [NSArray arrayWithObjects: nil];
            endPieceOpenRightArray = [NSArray arrayWithObjects: nil];
            endPieceOpenDownArray = [NSArray arrayWithObjects: nil];
            endPieceOpenLeftArray = [NSArray arrayWithObjects: nil];
            verticalParallelArray = [NSArray arrayWithObjects: nil];
            horizontalParallelArray = [NSArray arrayWithObjects:two, two, two, three, two, four, two, five, two, six, nil];
            activeTileArray = [NSArray arrayWithObjects: nil];
        }
            break;
            
        case 2:
        {
            switch (difficultyLevel) {
                case 1:
                {
                    onesArray = [NSArray arrayWithObjects: two, three, four, three, five, three, four, four, three, five, four, five, nil];
                    twosArray = [NSArray arrayWithObjects: three, three, three, four, five, four, five, five, nil];
                    threesArray = [NSArray arrayWithObjects:  nil];
                    foursArray = [NSArray arrayWithObjects:  nil];
                    fivesArray = [NSArray arrayWithObjects:  nil];
                    sixesArray = [NSArray arrayWithObjects:  nil];
                    sevensArray = [NSArray arrayWithObjects:  nil];
                    eightsArray = [NSArray arrayWithObjects:  nil];
                    ninesArray = [NSArray arrayWithObjects:  nil];
                }
                    break;
                case 2:
                {
                    onesArray = [NSArray arrayWithObjects: two, three, four, four, four, five, nil];
                    twosArray = [NSArray arrayWithObjects: three, five, five, five, nil];
                    threesArray = [NSArray arrayWithObjects: four, three, five, three, five, four, nil];
                    foursArray = [NSArray arrayWithObjects: three, three, three, four, nil];
                    fivesArray = [NSArray arrayWithObjects:  nil];
                    sixesArray = [NSArray arrayWithObjects:  nil];
                    sevensArray = [NSArray arrayWithObjects:  nil];
                    eightsArray = [NSArray arrayWithObjects:  nil];
                    ninesArray = [NSArray arrayWithObjects:  nil];
                }
                    break;
                default:
                    break;
            }
            
            topOnlyArray = [NSArray arrayWithObjects: three, four, nil];
            rightOnlyArray = [NSArray arrayWithObjects: four, five, nil];
            bottomOnlyArray = [NSArray arrayWithObjects: five, four, five, five, nil];
            leftOnlyArray = [NSArray arrayWithObjects:three, three, four, three, five, three, nil];
            topRightArray = [NSArray arrayWithObjects: three, five, nil];
            bottomRightArray = [NSArray arrayWithObjects: nil];
            bottomLeftArray = [NSArray arrayWithObjects: five, three, nil];
            topLeftArray = [NSArray arrayWithObjects: nil];
            endPieceOpenUpArray = [NSArray arrayWithObjects: nil];
            endPieceOpenRightArray = [NSArray arrayWithObjects: nil];
            endPieceOpenDownArray = [NSArray arrayWithObjects: nil];
            endPieceOpenLeftArray = [NSArray arrayWithObjects: nil];
            verticalParallelArray = [NSArray arrayWithObjects: two, three, four, four, nil];
            horizontalParallelArray = [NSArray arrayWithObjects: nil];
            activeTileArray = [NSArray arrayWithObjects: nil];
        }
            break;
            
        case 3:
        {
            switch (difficultyLevel) {
                case 1:
                {
                    onesArray = [NSArray arrayWithObjects: three, one, four, one, five, one, six, one, three, three, six, three, seven, three, two, five, three, five, four, five, five, five, six, five, two, six, three, six, four, six, five, six, six, six, seven, six, two, seven, five, seven, six, seven, seven, seven, nil];
                    twosArray = [NSArray arrayWithObjects: two, one, eight, one, three, two, five, two, six, two, eight, two, two, three, five, three, eight, three, two, four, three, four, four, four, five, four, six, four, seven, four, eight, four, eight, six, three, seven, four, seven, eight, seven, nil];
                    threesArray = [NSArray arrayWithObjects: seven, one, two, two, four, two, seven, two, four, three, seven, five, eight, five, nil];
                    foursArray = [NSArray arrayWithObjects:  nil];
                    fivesArray = [NSArray arrayWithObjects:  nil];
                    sixesArray = [NSArray arrayWithObjects:  nil];
                    sevensArray = [NSArray arrayWithObjects:  nil];
                    eightsArray = [NSArray arrayWithObjects:  nil];
                    ninesArray = [NSArray arrayWithObjects:  nil];
                }
                    break;
                case 2:
                {
                    onesArray = [NSArray arrayWithObjects:  nil];
                    twosArray = [NSArray arrayWithObjects:  nil];
                    threesArray = [NSArray arrayWithObjects:  nil];
                    foursArray = [NSArray arrayWithObjects:  nil];
                    fivesArray = [NSArray arrayWithObjects:  nil];
                    sixesArray = [NSArray arrayWithObjects:  nil];
                    sevensArray = [NSArray arrayWithObjects:  nil];
                    eightsArray = [NSArray arrayWithObjects:  nil];
                    ninesArray = [NSArray arrayWithObjects:  nil];
                }
                    break;
                default:
                    break;
            }
            
            
            
            topOnlyArray = [NSArray arrayWithObjects:two, two, two, three, two, four, two, five, two, six, nil];
            rightOnlyArray = [NSArray arrayWithObjects:three, three, six, three, six, six, three, seven, four, seven, five, seven, six, seven, seven, seven, eight, seven, nil];
            bottomOnlyArray = [NSArray arrayWithObjects: seven, two, eight, two, eight, three, eight, four, eight, five, eight, six, four, four, four, five, four, six, seven, four, nil];
            leftOnlyArray = [NSArray arrayWithObjects:two, one, three, one, four, one, five, one, six, one, seven, one, four, two, nil];
            topRightArray = [NSArray arrayWithObjects:two, seven, nil];
            bottomRightArray = [NSArray arrayWithObjects:seven, three, seven, six, nil];
            bottomLeftArray = [NSArray arrayWithObjects:eight, one, nil];
            topLeftArray = [NSArray arrayWithObjects: nil];
            endPieceOpenUpArray = [NSArray arrayWithObjects: nil];
            endPieceOpenRightArray = [NSArray arrayWithObjects: nil];
            endPieceOpenDownArray = [NSArray arrayWithObjects: nil];
            endPieceOpenLeftArray = [NSArray arrayWithObjects: nil];
            verticalParallelArray = [NSArray arrayWithObjects:three, two, five, two, six, two, six, five, nil];
            horizontalParallelArray = [NSArray arrayWithObjects: three, five, three, six, nil];
            activeTileArray = [NSArray arrayWithObjects: four, three, five, three, three, four, five, four, five, five, five, six, six, four, seven, five, nil];
        }
            break;
            
        case 4:
        {
            switch (difficultyLevel) {
                case 1:
                {
                    onesArray = [NSArray arrayWithObjects:  nil];
                    twosArray = [NSArray arrayWithObjects:  nil];
                    threesArray = [NSArray arrayWithObjects:  nil];
                    foursArray = [NSArray arrayWithObjects:  nil];
                    fivesArray = [NSArray arrayWithObjects:  nil];
                    sixesArray = [NSArray arrayWithObjects:  nil];
                    sevensArray = [NSArray arrayWithObjects:  nil];
                    eightsArray = [NSArray arrayWithObjects:  nil];
                    ninesArray = [NSArray arrayWithObjects:  nil];
                }
                    break;
                case 2:
                {
                    onesArray = [NSArray arrayWithObjects:  nil];
                    twosArray = [NSArray arrayWithObjects:  nil];
                    threesArray = [NSArray arrayWithObjects:  nil];
                    foursArray = [NSArray arrayWithObjects:  nil];
                    fivesArray = [NSArray arrayWithObjects:  nil];
                    sixesArray = [NSArray arrayWithObjects:  nil];
                    sevensArray = [NSArray arrayWithObjects:  nil];
                    eightsArray = [NSArray arrayWithObjects:  nil];
                    ninesArray = [NSArray arrayWithObjects:  nil];
                }
                    break;
                default:
                    break;
            }
            
            topOnlyArray = [NSArray arrayWithObjects: nil];
            rightOnlyArray = [NSArray arrayWithObjects: nil];
            bottomOnlyArray = [NSArray arrayWithObjects: nil];
            leftOnlyArray = [NSArray arrayWithObjects: nil];
            topRightArray = [NSArray arrayWithObjects: nil];
            bottomRightArray = [NSArray arrayWithObjects: nil];
            bottomLeftArray = [NSArray arrayWithObjects: nil];
            topLeftArray = [NSArray arrayWithObjects: nil];
            endPieceOpenUpArray = [NSArray arrayWithObjects: nil];
            endPieceOpenRightArray = [NSArray arrayWithObjects: nil];
            endPieceOpenDownArray = [NSArray arrayWithObjects: nil];
            endPieceOpenLeftArray = [NSArray arrayWithObjects: nil];
            verticalParallelArray = [NSArray arrayWithObjects: nil];
            horizontalParallelArray = [NSArray arrayWithObjects: nil];
            activeTileArray = [NSArray arrayWithObjects: nil];
        }
            break;
            
        default:
            break;
    }
    
    [self spawnMaze:onesArray andTwosArray:twosArray andThreesArray:threesArray andFoursArray:foursArray andFivesArray:fivesArray andSixesArrray:sixesArray andSevensArray:sevensArray andEightsArray:eightsArray andNinesArray:ninesArray andTopOnlyArray:topOnlyArray andRightOnlyArray:rightOnlyArray andBottomOnlyArray:bottomOnlyArray andLeftOnlyArray:leftOnlyArray andTopRightArray:topRightArray andBottomRightArray:bottomRightArray andBottomLeftArray:bottomLeftArray andTopLeftArray:topLeftArray andEndPieceOpenUpArray:endPieceOpenUpArray andEndPieceOpenRightArray:endPieceOpenRightArray andEndPieceOpenDownArray:endPieceOpenDownArray andEndPieceOpenLeftArray:endPieceOpenLeftArray andVerticalParallelArray:verticalParallelArray andHorizontalParallelArray:horizontalParallelArray andActiveTileArray:activeTileArray];
}

- (void) spawnMaze:(NSArray*)onesArray andTwosArray:(NSArray*)twosArray andThreesArray:(NSArray*)threesArray andFoursArray:(NSArray*)foursArray andFivesArray:(NSArray*)fivesArray andSixesArrray:(NSArray*)sixesArray andSevensArray:(NSArray*)sevensArray andEightsArray:(NSArray*)eightsArray andNinesArray:(NSArray*)ninesArray andTopOnlyArray:(NSArray*)topOnlyArray andRightOnlyArray:(NSArray*)rightOnlyArray andBottomOnlyArray:(NSArray*)bottomOnlyArray andLeftOnlyArray:(NSArray*)leftOnlyArray andTopRightArray:(NSArray*)topRightArray andBottomRightArray:(NSArray*)bottomRightArray andBottomLeftArray:(NSArray*)bottomLeftArray andTopLeftArray:(NSArray*)topLeftArray andEndPieceOpenUpArray:(NSArray*)endPieceOpenUpArray andEndPieceOpenRightArray:(NSArray*)endPieceOpenRightArray andEndPieceOpenDownArray:(NSArray*)endPieceOpenDownArray andEndPieceOpenLeftArray:(NSArray*)endPieceOpenLeftArray andVerticalParallelArray:(NSArray*)verticalParallelArray andHorizontalParallelArray:(NSArray*)horizontalParallelArray andActiveTileArray:(NSArray*)activeTileArray {
    
    int counter = 1;
    int theRow = 0;
    int theColumn = 0;
    
    
    for (GridTile *aTile in _theGridTileArray) {
        
        /* ------------ DOTS ------------ */
        
        for (NSNumber *aNumber in onesArray) {
            
            if (counter % 2 != 0 ) {
                theRow = [aNumber intValue];
            } else {
                theColumn = [aNumber intValue];
                if (aTile.row == theRow && aTile.column == theColumn) {
                    [aTile addDot:1];
                }
            }
            
            counter++;
        }
        counter = 1;
        theRow = 0;
        theColumn = 0;
        
        for (NSNumber *aNumber in twosArray) {
            
            if (counter % 2 != 0 ) {
                theRow = [aNumber intValue];
            } else {
                theColumn = [aNumber intValue];
                if (aTile.row == theRow && aTile.column == theColumn) {
                    [aTile addDot:2];
                }
            }
            
            counter++;
        }
        counter = 1;
        theRow = 0;
        theColumn = 0;
        
        for (NSNumber *aNumber in threesArray) {
            
            if (counter % 2 != 0 ) {
                theRow = [aNumber intValue];
            } else {
                theColumn = [aNumber intValue];
                if (aTile.row == theRow && aTile.column == theColumn) {
                    [aTile addDot:3];
                }
            }
            
            counter++;
        }
        counter = 1;
        theRow = 0;
        theColumn = 0;
        
        for (NSNumber *aNumber in foursArray) {
            
            if (counter % 2 != 0 ) {
                theRow = [aNumber intValue];
            } else {
                theColumn = [aNumber intValue];
                if (aTile.row == theRow && aTile.column == theColumn) {
                    [aTile addDot:4];
                }
            }
            
            counter++;
        }
        counter = 1;
        theRow = 0;
        theColumn = 0;
        
        for (NSNumber *aNumber in fivesArray) {
            
            if (counter % 2 != 0 ) {
                theRow = [aNumber intValue];
            } else {
                theColumn = [aNumber intValue];
                if (aTile.row == theRow && aTile.column == theColumn) {
                    [aTile addDot:5];
                }
            }
            
            counter++;
        }
        counter = 1;
        theRow = 0;
        theColumn = 0;
        
        for (NSNumber *aNumber in sixesArray) {
            
            if (counter % 2 != 0 ) {
                theRow = [aNumber intValue];
            } else {
                theColumn = [aNumber intValue];
                if (aTile.row == theRow && aTile.column == theColumn) {
                    [aTile addDot:6];
                }
            }
            
            counter++;
        }
        counter = 1;
        theRow = 0;
        theColumn = 0;
        
        for (NSNumber *aNumber in sevensArray) {
            
            if (counter % 2 != 0 ) {
                theRow = [aNumber intValue];
            } else {
                theColumn = [aNumber intValue];
                if (aTile.row == theRow && aTile.column == theColumn) {
                    [aTile addDot:7];
                }
            }
            
            counter++;
        }
        counter = 1;
        theRow = 0;
        theColumn = 0;
        
        for (NSNumber *aNumber in eightsArray) {
            
            if (counter % 2 != 0 ) {
                theRow = [aNumber intValue];
            } else {
                theColumn = [aNumber intValue];
                if (aTile.row == theRow && aTile.column == theColumn) {
                    [aTile addDot:8];
                }
            }
            
            counter++;
        }
        counter = 1;
        theRow = 0;
        theColumn = 0;
        
        for (NSNumber *aNumber in ninesArray) {
            
            if (counter % 2 != 0 ) {
                theRow = [aNumber intValue];
            } else {
                theColumn = [aNumber intValue];
                if (aTile.row == theRow && aTile.column == theColumn) {
                    [aTile addDot:9];
                }
            }
            
            counter++;
        }
        
        /* ------------ BORDER PIECES ------------ */
        
        counter = 1;
        theRow = 0;
        theColumn = 0;
        
        for (NSNumber *aNumber in topOnlyArray) {
            
            if (counter % 2 != 0 ) {
                theRow = [aNumber intValue];
            } else {
                theColumn = [aNumber intValue];
                if (aTile.row == theRow && aTile.column == theColumn) {
                    aTile.isActive = YES;
                    [aTile addTexture:topOnly];
                }
            }
            
            counter++;
        }
        counter = 1;
        theRow = 0;
        theColumn = 0;
        
        for (NSNumber *aNumber in rightOnlyArray) {
            
            if (counter % 2 != 0 ) {
                theRow = [aNumber intValue];
            } else {
                theColumn = [aNumber intValue];
                if (aTile.row == theRow && aTile.column == theColumn) {
                    aTile.isActive = YES;
                    [aTile addTexture:rightOnly];
                }
            }
            
            counter++;
        }
        counter = 1;
        theRow = 0;
        theColumn = 0;
        
        for (NSNumber *aNumber in bottomOnlyArray) {
            
            if (counter % 2 != 0 ) {
                theRow = [aNumber intValue];
            } else {
                theColumn = [aNumber intValue];
                if (aTile.row == theRow && aTile.column == theColumn) {
                    aTile.isActive = YES;
                    [aTile addTexture:bottomOnly];
                }
            }
            
            counter++;
        }
        counter = 1;
        theRow = 0;
        theColumn = 0;
        
        for (NSNumber *aNumber in leftOnlyArray) {
            
            if (counter % 2 != 0 ) {
                theRow = [aNumber intValue];
            } else {
                theColumn = [aNumber intValue];
                if (aTile.row == theRow && aTile.column == theColumn) {
                    aTile.isActive = YES;
                    [aTile addTexture:leftOnly];
                }
            }
            
            counter++;
        }
        counter = 1;
        theRow = 0;
        theColumn = 0;
        
        for (NSNumber *aNumber in topRightArray) {
            
            if (counter % 2 != 0 ) {
                theRow = [aNumber intValue];
            } else {
                theColumn = [aNumber intValue];
                if (aTile.row == theRow && aTile.column == theColumn) {
                    aTile.isActive = YES;
                    [aTile addTexture:topRight];
                }
            }
            
            counter++;
        }
        counter = 1;
        theRow = 0;
        theColumn = 0;
        
        for (NSNumber *aNumber in bottomRightArray) {
            
            if (counter % 2 != 0 ) {
                theRow = [aNumber intValue];
            } else {
                theColumn = [aNumber intValue];
                if (aTile.row == theRow && aTile.column == theColumn) {
                    aTile.isActive = YES;
                    [aTile addTexture:bottomRight];
                }
            }
            
            counter++;
        }
        counter = 1;
        theRow = 0;
        theColumn = 0;
        
        for (NSNumber *aNumber in bottomLeftArray) {
            
            if (counter % 2 != 0 ) {
                theRow = [aNumber intValue];
            } else {
                theColumn = [aNumber intValue];
                if (aTile.row == theRow && aTile.column == theColumn) {
                    aTile.isActive = YES;
                    [aTile addTexture:bottomLeft];
                }
            }
            
            counter++;
        }
        counter = 1;
        theRow = 0;
        theColumn = 0;
        
        for (NSNumber *aNumber in topLeftArray) {
            
            if (counter % 2 != 0 ) {
                theRow = [aNumber intValue];
            } else {
                theColumn = [aNumber intValue];
                if (aTile.row == theRow && aTile.column == theColumn) {
                    aTile.isActive = YES;
                    [aTile addTexture:topLeft];
                }
            }
            
            counter++;
        }
        counter = 1;
        theRow = 0;
        theColumn = 0;
        
        for (NSNumber *aNumber in endPieceOpenUpArray) {
            
            if (counter % 2 != 0 ) {
                theRow = [aNumber intValue];
            } else {
                theColumn = [aNumber intValue];
                if (aTile.row == theRow && aTile.column == theColumn) {
                    aTile.isActive = YES;
                    [aTile addTexture:endPieceOpenUp];
                }
            }
            
            counter++;
        }
        counter = 1;
        theRow = 0;
        theColumn = 0;
        
        for (NSNumber *aNumber in endPieceOpenRightArray) {
            
            if (counter % 2 != 0 ) {
                theRow = [aNumber intValue];
            } else {
                theColumn = [aNumber intValue];
                if (aTile.row == theRow && aTile.column == theColumn) {
                    aTile.isActive = YES;
                    [aTile addTexture:endPieceOpenRight];
                }
            }
            
            counter++;
        }
        counter = 1;
        theRow = 0;
        theColumn = 0;
        
        for (NSNumber *aNumber in endPieceOpenDownArray) {
            
            if (counter % 2 != 0 ) {
                theRow = [aNumber intValue];
            } else {
                theColumn = [aNumber intValue];
                if (aTile.row == theRow && aTile.column == theColumn) {
                    aTile.isActive = YES;
                    [aTile addTexture:endPieceOpenDown];
                }
            }
            
            counter++;
        }
        counter = 1;
        theRow = 0;
        theColumn = 0;
        
        for (NSNumber *aNumber in endPieceOpenLeftArray) {
            
            if (counter % 2 != 0 ) {
                theRow = [aNumber intValue];
            } else {
                theColumn = [aNumber intValue];
                if (aTile.row == theRow && aTile.column == theColumn) {
                    aTile.isActive = YES;
                    [aTile addTexture:endPieceOpenLeft];
                }
            }
            
            counter++;
        }
        counter = 1;
        theRow = 0;
        theColumn = 0;
        
        for (NSNumber *aNumber in verticalParallelArray) {
            
            if (counter % 2 != 0 ) {
                theRow = [aNumber intValue];
            } else {
                theColumn = [aNumber intValue];
                if (aTile.row == theRow && aTile.column == theColumn) {
                    aTile.isActive = YES;
                    [aTile addTexture:verticalParallel];
                }
            }
            
            counter++;
        }
        counter = 1;
        theRow = 0;
        theColumn = 0;
        
        for (NSNumber *aNumber in horizontalParallelArray) {
            
            if (counter % 2 != 0 ) {
                theRow = [aNumber intValue];
            } else {
                theColumn = [aNumber intValue];
                if (aTile.row == theRow && aTile.column == theColumn) {
                    aTile.isActive = YES;
                    [aTile addTexture:horizontalParallel];
                }
            }
            
            counter++;
        }
        counter = 1;
        theRow = 0;
        theColumn = 0;
        
        for (NSNumber *aNumber in activeTileArray) {
            
            if (counter % 2 != 0 ) {
                theRow = [aNumber intValue];
            } else {
                theColumn = [aNumber intValue];
                if (aTile.row == theRow && aTile.column == theColumn) {
                    aTile.isActive = YES;
                }
            }
            
            counter++;
        }
        
        
    }
}

- (void) clearBoard {
    
    for (GridTile *aTile in self.theGridTileArray) {
        [aTile removeDot];
    }
}

































@end
