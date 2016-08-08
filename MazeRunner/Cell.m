//
//  Cell.m
//  MazeRunner
//
//  Created by William Lundy on 8/6/16.
//  Copyright © 2016 William Lundy. All rights reserved.
//

#import "Cell.h"

@implementation Cell

- (instancetype)initWithDictionary:(NSDictionary *)dictionary andImageType:(enum ImageType)imageType
{
    self = [super init];
    if (self) {
        
        self.imageType = imageType;
        self.imageViewNameString = dictionary[@"imageViewNameString"];
        self.locationNumber = dictionary[@"locationNumber"];
        
    }
    return self;
}

- (NSString *)description {
    
    return [NSString stringWithFormat:@"Location Number: %@, Image View Name: %@, Image Type %li",self.locationNumber, self.imageViewNameString, (long)self.imageType];
    
}

@end
