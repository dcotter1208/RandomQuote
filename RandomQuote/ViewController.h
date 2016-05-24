//
//  ViewController.h
//  RandomQuote
//
//  Created by DetroitLabs on 5/24/16.
//  Copyright © 2016 DetroitLabs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property(nonatomic, strong) NSArray *randomQuotes;
@property(nonatomic, strong) NSArray *randomColors;
@property(nonatomic, strong) NSTimer *timer;
@property(nonatomic) int seconds;

@end

