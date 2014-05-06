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

static GameModel* game = nil;

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
    
    [self playerDraw];
    [self dealerDraw];
    
}

+(GameModel *)getGameModel{
    
    if (game == nil){
        
        game = [[GameModel alloc] init];
    }
    
    return game;
    
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

-(void)playerDraw{
    
    [self willChangeValueForKey:@"player"];
    [player addCard:[theDeck draw]];
    [self didChangeValueForKey:@"player"];
    
}

-(void)dealerDraw{
    
    [self willChangeValueForKey:@"dealer"];
    [dealer addCard:[theDeck draw]];
    [self didChangeValueForKey:@"dealer"];

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
