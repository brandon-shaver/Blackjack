//
//  Deck.m
//  BlackjackGame
//
//  Created by Shaver, Brandon L on 5/5/14.
//  Copyright (c) 2014 Shaver, Brandon L. All rights reserved.
//

#import "Deck.h"

@implementation Deck{
    
}

/*
 
 ** Creates a deck NSObject and calls shuffle on itself
 **
 
 */
-(id)init{
    
    if (self = [super init]){ // is NSObject
        
        cardDeck = [[NSMutableArray alloc] init]; //create empty deck
        
        for (int value = 1; value <= 13; value++){
            for(int suit=0; suit <= 3; suit++){
                
                [cardDeck addObject:[[Card alloc] initCard:value suit:suit]];
            }
        }
        
        [self shuffleCards]; //shuffle cards after creation
        

        
    }
            return self;
    
    
}

/*
 
 ** Shuffles the deck using the Fisher Yates shuffling algorithm
 **
 
 */
-(void) shuffleCards{
    
    int cardAmount = [cardDeck count];
    
    for (int i=0; i<cardAmount; i++){
        
        int elements = cardAmount - i;
        
        int n = (arc4random() % elements) + i;
        
        [cardDeck exchangeObjectAtIndex:i withObjectAtIndex:n];
    }
    
}

/*
 
 ** Draws the card from the last object in the array, then removes the card
 **
 
 */

-(Card*) draw{
    
    int numOfCards = [cardDeck count];
    
    if (numOfCards > 0){ //able to draw
        
        Card *newCard = [cardDeck lastObject]; //get the card on top
        [cardDeck removeLastObject]; //remove it from the deck object
        return newCard;
        
    }else{
        return nil; //no more cards available
    }
    
    
}

@end
