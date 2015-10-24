//
//  Card.m
//  Task1-Lock
//
//  Created by IEvgen Verkush on 10/17/15.
//  Copyright © 2015 IEvgen Verkush. All rights reserved.
//

#import "Card.h"

@implementation Card

- (int)match:(NSArray *)otherCards {
    int score = 0;
    
    for (Card *card in otherCards){
        if ([self.contents isEqualToString:card.contents]) {
            score = 1;
            break;
        }
    }
    return score;
}

@end
