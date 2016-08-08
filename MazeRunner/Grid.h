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

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;


@end
