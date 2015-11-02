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
#import "CardMatchingGame.h"

@interface ViewController ()

@property (nonatomic, strong) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (nonatomic, strong) CardMatchingGame *game;
@property (nonatomic, weak) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *numOfCardsSegemntedConrol;

@end

@implementation ViewController

- (Desk *)createDesk {
    return [[PlayingCardDesk alloc] init];
}

- (CardMatchingGame *)game {
    if (!_game) {
        _game = [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count]
                                                  usingDesk:[self createDesk]];
    }
    return _game;
}

- (IBAction)touchCardButton:(UIButton *)sender {
    NSUInteger choosenCardIndex = [self.cardButtons indexOfObject:sender];
    [self.game chooseCardAtIndex:choosenCardIndex];
    [self updateUI];
}

- (void)updateUI {
    for (UIButton *cardButton in self.cardButtons) {
        NSUInteger cardButtonIndex = [self.cardButtons indexOfObject:cardButton];
        Card *card = [self.game cardAtIndex:cardButtonIndex];
        [cardButton setTitle:[self titleForCard:card] forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self backgroundImageForCard:card] forState:UIControlStateNormal];
        if ([card isKindOfClass:[PlayingCard class]]) {
            [cardButton setTitleColor:((PlayingCard *)card).color forState:UIControlStateNormal];
        }

        cardButton.enabled = !card.isMatched;
        self.scoreLabel.text = [NSString stringWithFormat:@"Score: %ld", (long)self.game.score];
    }
}

- (NSString *)titleForCard:(Card *)card {
    return card.isChosen ? card.contents : @"";
}

- (UIImage *)backgroundImageForCard:(Card *)card {
    return [UIImage imageNamed:card.isChosen ? @"cardholder" : @"cardback"];
}

- (IBAction)touchStartButton:(id)sender {
    self.game = [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count]
                                                  usingDesk:[self createDesk]
                                             numbeOfMatches:[self numberOfCardsToMatch]];
    [self updateUI];
}

- (int)numberOfCardsToMatch {
    int numberOfCardsToMatch;
    switch (self.numOfCardsSegemntedConrol.selectedSegmentIndex) {
        case 1:
            numberOfCardsToMatch = 3;
            break;
        case 2:
            numberOfCardsToMatch = 4;
            break;
        case 0:
        default:
            numberOfCardsToMatch = 2;
            break;
    }
    return numberOfCardsToMatch;
}

@end
