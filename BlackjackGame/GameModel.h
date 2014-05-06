//
//  GameModel.h
//  BlackjackGame
//
//  Created by Shaver, Brandon L on 5/6/14.
//  Copyright (c) 2014 Shaver, Brandon L. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Deck.h"
#import "Hand.h"

@interface GameModel : NSObject{
    
    Hand *dealer;
    Hand *player;
    
    Deck *theDeck;
    
}

@property Hand *dealer;
@property Hand *player;
@property Deck *theDeck;


-(void) initializeRound;



@end
