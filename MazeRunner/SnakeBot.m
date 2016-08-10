//
//  SnakeBot.m
//  MazeRunner
//
//  Created by William Lundy on 8/7/16.
//  Copyright © 2016 William Lundy. All rights reserved.
//
#import "Grid.h"
#import "SnakeBot.h"

@implementation SnakeBot

#pragma mark - Init Methods

- (instancetype)initWithStart:(NSNumber *)startLocation andPlayerColor:(enum ImageType)playerColor withGameGrid:(Grid *)gameGrid {
    self = [super init];
    if (self) {
        self.startLocation = startLocation;
        self.headLocation = startLocation;
        self.playerColor = playerColor;
        [self.snakePath addObject:startLocation];
        [self.previousSteps addObject:startLocation];
    }
    return self;
}

#pragma mark - Logic Methods

- (NSNumber *)makeYourMoveSnakeBot:(Grid *)gameGrid {
    
    NSNumber *chosenMove;
    //NSArray
    
    // Ask the grid for available moves
    NSMutableArray *availableMoves = [NSMutableArray arrayWithArray:[gameGrid movesAvailable:[gameGrid headLocationForPlayerColor:self.playerColor]
                                                                            forSnakeBotColor:self.playerColor]];
    
    // Remove the places we have already been from the available moves array
    [availableMoves removeObjectsInArray:self.previousSteps];
    
    // If there are moves in the move array choose one
    if (availableMoves.count > 0) {
        NSLog(@"availableMoves Count:%lu", (unsigned long)(availableMoves.count));
        chosenMove = [self choseRandomMove:availableMoves];
    }
    // If there are no moves available, back track
    else {
        chosenMove = nil;
    }
    
    // If the move is not nil
    if (chosenMove) {
    
        // Add the move to our path
        [self.snakePath addObject:chosenMove];
        
        // Add the move to places we've been
        [self.previousSteps addObject:chosenMove];
        
    }

    // Return the choice
    return chosenMove;
}



- (NSNumber *)choseRandomMove:(NSArray *)choiceArray {
    
    // If there are moves available
    if (choiceArray.count > 0) {
        return [choiceArray objectAtIndex:arc4random_uniform(choiceArray.count)];
    } else {
        return nil;
    }
    
    
    
}



@end
