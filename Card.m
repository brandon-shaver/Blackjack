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
@synthesize cardFlipped;

/*
 
 **
 ** Initializes a card with a number and suite
 
 */

-(id) initCard:(int)cNumber suit:(Suit)cSuit{
    
    if (self = [super init]){ //object is NSObject
        
        cardValue = cNumber; //assign card number
        cardSuit = cSuit; //assign card suite
        cardFlipped = NO;
        
    }
    return self;
}


/*
 
 **
 ** Returns the card point value
 
 */

-(NSInteger) getCardPoint{
    
    if (cardFlipped==YES){
        return (0);
    } else if (cardValue>=10){
        return (10);
    }else if (cardValue==1){
        return (11);
    }else
        return (cardValue);
}

/*
 
 **
 ** Returns the card suit
 
 */

-(NSString *) getCardSuit{
    
    switch (cardSuit) {
        case Hearts:
            return @"heart";
            break;
        case Spades:
            return @"spade";
            break;
        case Diamonds:
            return @"diamond";
            break;
        case Clubs:
            return @"club";
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
    
    switch (cardValue) {
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
            return [NSString stringWithFormat:@"%ld", (long)cardValue];
            break;
    }
    
}

-(NSString *) filename{
    if (cardFlipped==YES)
        return @"closed.png";
    else
        return [NSString stringWithFormat:@"%@%02ld.png", [self getCardSuit], (long)[self cardValue]];
}




@end
