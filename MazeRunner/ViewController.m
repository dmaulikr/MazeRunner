//
//  ViewController.m
//  MazeRunner
//
//  Created by William Lundy on 8/3/16.
//  Copyright © 2016 William Lundy. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

// Score Labels
@property (weak, nonatomic) IBOutlet UILabel *leftSnakeColor;
@property (weak, nonatomic) IBOutlet UILabel *leftSnakeScore;
@property (weak, nonatomic) IBOutlet UILabel *rightSnakeColor;
@property (weak, nonatomic) IBOutlet UILabel *rightSnakeScore;

// Grid Labels

// 7th row down (Bottom row)
@property (weak, nonatomic) IBOutlet UILabel *oneOne;
@property (weak, nonatomic) IBOutlet UILabel *twoOne;
@property (weak, nonatomic) IBOutlet UILabel *threeOne;
@property (weak, nonatomic) IBOutlet UILabel *fourOne;
@property (weak, nonatomic) IBOutlet UILabel *fiveOne;
@property (weak, nonatomic) IBOutlet UILabel *sixOne;
@property (weak, nonatomic) IBOutlet UILabel *sevenOne;

// 6th row down (Second from the bottom row)
@property (weak, nonatomic) IBOutlet UILabel *oneTwo;
@property (weak, nonatomic) IBOutlet UILabel *twoTwo;
@property (weak, nonatomic) IBOutlet UILabel *threeTwo;
@property (weak, nonatomic) IBOutlet UILabel *fourTwo;
@property (weak, nonatomic) IBOutlet UILabel *fiveTwo;
@property (weak, nonatomic) IBOutlet UILabel *sixTwo;
@property (weak, nonatomic) IBOutlet UILabel *sevenTwo;

// 5th row down (Third row from the bottom)
@property (weak, nonatomic) IBOutlet UILabel *oneThree;
@property (weak, nonatomic) IBOutlet UILabel *twoThree;
@property (weak, nonatomic) IBOutlet UILabel *threeThree;
@property (weak, nonatomic) IBOutlet UILabel *fourThree;
@property (weak, nonatomic) IBOutlet UILabel *fiveThree;
@property (weak, nonatomic) IBOutlet UILabel *sixThree;
@property (weak, nonatomic) IBOutlet UILabel *sevenThree;

// 4th row down (Middle row)
@property (weak, nonatomic) IBOutlet UILabel *oneFour;
@property (weak, nonatomic) IBOutlet UILabel *twoFour;
@property (weak, nonatomic) IBOutlet UILabel *threeFour;
@property (weak, nonatomic) IBOutlet UILabel *fourFour;
@property (weak, nonatomic) IBOutlet UILabel *fiveFour;
@property (weak, nonatomic) IBOutlet UILabel *sixFour;
@property (weak, nonatomic) IBOutlet UILabel *sevenFour;

// 3rd row down (fifth up)
@property (weak, nonatomic) IBOutlet UILabel *oneFive;
@property (weak, nonatomic) IBOutlet UILabel *twoFive;
@property (weak, nonatomic) IBOutlet UILabel *threeFive;
@property (weak, nonatomic) IBOutlet UILabel *fourFive;
@property (weak, nonatomic) IBOutlet UILabel *fiveFive;
@property (weak, nonatomic) IBOutlet UILabel *sixFive;
@property (weak, nonatomic) IBOutlet UILabel *sevenFive;

// 2nd row down (sixth up)
@property (weak, nonatomic) IBOutlet UILabel *oneSix;
@property (weak, nonatomic) IBOutlet UILabel *twoSix;
@property (weak, nonatomic) IBOutlet UILabel *threeSix;
@property (weak, nonatomic) IBOutlet UILabel *fourSix;
@property (weak, nonatomic) IBOutlet UILabel *fiveSix;
@property (weak, nonatomic) IBOutlet UILabel *sixSix;
@property (weak, nonatomic) IBOutlet UILabel *sevenSix;

// 1st row (top row)
@property (weak, nonatomic) IBOutlet UILabel *oneSeven;
@property (weak, nonatomic) IBOutlet UILabel *twoSeven;
@property (weak, nonatomic) IBOutlet UILabel *threeSeven;
@property (weak, nonatomic) IBOutlet UILabel *fourSeven;
@property (weak, nonatomic) IBOutlet UILabel *fiveSeven;
@property (weak, nonatomic) IBOutlet UILabel *sixSeven;
@property (weak, nonatomic) IBOutlet UILabel *sevenSeven;



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
