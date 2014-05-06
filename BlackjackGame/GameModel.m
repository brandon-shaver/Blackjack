//
//  GameModel.m
//  BlackjackGame
//
//  Created by Shaver, Brandon L on 5/6/14.
//  Copyright (c) 2014 Shaver, Brandon L. All rights reserved.
//

#import "GameModel.h"

@implementation GameModel

@synthesize player = _player;
@synthesize dealer = _dealer;
@synthesize theDeck = _theDeck;
@synthesize totalPlays = _totalPlays;

static GameModel* gameModel = nil;

/*
 
 ** Creates a deck and 2 hands, one for player and dealer
 **
 
 */
-(id)init{
    
    if ((self = [super init])){
        _theDeck = [[Deck alloc] init];
        _player = [[Hand alloc] init];
        _dealer = [[Hand alloc] init];
        _dealer.handClosed = YES;
        _totalPlays = 0;
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
    [_player addCard:[theDeck draw]];
    [self didChangeValueForKey:@"player"];
    [self EndGameIfPlayerIsBust];
}

-(void)playerStands
{
    [self dealerStartsTurn];
    [self dealerPlays];
}

-(void)playerDoubles
{
    
}

-(void)playerSplits
{
 
}

-(void) dealNewHand;
{
    _theDeck = nil;
    _player = nil;
    _dealer = nil;
    _theDeck = [[Deck alloc] init];
    _player = [[Hand alloc] init];
    _dealer = [[Hand alloc] init];
    _dealer.handClosed = YES;
    [self initializeRound];
}

-(void)dealerHandDraws
{
    [self willChangeValueForKey:@"dealer"];
    [_dealer addCard:[_theDeck draw]];
    [self didChangeValueForKey:@"dealer"];
}

-(void)dealerStartsTurn{
    [self willChangeValueForKey:@"dealer"];
    [_dealer setHandClosed:NO];
    [self didChangeValueForKey:@"dealer"];
}

-(void) EndGameIfPlayerIsBust
{
    if (_player.getHandPoints > 21)
        [self gameEnds:Dealer];
}

-(void) gameEnds:(Winner) winner;
{
    self.totalPlays = self.totalPlays+1;
}

-(void)dealerPlays
{
    while (_dealer.getHandPoints < 17)
    {
        [self dealerHandDraws];
        
    }
    
    if (_dealer.getHandPoints > 21)
        [self gameEnds:Player ];
    else if (_dealer.getHandPoints > _player.getHandPoints)
        [self gameEnds:Dealer];
    else
        [self gameEnds:Draw ];
}

+(GameModel *) getGameModel{
    if (gameModel == nil){
        gameModel = [[GameModel alloc] init];
    }
    return gameModel;
}


@end
