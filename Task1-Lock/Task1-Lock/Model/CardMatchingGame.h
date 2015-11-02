//
//  CardMatchingGame.h
//  Task1-Lock
//
//  Created by IEvgen Verkush on 10/27/15.
//  Copyright © 2015 IEvgen Verkush. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Desk.h"
#import "Card.h"

@interface CardMatchingGame : NSObject

@property (nonatomic, readonly) NSInteger score;

- (instancetype) initWithCardCount:(NSInteger)count
                         usingDesk:(Desk *)desk;
- (instancetype) initWithCardCount:(NSInteger)count
                         usingDesk:(Desk *)desk
                    numbeOfMatches:(NSInteger)numbeOfMatches;
- (void)chooseCardAtIndex:(NSUInteger)index;
- (Card *)cardAtIndex:(NSUInteger)index;

@end
