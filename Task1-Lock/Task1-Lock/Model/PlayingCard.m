//
//  PlayingCard.m
//  Task1-Lock
//
//  Created by IEvgen Verkush on 10/17/15.
//  Copyright © 2015 IEvgen Verkush. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard

+ (NSArray *)rankStrings {
    return @[@"?", @"A", @"2", @"3", @"4", @"5", @"6",
             @"7", @"8", @"9", @"10", @"J", @"Q", @"K"];
}

+ (NSArray *)availableSuits {
    return @[@"♣︎", @"♠︎", @"♥︎", @"♦︎"];
}

+ (NSUInteger)maxRank {
    return [[PlayingCard rankStrings] count];
}

@synthesize suit=_suit;

- (void)setSuit:(NSString *)suit {
    if ([[PlayingCard availableSuits] containsObject:suit]) {
        _suit = suit;
    }
}

- (NSString *)suit {
    return _suit ? _suit : @"?";
}

- (NSString *)contents {
    NSArray *rankStrings = [PlayingCard rankStrings];
    return [rankStrings[self.rank] stringByAppendingString:self.suit];
}

- (UIColor *)color {
    UIColor *color;
    if ([self.suit isEqualToString:@"♣︎"] || [self.suit isEqualToString:@"♠︎"]) {
        color = [UIColor blackColor];
    } else if ([self.suit isEqualToString:@"♥︎"] || [self.suit isEqualToString:@"♦︎"]) {
        color = [UIColor redColor];
    }
    return color;
}


- (int)match:(NSArray *)otherCards {
    int score = 0;
    
    for (PlayingCard *otherCard in otherCards) {
        score += [self matchWithOneCard:otherCard];
    }
    
    return score;
}

- (int)matchWithOneCard:(PlayingCard *)otherCard {
    int score = 0;
    if (otherCard.rank == self.rank) {
        score = 4;
    } else if (otherCard.suit == self.suit) {
        score = 1;
    }
    
    if (score > 0) {
        otherCard.matched = YES;
        self.matched = YES;
    }
    
    return score;
}


@end
