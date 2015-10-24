//
//  PlayingCardDesk.m
//  Task1-Lock
//
//  Created by IEvgen Verkush on 10/17/15.
//  Copyright © 2015 IEvgen Verkush. All rights reserved.
//

#import "PlayingCardDesk.h"
#import "PlayingCard.h"

@implementation PlayingCardDesk

- (instancetype)init {
    self = [super init];
    if (self != nil) {
        for (NSString *suit in [PlayingCard availableSuits]) {
            for (NSUInteger rank = 1; rank < [PlayingCard maxRank]; rank++) {
                PlayingCard *card = [[PlayingCard alloc] init];
                card.rank = rank;
                card.suit = suit;
                
                [self addCard: card];
            }
        }
    }
    return self;
}

@end
