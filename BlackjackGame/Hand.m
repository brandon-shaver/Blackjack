//
//  Hand.m
//  BlackjackGame
//
//  Created by Shaver, Brandon L on 5/6/14.
//  Copyright (c) 2014 Shaver, Brandon L. All rights reserved.
//

#import "Hand.h"
#import "Card.h"

@implementation Hand

@synthesize handClosed=_handClosed;
/*
 
 ** Creates a new hand of size 2
 **
 
 */
-(id) init{
    
    if (self = [super init]){
        self.cardsInHand = [[NSMutableArray alloc] initWithCapacity:2];
        _handClosed = NO;
    }
    
    return (self);
    
}

-(NSInteger) numOfCards {
    return ([self.cardsInHand count]);
}

/*
 
 ** Adds a card to the hand
 **
 
 */
-(void) addCard: (Card *)card{
    
    if ((_handClosed==NO) | ( [self numOfCards]==0))
    {
        [self.cardsInHand addObject:card];
    }
    else
    {
        card.cardFlipped=YES;
        [self.cardsInHand addObject:card];
    }
    
}

/*
 
 ** Calculate the hand point value based on each card in hand
 **
 
 */
-(NSInteger) getHandPoints{
    
    NSInteger points = 0;
    NSInteger numberOfAces = 0;
    
    for (Card *currentCard in self.cardsInHand) {
        if (currentCard.getCardPoint == 11)
            numberOfAces = numberOfAces +1;
        
        points = points + [currentCard getCardPoint];
        
    }
    
    while (points > 21 && numberOfAces>0)
    {
        points = points - 10;
        numberOfAces=numberOfAces-1;
    }
    return points;
    
}


/*
 
 **
 ** Get the card at a index in the hand
 
 */
-(Card *) getCard:(NSInteger) index
{
    return ([self.cardsInHand objectAtIndex:index]);
}

-(BOOL) handClosed
{
    return _handClosed;
}

-(void) setHandClosed:(BOOL)aHandClosed
{
    
    if (aHandClosed == NO) {
        for( Card *c in self.cardsInHand)
            c.cardFlipped = NO;
    }
    _handClosed = aHandClosed;
}


@end
