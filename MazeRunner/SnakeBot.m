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

#pragma mark - Init Functions

- (instancetype)initWithStart:(NSNumber *)startLocation andPlayerColor:(enum ImageType)playerColor withGameGrid:(NSDictionary *)gameGrid {
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

#pragma mark - Querry Grid Functions

- (NSNumber *)makeYourMoveSnakeBot:(Grid *)gameGrid {
    
    NSNumber *chosenMove;
    //NSArray
    
    // Ask the grid for available moves
    NSArray *availableMoves = [gameGrid movesAvailable:[gameGrid headLocationForPlayerColor:self.playerColor] forSnakeBotColor:self.playerColor];
    
    //NSArray *availableMoves = @[@1,@10];
    
    // Remove the places we have already been from the available moves array
    
    // If there are moves in the move array choose one
    if (availableMoves.count > 0) {
        NSLog(@"availableMoves Count:%lu", (unsigned long)(availableMoves.count));
        chosenMove = [self choseRandomMove:availableMoves];
    }
    // If there are no moves available, back track
    else {
        chosenMove = nil;
    }

    // Return the choice
    return chosenMove;
}

#pragma mark - Decision Functions

- (NSNumber *)choseRandomMove:(NSArray *)choiceArray {
    
    // If there are moves available
    if (choiceArray.count > 0) {
        return [choiceArray objectAtIndex:arc4random_uniform(choiceArray.count)];
    } else {
        return nil;
    }
    
    
    
}



@end
