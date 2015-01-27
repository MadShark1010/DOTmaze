//
//  GameStructs.h
//  DOTmaze
//
//  Created by Michael Paynter on 1/13/15.
//  Copyright (c) 2015 Michael Paynter. All rights reserved.
//

#ifndef DOTmaze_GameStructs_h
#define DOTmaze_GameStructs_h

#define iPhone6 ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone && [UIScreen mainScreen].bounds.size.height == 667)
#define iPhone6Plus ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone && [UIScreen mainScreen].bounds.size.height == 736)

#define iPad UIUserInterfaceIdiomPad

#endif

//grid textures
#define horizontalParallel 1
#define verticalParallel 2
#define topOnly 3
#define rightOnly 4
#define bottomOnly 5
#define leftOnly 6
#define topRight 7
#define bottomRight 8
#define bottomLeft 9
#define topLeft 10
#define endPieceOpenUp 11
#define endPieceOpenRight 12
#define endPieceOpenDown 13
#define endPieceOpenLeft 14