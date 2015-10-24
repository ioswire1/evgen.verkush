//
//  ViewController.m
//  Task1-Lock
//
//  Created by IEvgen Verkush on 10/17/15.
//  Copyright © 2015 IEvgen Verkush. All rights reserved.
//

#import "ViewController.h"
#import "PlayingCardDesk.h"
#import "Card.h"
#import "PlayingCard.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (nonatomic) int flipCount;

@property (nonatomic, strong) PlayingCardDesk *playingCardDesk;

@end

@implementation ViewController

- (void)viewDidLoad {
    self.playingCardDesk = [[PlayingCardDesk alloc] init];
}

- (void) setFlipCount:(int)flipCount {
    _flipCount = flipCount;
    self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %d", _flipCount];
}

- (IBAction)touchCardButton:(UIButton *)sender {
    if ([sender.currentTitle length] > 0) {
        [sender setBackgroundImage:[UIImage imageNamed:@"cardback"]
                          forState:UIControlStateNormal];
        [sender setTitle:@"" forState:UIControlStateNormal];
    } else {
        Card *card = [self.playingCardDesk drawRandomCard];
        if (card != nil) {
            [sender setBackgroundImage:[UIImage imageNamed:@"cardholder"]
                              forState:UIControlStateNormal];
            [sender setTitle:card.contents forState:UIControlStateNormal];
            if ([card isKindOfClass:[PlayingCard class]]) {
                [sender setTitleColor:((PlayingCard *)card).color forState:UIControlStateNormal];
            }
        } else {
            [sender setBackgroundImage:[UIImage imageNamed:@"crossedredcircle"]
                              forState:UIControlStateNormal];
            [sender setTitle:@"" forState:UIControlStateNormal];
        }
    }
    
    self.flipCount++;
}

- (void)myMethod:(NSString *)s1 wish

@end
