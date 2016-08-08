//
//  Cell.h
//  MazeRunner
//
//  Created by William Lundy on 8/6/16.
//  Copyright © 2016 William Lundy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject

typedef NS_ENUM(NSInteger, ImageType)
{
    ImageTypeGrayDot = 1,
    ImageTypePrize,
    ImageTypeRedTeam,
    ImageTypeRedFace,
    ImageTypeRedBeenThere,
    ImageTypeBlueTeam,
    ImageTypeBlueFace,
    ImageTypeBlueBeenThere
};

@property (nonatomic, assign)enum ImageType imageType;
@property (nonatomic,strong)NSString *imageViewNameString;
@property (nonatomic, strong)NSNumber *locationNumber;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary andImageType:(enum ImageType)imageType;



@end
