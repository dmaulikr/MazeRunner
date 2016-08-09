//
//  SnakeBot.h
//  MazeRunner
//
//  Created by William Lundy on 8/7/16.
//  Copyright © 2016 William Lundy. All rights reserved.
//
#import "Cell.h"
#import <Foundation/Foundation.h>

@interface SnakeBot : NSObject

@property (nonatomic, strong)NSNumber *startLocation;
@property (nonatomic, strong)NSNumber *headLocation;
@property (nonatomic, assign)enum ImageType playerColor;
@property (nonatomic,strong)NSMutableArray *snakePath;
@property (nonatomic,strong)NSMutableArray *previousSteps;

//Init Methods
- (instancetype)initWithStart:(NSNumber *)startLocation andPlayerColor:(enum ImageType)playerColor withGameGrid:(Grid *)gameGrid;

// Logic Methods
- (NSNumber *)makeYourMoveSnakeBot:(Grid *)gameGrid;
@end
