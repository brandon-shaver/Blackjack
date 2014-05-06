//
//  Card.h
//  BlackjackGame
//
//  Created by Shaver, Brandon L on 5/5/14.
//  Copyright (c) 2014 Shaver, Brandon L. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum{ Diamonds, Hearts, Spades, Clubs } Suit;

@interface Card : NSObject{
    
}

@property NSInteger cardValue;
@property Suit cardSuit;
@property BOOL cardFlipped;

-(id) initCard: (int) cNumber suit:(Suit) cSuit;
-(NSInteger) getCardPoint;
-(NSString *) filename;


@end
