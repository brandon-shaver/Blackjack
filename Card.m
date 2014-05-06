//
//  Card.m
//  BlackjackGame
//
//  Created by Shaver, Brandon L on 5/5/14.
//  Copyright (c) 2014 Shaver, Brandon L. All rights reserved.
//

#import "Card.h"

@implementation Card

@synthesize cardValue = _cardValue;
@synthesize cardSuit = _cardSuit;
@synthesize cardFlipped = _cardFlipped;

/*
 
 **
 ** Initializes a card with a number and suite
 
 */

-(id) initCard:(int)cNumber suit:(Suit)cSuit{
    
    if (self = [super init]){ //object is NSObject
        
        _cardValue = cNumber; //assign card number
        _cardSuit = cSuit; //assign card suite
        _cardFlipped = NO;
        
    }
    return self;
}


/*
 
 **
 ** Returns the card point value
 
 */

-(NSInteger) getCardPoint{
    
    if (_cardFlipped==YES)
    {
        return (0);
    }
    else if (_cardValue>=10)
        return (10);
    else if (_cardValue==1)
        return (11);
    else
        return (_cardValue);
}

/*
 
 **
 ** Returns the card suit
 
 */

-(NSString *) getCardSuit{
    
    switch (_cardSuit) {
        case Hearts:
            return @"Heart";
            break;
        case Spades:
            return @"Spade";
            break;
        case Diamonds:
            return @"Diamond";
            break;
        case Clubs:
            return @"Club";
            break;
        default:
            return nil;
            break;
    }

}

/*
 
 ** Returns card point number as a NSString
 **
 
 */

-(NSString*) getCardPointString{
    
    switch (_cardValue) {
        case 1:
            return @"Ace";
            break;
        case 11:
            return @"Jack";
            break;
        case 12:
            return @"Queen";
            break;
        case 13:
            return @"King";
            break;
        default:
            return [NSString stringWithFormat:@"%ld", (long)_cardValue];
            break;
    }
    
}

-(NSString *) filename{
    if (_cardFlipped==YES)
        return @"closed.png";
    else
        return [NSString stringWithFormat:@"%@%02ld.png", [self getCardSuit], (long)[self cardValue]];
}




@end
