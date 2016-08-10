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
    
    //
    self = [super init];
    if (self) {
        Cell *newCell;
        self.gridDictionary = [[NSMutableDictionary alloc] init];
        self.redPath = [[NSMutableArray alloc] init];
        self.bluePath = [[NSMutableArray alloc] init];
        self.redPrevious = [[NSMutableArray alloc] init];
        self.bluePrevious = [[NSMutableArray alloc] init];
        self.winner = PlayerTypeNoPlayer;
        self.gDH = [[DebugHelper alloc] initWithDictionary:@{ @"iWD" : @NO,
                                                              @"description" : @NO,
                                                              @"movesAvailable:forSnakeBotColor:" : @NO,
                                                              @"isLocation:ofImageType:" : @NO,
                                                              @"isValidBoardLocation:" : @NO,
                                                              @"isAdjacent:" : @NO,
                                                              @"isValidMoveFromLocation:" : @NO,
                                                              @"resetGameGrid" : @NO,
                                                              @"changeLocationNumber:" : @NO,
                                                              @"snakeBotStartAtLocation:" : @NO,
                                                              @"moveCurrentHead:" : @NO,
                                                              @"headLocationForPlayerColor:" : @NO,
                                                              @"randomPrizeLocation" : @NO,
                                                              //@"**********" : @NO,
                                                              @"GridDebug" : @NO
                                                                          }];
  
        for(id key in dictionary) {
            if ([_gDH isOn:@"iWD"]) {NSLog(@"key=%@ value=%@", key, [dictionary objectForKey:key]);}
            
            
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
    
    NSLog(@"movesAvailable called with head location: %@",headLocation);
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
//    NSLog(@"%d\n", (checkCell.imageType == imageType));
//    NSLog(@"headLocation: %@\n", location);
//    NSLog(@"ImageType: %ld\n", (long)imageType);
//    NSLog(@"Check Cell ImageType: %ld\n", checkCell.imageType);
//    NSLog(@"Check Cell contents: %@\n", checkCell);
    //NSLog(@"Check Grid contents: %@\n", self.gridDictionary);
    if (checkCell.imageType == imageType) {
        return YES;
    } else {
        return NO;
    }
}

- (bool)isValidBoardLocation:(NSNumber *)moveLocation {
    
    if (moveLocation != nil) {
        return ((moveLocation.intValue % 10 < 8 && moveLocation.intValue < 67) && (moveLocation.intValue >= 0));
    } else {
        return NO;
    }
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
    
    //NSLog(@"%@ and %@", headLocation, toLocation);
    // If both locations are on the board
    if ([self isValidBoardLocation:headLocation] && [self isValidBoardLocation:toLocation]) {
        
        //NSLog(@"These are valid board locations");
       // If both locations are adjacent
        if ([self isAdjacent:headLocation toLocation:toLocation]) {
            
            //NSLog(@"These are adjacent locations");
            
            // If the to location is open
            if ([self isLocation:toLocation ofImageType:ImageTypeGrayDot] || [self isLocation:toLocation ofImageType:ImageTypePrize]) {
                return YES;
            } else {
               //NSLog(@"Not Open");
            }
            
        } else {
            //NSLog(@"Locations not adjacent:%@ %@", headLocation, toLocation);
        }
        
    } else {
        //NSLog(@"Not a valid board location");
    }
    return NO;
    
}

#pragma mark - Update Functions

- (void)resetGameGrid {
    for (id key in self.gridDictionary) {
        [self changeLocationNumber:key toNewImage:ImageTypeGrayDot];
    }
    self.winner = PlayerTypeNoPlayer;
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
    
    // If new location is nil
    if (newLocation == nil) {
        
        
        // Backtrack as long as its not the starting point
        if (playerColor == ImageTypeRedFace) {
            if (self.redHead == currentHead) {
                NSNumber *lastLocation = [self.redPath lastObject];
                NSLog(@"Last Location: %@\n\n", lastLocation);
                NSLog(@"Path Array: %@\n\n", lastLocation);
                [self changeLocationNumber:currentHead toNewImage:ImageTypeGrayDot];
                [self changeLocationNumber:lastLocation toNewImage:ImageTypeRedFace];
                self.redHead = lastLocation;
                [self.redPath removeLastObject];
                
            }
        }
        if (playerColor == ImageTypeBlueFace) {
            if (self.blueHead == currentHead) {
                NSNumber *lastLocation = [self.bluePath lastObject];
                NSLog(@"Last Location: %@\n\n", lastLocation);
                [self changeLocationNumber:currentHead toNewImage:ImageTypeGrayDot];
                [self changeLocationNumber:lastLocation toNewImage:ImageTypeBlueFace];
                self.blueHead = lastLocation;
                [self.bluePath removeLastObject];
                
            }
            
        }
        
    } else {
    
    // verify that the head location is correct
        if (playerColor == ImageTypeRedFace) {
            if (self.redHead == currentHead) {
                if ([self isValidMoveFromLocation:currentHead toLocation:newLocation]) {
                    [self changeLocationNumber:currentHead toNewImage:ImageTypeRedBeenThere];
                    [self changeLocationNumber:newLocation toNewImage:ImageTypeRedFace];
                    self.redHead = newLocation;
                    [self.redPath addObject:newLocation];
                    [self.redPrevious addObject:newLocation];
                    NSLog(@"\nRed Moves From:%@ To:%@ Prize is:%@\n\n", currentHead, newLocation, self.prizeLocation);
                    if (self.redHead.intValue == self.prizeLocation.intValue) {
                        self.winner = PlayerTypeRedPlayer;
                        NSLog(@"Red Wins*******************");
                    }
                }
            }
        }
        if (playerColor == ImageTypeBlueFace) {
            if (self.blueHead == currentHead) {
                if ([self isValidMoveFromLocation:currentHead toLocation:newLocation]) {
                    [self changeLocationNumber:currentHead toNewImage:ImageTypeBlueBeenThere];
                    [self changeLocationNumber:newLocation toNewImage:ImageTypeBlueFace];
                    self.blueHead = newLocation;
                    [self.bluePath addObject:newLocation];
                    [self.bluePrevious addObject:newLocation];
                    NSLog(@"\nBlue Moves From:%@ To:%@ Prize is:%@\n\n", currentHead, newLocation, self.prizeLocation);
                    if (self.blueHead.intValue == self.prizeLocation.intValue) {
                        self.winner = PlayerTypeBluePlayer;
                        NSLog(@"Blue Wins******************");
                    }
                }
            }
        }
    }
}

- (NSNumber *)headLocationForPlayerColor:(enum ImageType)playerColor {
    
    if (playerColor == ImageTypeRedFace) {
        return self.redHead;
    }
    if (playerColor == ImageTypeBlueFace) {
        return self.blueHead;
    }
    return nil;
}

- (void)randomPrizeLocation {
    
    // Generate a random location
    NSNumber *newPrizeLocation = @(arc4random_uniform(7) * 10 +arc4random_uniform(7));
    
    // Call change location and update the model
    [self changeLocationNumber:newPrizeLocation toNewImage:ImageTypePrize];
    
    // Set the win position in grid
    self.prizeLocation = newPrizeLocation;
}






@end
