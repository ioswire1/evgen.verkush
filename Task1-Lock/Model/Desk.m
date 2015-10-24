//
//  Desk.m
//  Task1-Lock
//
//  Created by IEvgen Verkush on 10/17/15.
//  Copyright © 2015 IEvgen Verkush. All rights reserved.
//

#import "Desk.h"

@interface Desk()

@property (nonatomic, strong) NSMutableArray *cards; //of Card

@end

@implementation Desk

- (NSArray *)cards {
    if (_cards == nil) {
        _cards = [[NSMutableArray alloc] init];
    }
    return _cards;
}

- (void)addCard:(Card *)card atTop:(BOOL)atTop {
    if (atTop) {
        [self.cards insertObject:card atIndex:0];
    } else {
        [self.cards addObject:card];
    }
}

- (void)addCard:(Card *)card {
    [self addCard:card atTop:NO];
}

- (Card *)drawRandomCard {
    Card *randomCard;
    if ([self.cards count] > 0) {
        NSUInteger randomCardIndex = arc4random_uniform((int32_t)[self.cards count]);
        randomCard = self.cards[randomCardIndex];
        [self.cards removeObjectAtIndex:randomCardIndex];
    }
    return randomCard;
}

@end
