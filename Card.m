//
//  Card.m
//  BlackjackGame
//
//  Created by Shaver, Brandon L on 5/5/14.
//  Copyright (c) 2014 Shaver, Brandon L. All rights reserved.
//

#import "Card.h"

@implementation Card

@synthesize cardValue;
@synthesize cardSuit;

/*
 
 **
 ** Initializes a card with a number and suite
 
 */

-(id) initCard:(NSInteger *)cNumber suit:(Suit)cSuit{
    
    if (self = [super init]){ //object is NSObject
        
        cardValue = *cNumber; //assign card number
        cardSuit = cSuit; //assign card suite
        
    }
    return self;
}


/*
 
 **
 ** Returns the card point value
 
 */

-(NSInteger) getCardPoint{
    
    if (cardValue == 1){ //ace is 1 or 11
        return 11;
    }else if (cardValue >= 10){
        return 10;
    }else{
        return cardValue; //card is less than 10
    }
}

/*
 
 **
 ** Returns the card suit
 
 */

-(NSString *) getCardSuit{
    
    if (cardSuit == Spades){
        return @"Spades";
    }else if (cardSuit == Clubs){
        return @"Clubs";
    }else if (cardSuit == Hearts){
        return @"Hearts";
    }else{
        return @"Diamonds";
    }
}

/*
 
 ** Returns card point number as a NSString
 **
 
 */

-(NSString*) getCardPointString{
    
    if (cardValue == 1){
        return @"Ace";
    }else if (cardValue == 11){
        return @"Jack";
    }else if (cardValue == 12){
        return @"Queen";
    }else if (cardValue == 13){
        return @"King";
    }else{
        return [NSString stringWithFormat: @"%d", cardValue];
    }
    
}
 
 

@end
