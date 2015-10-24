//
//  Card.h
//  Task1-Lock
//
//  Created by IEvgen Verkush on 10/17/15.
//  Copyright © 2015 IEvgen Verkush. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property (nonatomic, strong) NSString *contents;

@property (nonatomic, getter=isMatched) BOOL matched;
@property (nonatomic, getter=isChosen) BOOL chosen;

- (int)match:(NSArray *)otherCards;

@end
