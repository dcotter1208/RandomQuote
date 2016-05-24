//
//  ViewController.m
//  RandomQuote
//
//  Created by DetroitLabs on 5/24/16.
//  Copyright © 2016 DetroitLabs. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextView *quoteTextView;
@property (weak, nonatomic) IBOutlet UILabel *countDownLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self appSetup];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

-(NSString *)getRandomQuote{
    
    UInt32 arrayCount = (UInt32)_randomQuotes.count;
    UInt32 unsignedRandomNum = arc4random_uniform(arrayCount);
    int randomNumber = (int)unsignedRandomNum;
    NSString *randomQuote = _randomQuotes[randomNumber];

    return randomQuote;
}

-(UIColor *)getRandomColor {
    
    UInt32 arrayCount = (UInt32)_randomColors.count;
    UInt32 unsignedRandomNum = arc4random_uniform(arrayCount);
    int randomNumber = (int)unsignedRandomNum;
    UIColor *randomColor = _randomColors[randomNumber];

    return randomColor;
}

-(void)nextQuote{
    _countDownLabel.text = [NSString stringWithFormat:@"Next Quote in: %i", _seconds];
    _quoteTextView.text = [self getRandomQuote];
    _quoteTextView.textColor = [self getRandomColor];
    self.view.backgroundColor = [self getRandomColor];
}


-(void)subtractTime {
    _seconds--;
    _countDownLabel.text = [NSString stringWithFormat:@"Next Quote in: %i", _seconds];
    if (_seconds == 0){
        _seconds = 2;
        [self nextQuote];
    }
}

-(void)appSetup {
    _seconds = 5;
    _countDownLabel.text = [NSString stringWithFormat:@"Next Quote in: %i", _seconds];
    _timer = [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(subtractTime) userInfo:nil repeats:YES];
    
    _randomQuotes = @[@"Whoof - Georgia Cotter",
                      @"According to most studies, people’s number one fear is public speaking. Number two is death. Death is number two! Does that sound right? That means to the average person, if you go to a funeral, you’re better off in the casket than doing the eulogy. - Jerry Seinfeld",
                      @"“Cool Whip!” – Stewie Griffin",
                      @"Does it disturb anyone else that “The Los Angeles Angels” baseball team translates directly to “The The Angels Angels”? - Neil DeGrasse Tyson",
                      @"People say nothing is impossible, but I do nothing every day - Winnie the Pooh" ,
                      @"At what age do you think it's appropriate to tell a highway it's adopted? - Zach Galifinaakis",
                      @"I'm in a glass case of emotion! - Ron Burgundy"];
    _randomColors = @[[UIColor blueColor], [UIColor redColor], [UIColor greenColor], [UIColor purpleColor], [UIColor grayColor], [UIColor lightGrayColor], [UIColor yellowColor], [UIColor magentaColor]];
}


@end
