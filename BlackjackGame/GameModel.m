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
        dealer.closedHand = YES;
        totalPlays = 0;

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
    [self didPlayerBust];
}

-(void)playerStands
{
    [self dealerStartsTurn];
    [self dealerPlays];
    
    
}

-(void)playerDoubles{
    
    //[self playerHits];
    //[self playerStands];
    
}

-(void)playerSplits{
 
}

-(void) dealNewHand{
    
    theDeck = nil;
    player = nil;
    dealer = nil;
    theDeck = [[Deck alloc] init];
    player = [[Hand alloc] init];
    dealer = [[Hand alloc] init];
    dealer.closedHand = YES;
    [self initializeRound];

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
   
    [self willChangeValueForKey:@"dealer"];
    [dealer setClosedHand:NO];
    [self didChangeValueForKey:@"dealer"];
 
}

-(void) didPlayerBust{
    
    if ([player getHandPoints] > 21){
        UIAlertView *bust = [[UIAlertView alloc] initWithTitle:@"Result" message:@"Too many! Player Bust." delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:nil];
        
        [bust show];
        
        [self gameOver:Dealer];
 
        
    }

}

-(void) gameOver:(Winner) winner{
    
    self.totalPlays = self.totalPlays + 1;
    
  
}

+(NSString*) getWinner: (Winner) winner {

    NSString *result = nil;
    
    switch(winner) {
        case Player:
            result = @"Player wins!";
            break;
        case Dealer:
            result = @"You lose. :(";
            break;
        case Push:
            result = @"Push";
            break;
            
    }
    return result;
}

-(void)dealerPlays{
    
    while (dealer.getHandPoints < 17){
        [self dealerDraw];
    }
    
    if (dealer.getHandPoints > 21){
        
        [self gameOver:Player];
        UIAlertView *pwin = [[UIAlertView alloc] initWithTitle:@"Result" message:@"Dealer bust! Player wins!" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:nil];
        
        [pwin show];
        
    }else if(dealer.getHandPoints > player.getHandPoints){
        
        [self gameOver:Dealer];
        UIAlertView *dwin = [[UIAlertView alloc] initWithTitle:@"Result" message:@"Dealer Wins." delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:nil];
        
        [dwin show];
        
    }else if (dealer.getHandPoints == player.getHandPoints){
        
        [self gameOver: Push];
        
        UIAlertView *push = [[UIAlertView alloc] initWithTitle:@"Result" message:@"Push." delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:nil];
        [push show];
        
    }else{
        
        [self gameOver:Player];
        UIAlertView *pwin = [[UIAlertView alloc] initWithTitle:@"Result" message:@"Player win!" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:nil];
        
        [pwin show];
        
    }
}



@end
