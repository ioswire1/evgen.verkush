//
//  PlayingCard.h
//  Task1-Lock
//
//  Created by IEvgen Verkush on 10/17/15.
//  Copyright © 2015 IEvgen Verkush. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Card.h"

@interface PlayingCard : Card

@property (nonatomic, strong) NSString *suit;
@property (nonatomic) NSUInteger rank;

+ (NSArray *)availableSuits;
+ (NSUInteger)maxRank;

- (UIColor *)color;

@end
