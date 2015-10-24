//
//  Desk.h
//  Task1-Lock
//
//  Created by IEvgen Verkush on 10/17/15.
//  Copyright © 2015 IEvgen Verkush. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Desk : NSObject

- (void)addCard:(Card *)card;
- (void)addCard:(Card *)card atTop:(BOOL)atTop;

- (Card *)drawRandomCard;

@end
