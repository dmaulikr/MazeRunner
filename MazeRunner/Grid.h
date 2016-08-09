//
//  Grid.h
//  MazeRunner
//
//  Created by William Lundy on 8/7/16.
//  Copyright © 2016 William Lundy. All rights reserved.
//


#import "Cell.h"
#import <Foundation/Foundation.h>

@interface Grid : NSObject

@property (nonatomic, strong) NSMutableDictionary *gridDictionary;
@property (nonatomic, strong)NSNumber *redStart;
@property (nonatomic, strong)NSNumber *redHead;
@property (nonatomic, strong)NSNumber *blueStart;
@property (nonatomic, strong)NSNumber *blueHead;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;
- (NSArray *)movesAvailable:(NSNumber *)headLocation forSnakeBotColor:(enum ImageType)imageType;
- (void)resetGameGrid;
- (void)snakeBotStartAtLocation:(NSNumber *)startLocation withImageType:(enum ImageType)playerColor;
- (void)moveCurrentHead:(NSNumber *)currentHead toNewLocation:(NSNumber *)newLocation forPlayerColor:(enum ImageType)playerColor;
@end
