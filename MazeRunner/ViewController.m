//
//  ViewController.m
//  MazeRunner
//
//  Created by William Lundy on 8/3/16.
//  Copyright © 2016 William Lundy. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()


@property (nonatomic, strong) NSDictionary *imageViewTranslationDictionary;

// Score Labels
@property (weak, nonatomic) IBOutlet UIImageView *leftPlayerColor;
@property (weak, nonatomic) IBOutlet UILabel *leftPlayerScore;
@property (weak, nonatomic) IBOutlet UILabel *scoreTitle;
@property (weak, nonatomic) IBOutlet UIImageView *rightPlayerColor;
@property (weak, nonatomic) IBOutlet UILabel *rightPlayerScore;

// Grid Labels

// 7th row down (Bottom row)
@property (weak, nonatomic) IBOutlet UIImageView *zeroZero;
@property (weak, nonatomic) IBOutlet UIImageView *oneZero;
@property (weak, nonatomic) IBOutlet UIImageView *twoZero;
@property (weak, nonatomic) IBOutlet UIImageView *threeZero;
@property (weak, nonatomic) IBOutlet UIImageView *fourZero;
@property (weak, nonatomic) IBOutlet UIImageView *fiveZero;
@property (weak, nonatomic) IBOutlet UIImageView *sixZero;

// 6th row down (Second from the bottom row)
@property (weak, nonatomic) IBOutlet UIImageView *zeroOne;
@property (weak, nonatomic) IBOutlet UIImageView *oneOne;
@property (weak, nonatomic) IBOutlet UIImageView *twoOne;
@property (weak, nonatomic) IBOutlet UIImageView *threeOne;
@property (weak, nonatomic) IBOutlet UIImageView *fourOne;
@property (weak, nonatomic) IBOutlet UIImageView *fiveOne;
@property (weak, nonatomic) IBOutlet UIImageView *sixOne;

// 5th row down (Third row from the bottom)
@property (weak, nonatomic) IBOutlet UIImageView *zeroTwo;
@property (weak, nonatomic) IBOutlet UIImageView *oneTwo;
@property (weak, nonatomic) IBOutlet UIImageView *twoTwo;
@property (weak, nonatomic) IBOutlet UIImageView *threeTwo;
@property (weak, nonatomic) IBOutlet UIImageView *fourTwo;
@property (weak, nonatomic) IBOutlet UIImageView *fiveTwo;
@property (weak, nonatomic) IBOutlet UIImageView *sixTwo;

// 4th row down (Middle row)
@property (weak, nonatomic) IBOutlet UIImageView *zeroThree;
@property (weak, nonatomic) IBOutlet UIImageView *oneThree;
@property (weak, nonatomic) IBOutlet UIImageView *twoThree;
@property (weak, nonatomic) IBOutlet UIImageView *threeThree;
@property (weak, nonatomic) IBOutlet UIImageView *fourThree;
@property (weak, nonatomic) IBOutlet UIImageView *fiveThree;
@property (weak, nonatomic) IBOutlet UIImageView *sixThree;

// 3rd row down (fifth up)
@property (weak, nonatomic) IBOutlet UIImageView *zeroFour;
@property (weak, nonatomic) IBOutlet UIImageView *oneFour;
@property (weak, nonatomic) IBOutlet UIImageView *twoFour;
@property (weak, nonatomic) IBOutlet UIImageView *threeFour;
@property (weak, nonatomic) IBOutlet UIImageView *fourFour;
@property (weak, nonatomic) IBOutlet UIImageView *fiveFour;
@property (weak, nonatomic) IBOutlet UIImageView *sixFour;

// 2nd row down (sixth up)
@property (weak, nonatomic) IBOutlet UIImageView *zeroFive;
@property (weak, nonatomic) IBOutlet UIImageView *oneFive;
@property (weak, nonatomic) IBOutlet UIImageView *twoFive;
@property (weak, nonatomic) IBOutlet UIImageView *threeFive;
@property (weak, nonatomic) IBOutlet UIImageView *fourFive;
@property (weak, nonatomic) IBOutlet UIImageView *fiveFive;
@property (weak, nonatomic) IBOutlet UIImageView *sixFive;

// 1st row (top row)
@property (weak, nonatomic) IBOutlet UIImageView *zeroSix;
@property (weak, nonatomic) IBOutlet UIImageView *oneSix;
@property (weak, nonatomic) IBOutlet UIImageView *twoSix;
@property (weak, nonatomic) IBOutlet UIImageView *threeSix;
@property (weak, nonatomic) IBOutlet UIImageView *fourSix;
@property (weak, nonatomic) IBOutlet UIImageView *fiveSix;
@property (weak, nonatomic) IBOutlet UIImageView *sixSix;




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
    self.imageViewTranslationDictionary = [[NSMutableDictionary alloc] initWithDictionary:@{ @00 : @"zeroZero",
                                                                                             @10 : @"oneZero",
                                                                                             @20 : @"twoZero",
                                                                                             @30 : @"threeZero",
                                                                                             @40 : @"fourZero",
                                                                                             @50 : @"fiveZero",
                                                                                             @60 : @"sixZero",
                                                                                             @01 : @"zeroOne",
                                                                                             @11 : @"oneOne",
                                                                                             @21 : @"twoOne",
                                                                                             @31 : @"threeOne",
                                                                                             @41 : @"fourOne",
                                                                                             @51 : @"fiveOne",
                                                                                             @61 : @"sixOne",
                                                                                             @02 : @"zeroTwo",
                                                                                             @12 : @"oneTwo",
                                                                                             @22 : @"twoTwo",
                                                                                             @32 : @"threeTwo",
                                                                                             @42 : @"fourTwo",
                                                                                             @52 : @"fiveTwo",
                                                                                             @62 : @"sixTwo",
                                                                                             @03 : @"zeroThree",
                                                                                             @13 : @"oneThree",
                                                                                             @23 : @"twoThree",
                                                                                             @33 : @"threeThree",
                                                                                             @43 : @"fourThree",
                                                                                             @53 : @"fiveThree",
                                                                                             @63 : @"sixThree",
                                                                                             @04 : @"zeroFour",
                                                                                             @14 : @"oneFour",
                                                                                             @24 : @"twoFour",
                                                                                             @34 : @"threeFour",
                                                                                             @44 : @"fourFour",
                                                                                             @54 : @"fiveFour",
                                                                                             @64 : @"sixFour",
                                                                                             @05 : @"zeroFive",
                                                                                             @15 : @"oneFive",
                                                                                             @25 : @"twoFive",
                                                                                             @35 : @"threeFive",
                                                                                             @45 : @"fourFive",
                                                                                             @55 : @"fiveFive",
                                                                                             @65 : @"sixFive",
                                                                                             @06 : @"zeroSix",
                                                                                             @16 : @"oneSix",
                                                                                             @26 : @"twoSix",
                                                                                             @36 : @"threeSix",
                                                                                             @46 : @"fourSix",
                                                                                             @56 : @"fiveSix",
                                                                                             @66 : @"sixSix"
                                                                                             }];

    
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
