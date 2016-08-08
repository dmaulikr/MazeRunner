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

- (NSString *)description {
    
    NSString *str = @"\n\nStart:\n";
    for(id key in self.gridDictionary) {
        //NSLog(@"key=%@ value=%@", key, [self.gridDictionary objectForKey:key]);
        str = [str stringByAppendingString:[NSString stringWithFormat:@"key: %@ Cell: %@\n ", key, [self.gridDictionary objectForKey:key]]];
    }
    return str;
}

@end
