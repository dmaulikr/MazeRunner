//
//  Grid.m
//  MazeRunner
//
//  Created by William Lundy on 8/7/16.
//  Copyright © 2016 William Lundy. All rights reserved.
//
#import "Cell.h"
#import "Grid.h"

@implementation Grid

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    Cell *newCell;
    self.gridDictionary = [[NSMutableDictionary alloc] init];
    self = [super init];
    if (self) {
        for(id key in dictionary) {
            // NSLog(@"key=%@ value=%@", key, [dictionary objectForKey:key]);
            newCell = [[Cell alloc] initWithDictionary:@{@"locationNumber" : key,
                                                         @"imageViewNameString" : [dictionary objectForKey:key]}
                                          andImageType:ImageTypeGrayDot];
        [self.gridDictionary setObject:newCell forKey:key];
        }
        
    }
    return self;
}

#pragma mark - Grid Status Functions

- (NSString *)description {
    
    NSString *str = @"\n\nStart:\n";
    for(id key in self.gridDictionary) {
        
        str = [str stringByAppendingString:[NSString stringWithFormat:@"key: %@ Cell: {%@}\n ", key, [self.gridDictionary objectForKey:key]]];
    }
    return str;
}



- (NSArray *)movesAvailable:(NSNumber *)headLocation forSnakeBotColor:(enum ImageType)imageType {
    
    NSLog(@"movesAvailable called");
    NSMutableArray *moveArray = [[NSMutableArray alloc] init];
    NSArray *checkArray = [NSArray arrayWithObjects:@(headLocation.intValue - 1), @(headLocation.intValue + 10), @(headLocation.intValue + 1), @(headLocation.intValue - 10), nil];
    NSLog(@"Check Array complete:%@", checkArray);
    // If the Head Location matches the actual head location
    if ([self isLocation:headLocation ofImageType:imageType]) {
        
        NSLog(@"valid head location");
        for (id toLocation in checkArray) {
            // Check for available moves
            if ([self isValidMoveFromLocation:headLocation toLocation:toLocation]) {
                
                [moveArray addObject:toLocation];
            }
        }
        
        
    }
    return [NSArray arrayWithArray:moveArray];
    
}

#pragma mark - Bool Functions

- (bool)isLocation:(NSNumber *)location ofImageType:(enum ImageType)imageType {
    
    Cell *checkCell = [self.gridDictionary objectForKey:location];
    NSLog(@"%d\n", (checkCell.imageType == imageType));
    NSLog(@"headLocation: %@\n", location);
    NSLog(@"ImageType: %ld\n", (long)imageType);
    NSLog(@"Check Cell ImageType: %ld\n", checkCell.imageType);
    NSLog(@"Check Cell contents: %@\n", checkCell);
    NSLog(@"Check Grid contents: %@\n", self.gridDictionary);
    if (checkCell.imageType == imageType) {
        return YES;
    } else {
        return NO;
    }
}

- (bool)isValidBoardLocation:(NSNumber *)moveLocation {
    
    return ((moveLocation.intValue % 10 < 8 && moveLocation.intValue < 67) && (moveLocation.intValue >= 0));
    
}

- (bool)isAdjacent:(NSNumber *)headLocation toLocation:(NSNumber *)toLocation {
    
    if (toLocation.intValue == headLocation.intValue - 1) {
        return YES;
    }
    if (toLocation.intValue == headLocation.intValue + 10) {
        return YES;
    }
    if (toLocation.intValue == headLocation.intValue + 1) {
        return YES;
    }
    if (toLocation.intValue == headLocation.intValue - 10) {
        return YES;
    }
    return NO;
    
}

- (bool)isValidMoveFromLocation:(NSNumber *)headLocation toLocation:(NSNumber *)toLocation {
    
    // If both locations are on the board
    if ([self isValidBoardLocation:headLocation] && [self isValidBoardLocation:toLocation]) {
        
       // If both locations are adjacent
        if ([self isAdjacent:headLocation toLocation:toLocation]) {
            
            // If the to location is open
            if ([self isLocation:toLocation ofImageType:ImageTypeGrayDot]) {
                return YES;
            } else {
               NSLog(@"Not Open");
            }
            
        } else {
            NSLog(@"Locations not adjacent:%@ %@", headLocation, toLocation);
        }
        
    } else {
        NSLog(@"Not a valid board location");
    }
    return NO;
    
}

#pragma mark - Update Functions

- (void)resetGameGrid {
    for (id key in self.gridDictionary) {
        [self changeLocationNumber:key toNewImage:ImageTypeGrayDot];
    }
}

- (void)changeLocationNumber:(NSNumber *)locationNumber toNewImage:(enum ImageType)newImage {
    [[self.gridDictionary objectForKey:locationNumber] setImageType:newImage];
}

- (void)snakeBotStartAtLocation:(NSNumber *)startLocation withImageType:(enum ImageType)playerColor {
    
    if (playerColor == ImageTypeRedFace) {
        self.redStart = startLocation;
        self.redHead = startLocation;
        [self changeLocationNumber:startLocation toNewImage:playerColor];
    }
    if (playerColor == ImageTypeBlueFace) {
        self.blueStart = startLocation;
        self.blueHead = startLocation;
        [self changeLocationNumber:startLocation toNewImage:playerColor];
    }
}

- (void)moveCurrentHead:(NSNumber *)currentHead toNewLocation:(NSNumber *)newLocation forPlayerColor:(enum ImageType)playerColor {
    
    // verify that the head location is correct
    if (playerColor == ImageTypeRedFace) {
        if (self.redHead == currentHead) {
            if ([self isValidMoveFromLocation:currentHead toLocation:newLocation]) {
                [self changeLocationNumber:currentHead toNewImage:ImageTypeRedBeenThere];
                [self changeLocationNumber:newLocation toNewImage:ImageTypeRedFace];
                self.redHead = newLocation;
            }
        }
    }
    if (playerColor == ImageTypeBlueFace) {
        if (self.blueHead == currentHead) {
            if ([self isValidMoveFromLocation:currentHead toLocation:newLocation]) {
                [self changeLocationNumber:currentHead toNewImage:ImageTypeBlueBeenThere];
                [self changeLocationNumber:newLocation toNewImage:ImageTypeBlueFace];
                self.blueHead = newLocation;
            }
        }
    }
    
}



@end
