//
//  ViewController.m
//  MazeRunner
//
//  Created by William Lundy on 8/3/16.
//  Copyright © 2016 William Lundy. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()



@property (nonatomic, strong) NSString *imageName;
@property (nonatomic, strong) NSDictionary *imageViewTranslationDictionary;

// Score Labels



// Grid Labels

// 7th row down (Bottom row)
@property (weak, nonatomic) IBOutlet UIImageView *oneOne;
@property (weak, nonatomic) IBOutlet UIImageView *twoOne;
@property (weak, nonatomic) IBOutlet UIImageView *threeOne;
@property (weak, nonatomic) IBOutlet UIImageView *fourOne;
@property (weak, nonatomic) IBOutlet UIImageView *fiveOne;
@property (weak, nonatomic) IBOutlet UIImageView *sixOne;
@property (weak, nonatomic) IBOutlet UIImageView *sevenOne;


// 6th row down (Second from the bottom row)


// 5th row down (Third row from the bottom)


// 4th row down (Middle row)


// 3rd row down (fifth up)


// 2nd row down (sixth up)


// 1st row (top row)




@end

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

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // Build the location translation dictionary
    self.imageViewTranslationDictionary = [[NSMutableDictionary alloc] initWithDictionary:@{ @11 : @"oneOne",
                                                                                             @21 : @"twoOne",
                                                                                             @31 : @"threeOne",
                                                                                             @41 : @"fourOne",
                                                                                             @51 : @"fiveOne",
                                                                                             @61 : @"sixOne",
                                                                                             @71 : @"sevenOne"}];

    
    [self changeLocation:@61 toImage:ImageTypeBlueFace];
    [self changeLocation:@41 toImage:ImageTypePrize];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (void)changeLocationImage:(UIImageView *)location toImage:(NSString *)newImage {
    
    location.image = [UIImage imageNamed:newImage];
}
                             
- (void)changeLocation:(NSNumber *)locationNumber toImage:(enum ImageType)newImage {
    
    UIImageView *locationImageView = [self valueForKey:[self.imageViewTranslationDictionary objectForKey:locationNumber]];
    
    switch(newImage) {
        case ImageTypeGrayDot:
            locationImageView.image = [UIImage imageNamed:@"GrayDot100"];
            break;
        case ImageTypePrize:
            locationImageView.image = [UIImage imageNamed:@"Prize100"];
            break;
        case ImageTypeRedTeam:
            locationImageView.image = [UIImage imageNamed:@"RedTeam100"];
            break;
        case ImageTypeRedFace:
            locationImageView.image = [UIImage imageNamed:@"RedFace100"];
            break;
        case ImageTypeRedBeenThere:
            locationImageView.image = [UIImage imageNamed:@"RedBeenThere100"];
            break;
        case ImageTypeBlueTeam:
            locationImageView.image = [UIImage imageNamed:@"BlueTeam100"];
            break;
        case ImageTypeBlueFace:
            locationImageView.image = [UIImage imageNamed:@"BlueFace100"];
            break;
        case ImageTypeBlueBeenThere:
            locationImageView.image = [UIImage imageNamed:@"BlueBeenThere100"];
            break;
        default:
            locationImageView.image = [UIImage imageNamed:@"GrayDot100"];
            NSLog(@"%@", [NSString stringWithFormat:@"Unrecognized ImageType"]);
            break;
            
    }
    
}
                             
                             

@end
