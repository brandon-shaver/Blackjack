//
//  ViewController.m
//  BlackjackGame
//
//  Created by Shaver, Brandon L on 5/5/14.
//  Copyright (c) 2014 Shaver, Brandon L. All rights reserved.
//

#import "ViewController.h"
#import "Card.h"
#import "Hand.h"
#import "GameModel.h"


@interface ViewController ()

@end

@implementation ViewController

@synthesize DealerLabel = _DealerLabel;
@synthesize PlayerLabel = _PlayerLabel;
@synthesize HitButton = _HitButton;
@synthesize StandButton = _StandButton;
@synthesize DoubleButton = _DoubleButton;
@synthesize SplitButton = _SplitButton;
@synthesize NewDealButton = _NewDealButton;
@synthesize EveryView =_EveryView;

- (void)viewDidLoad{
    [super viewDidLoad];
    
    
    [[GameModel getGameModel] addObserver:self forKeyPath:@"dealer" options:NSKeyValueObservingOptionNew context:NULL];
    
    [[GameModel getGameModel] addObserver:self forKeyPath:@"player" options:NSKeyValueObservingOptionNew context:NULL];
    
    [[GameModel getGameModel] initializeRound];
     
    
   // [self showHand:game.player];
}

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*- (IBAction)HitCard:(id)sender{
    [_NewDealButton setEnabled:NO];
    
    [[GameModel getGameModel] playerHits];
}

- (IBAction)StandHand:(id)sender {
    [_HitButton setEnabled:NO];
    [_StandButton setEnabled:NO];
    [_DoubleButton setEnabled:NO];
    [_SplitButton setEnabled:NO];
    [_NewDealButton setEnabled:NO];
    
    [[GameModel getGameModel] playerStands];
}

- (IBAction)DoubleHand:(id)sender {
    [_HitButton setEnabled:NO];
    [_StandButton setEnabled:NO];
    [_DoubleButton setEnabled:NO];
    [_SplitButton setEnabled:NO];
    [_NewDealButton setEnabled:NO];
    
    [[GameModel getGameModel] playerDoubles];
}

- (IBAction)SplitHand:(id)sender {
    [_HitButton setEnabled:YES];
    [_StandButton setEnabled:YES];
    [_DoubleButton setEnabled:YES];
    [_SplitButton setEnabled:NO];
    [_NewDealButton setEnabled:NO];
    
    [[GameModel getGameModel] playerSplits];
}
 

- (IBAction)NewDeal:(id)sender {
    [_HitButton setEnabled:YES];
    [_StandButton setEnabled:YES];
    [_DoubleButton setEnabled:YES];
    [_SplitButton setEnabled:NO];
    [_NewDealButton setEnabled:NO];
    
    [[GameModel getGameModel] dealNewHand];
}

-(void) gameOver{
    [_HitButton setEnabled:NO];
    [_StandButton setEnabled:NO];
    [_DoubleButton setEnabled:NO];
    [_SplitButton setEnabled:NO];
    [_NewDealButton setEnabled:YES];
    
    [[GameModel getGameModel] playerSplits];
}
 */


-(void) showHand:(Hand *)hand atYPos:(int) yPos{
    
    
    int numOfCards = [hand numOfCards];
    
    for (int i=0; i< numOfCards ; i++) {
        
        Card *card = [hand getCard:i];
        
        // UIImage  *cardImage = [ UIImage imageNamed:@"heart08.gif"];
        UIImage  *cardImage = [ UIImage imageNamed:[card filename]];
        
        NSLog(@"Reading card file: %@", [card filename]);
        
        UIImageView *imageView=[[UIImageView alloc] initWithImage:cardImage];
        CGRect arect = CGRectMake( (i*40)+20, yPos, 71, 96);
        imageView.frame = arect;
        
        [self.view addSubview:imageView];
    }
    
}


-(void) placeDealerHand:(Hand *)hand;
{
    [self showHand:hand atYPos:180];
    _DealerLabel.text = [NSString stringWithFormat:@"Dealer (%ld)",(long)[hand getHandPoints]];
}

-(void) placePlayerHand:(Hand *)hand;
{
    [self showHand:hand atYPos:350];
    _PlayerLabel.text = [NSString stringWithFormat:@"Player (%ld)",(long)[hand getHandPoints]];
    
}


- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context
{
    
    if ([keyPath isEqualToString:@"dealer"]){
        
        [self placeDealerHand: (Hand *)[object dealer]];
        
    }else if ([keyPath isEqualToString:@"player"]){
        
        [self placePlayerHand: (Hand *)[object player]];
        
    }
    
}


@end
