//
//  Deck.h
//  BlackjackGame
//
//  Created by Shaver, Brandon L on 5/5/14.
//  Copyright (c) 2014 Shaver, Brandon L. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject{
    
    NSMutableArray *cardDeck;
}

-(void) shuffleCards;

-(Card*) draw;



@end
