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
    _quoteTextView.text = [self getRandomQuote];
    _quoteTextView.textColor = [self getRandomColor];
    self.view.backgroundColor = [self getRandomColor];
}


-(void)subtractTime {
    _seconds--;

    if (_seconds == 0){
        [self nextQuote];
        _seconds = 2;
    }
}

-(void)appSetup {
    _seconds = 2;
    _timer = [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(subtractTime) userInfo:nil repeats:YES];
    
    _randomQuotes = @[@"Whoof - Georgia Cotter", @"Quote 2", @"Quote 3", @"Quote 4", @"Quote 5", @"Quote 6", @"Quote 7"];
    _randomColors = @[[UIColor blueColor], [UIColor redColor], [UIColor greenColor], [UIColor purpleColor]];
}


@end
