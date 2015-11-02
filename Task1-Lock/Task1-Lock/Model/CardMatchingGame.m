//
//  CardMatchingGame.m
//  Task1-Lock
//
//  Created by IEvgen Verkush on 10/27/15.
//  Copyright © 2015 IEvgen Verkush. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame()

@property (nonatomic, readwrite) NSInteger score;
@property (nonatomic, strong) NSMutableArray *cards; //of Card
@property (nonatomic) NSInteger numberOfCardsToMatch;

@end

@implementation CardMatchingGame

- (NSMutableArray *)cards {
    if (_cards == nil) {
        _cards = [[NSMutableArray alloc] init];
    }
    return _cards;
}

- (instancetype) initWithCardCount:(NSInteger)count usingDesk:(Desk *)desk {
    self = [super init];
    if (self) {
        for (int i = 0; i < count; i++) {
            Card *card = [desk drawRandomCard];
            if (card) {
                [self.cards addObject:card];
            } else {
                self = nil;
                break;
            }
        }
        self.numberOfCardsToMatch = 2;
    }
    return self;
}

- (instancetype) initWithCardCount:(NSInteger)count usingDesk:(Desk *)desk
                    numbeOfMatches:(NSInteger)numbeOfMatches
{
    self = [super init];
    self = [self initWithCardCount:count usingDesk:desk];
    if (self) {
        self.numberOfCardsToMatch = numbeOfMatches;
    }
    return self;
}

- (Card *) cardAtIndex:(NSUInteger)index {
    return index < [self.cards count] ? self.cards[index] : nil;
}

static const int MISMATHC_PENALTY = 2;
static const int MATCH_BONUS = 4;
static const int COST_TO_CHOOSE = 1;

- (void)chooseCardAtIndex:(NSUInteger)index {
    Card *card = self.cards[index];
    if (!card.isMatched) {
        if (card.isChosen) {
            card.chosen = NO;
        } else {
            self.score -= COST_TO_CHOOSE;
            card.chosen = YES;
            
            NSMutableArray *chosenCards = [[NSMutableArray alloc] init];
            int numOfMatchedCards = 0;
            for (Card *otherCard in self.cards) {
                if (otherCard.isChosen && !otherCard.isMatched) {
                    [chosenCards addObject:otherCard];
                }
                if (otherCard.isMatched) {
                    numOfMatchedCards++;
                }
            }
            
            if ([chosenCards count] == self.numberOfCardsToMatch
                || [chosenCards count] == [self.cards count] - numOfMatchedCards
            ) {
                for (int i = 0; i < [chosenCards count]; i++) {
                    NSArray *cardsToMatch = [chosenCards subarrayWithRange:NSMakeRange(i + 1, [chosenCards count] - i - 1)];
                    int matchScore = [chosenCards[i] match:cardsToMatch];
                    if (matchScore) {
                        self.score += matchScore * MATCH_BONUS;
                    } else {
                        self.score -= MISMATHC_PENALTY;
                    }
                }
                
                for (Card *chosenCard in chosenCards) {
                    if (!chosenCard.isMatched && chosenCard != card) {
                        chosenCard.chosen = NO;
                    }
                }
            }
        }
    }
}

@end
