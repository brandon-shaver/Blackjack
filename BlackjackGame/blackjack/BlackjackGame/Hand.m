//
//  Hand.m
//  BlackjackGame
//
//  Created by Shaver, Brandon L on 5/6/14.
//  Copyright (c) 2014 Shaver, Brandon L. All rights reserved.
//

#import "Hand.h"

@implementation Hand

/*
 
 ** Creates a new hand of size 2
 **
 
 */
-(id) init{
    
    if (self = [super init]){
        self.cardsInHand = [[NSMutableArray alloc] initWithCapacity:2];
    }
    
    return (self);
    
}

/*
 
 ** Adds a card to the hand
 **
 
 */
-(void) addCard: (Card *)card{
    
    [self.cardsInHand addObject: card];
    
}

/*
 
 ** Calculate the hand point value based on each card in hand
 **
 
 */
-(int) getHandPoints{
    
    int points = 0;
    
    for (Card *currentCard in self.cardsInHand){
        points = points + [currentCard getCardPoint];
    }
    
    return points;
    
}

/*
 
 ** Count the number of cards in the hand
 **
 
 */
-(int) numOfCards{
    
    int num  = [self.cardsInHand count];
    
    return num;
    
    
}

/*
 
 **
 ** Get the card at a index in the hand
 
 */
-(Card*) getCard: (int) index{
    
    
    Card *card = [self.cardsInHand objectAtIndex:index];
    
    return card;
    
}

@end
