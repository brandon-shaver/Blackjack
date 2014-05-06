//
//  Hand.h
//  BlackjackGame
//
//  Created by Shaver, Brandon L on 5/6/14.
//  Copyright (c) 2014 Shaver, Brandon L. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Card.h"



@interface Hand : NSObject{
    
}



@property NSMutableArray *cardsInHand;


-(void) addCard: (Card *)card;

-(int) getHandPoints;

-(int) numOfCards;

-(Card*) getCard: (int) index;


@end
