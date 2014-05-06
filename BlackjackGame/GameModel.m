//
//  GameModel.m
//  BlackjackGame
//
//  Created by Shaver, Brandon L on 5/6/14.
//  Copyright (c) 2014 Shaver, Brandon L. All rights reserved.
//

#import "GameModel.h"

@implementation GameModel

@synthesize player;
@synthesize dealer;
@synthesize theDeck;
@synthesize totalPlays;

static GameModel* gameModel = nil;

/*
 
 ** Creates a deck and 2 hands, one for player and dealer
 **
 
 */
-(id)init{
    
    if ((self = [super init])){
        
        theDeck = [[Deck alloc] init];
        player = [[Hand alloc] init];
        dealer = [[Hand alloc] init];

    }
    return (self);
    
}

/*
 
 ** Deals cards to both the player and dealer
 **
 
 */
-(void) initializeRound{
    
    [player addCard:[theDeck draw]];
    [dealer addCard:[theDeck draw]];
    [player addCard:[theDeck draw]];
    [dealer addCard:[theDeck draw]];
    
}

-(void)playerHits
{
    [self willChangeValueForKey:@"player"];
    [player addCard:[theDeck draw]];
    [self didChangeValueForKey:@"player"];
    [self EndGameIfPlayerIsBust];
}

-(void)playerStands
{
    [self dealerStartsTurn];
    [self dealerPlays];
}

-(void)playerDoubles{
    
}

-(void)playerSplits{
 
}

-(void) dealNewHand{

}

-(void)dealerHandDraws{

}

-(void)dealerStartsTurn{
 
}

-(void) EndGameIfPlayerIsBust{

}

-(void) gameEnds:(Winner) winner{
  
}

-(void)dealerPlays{
    
}



@end
