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

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _EveryView = [[NSMutableArray alloc] initWithCapacity:5];
    
    // Do any additional setup after loading the view, typically from a nib.
    [[GameModel getGameModel]  addObserver:self forKeyPath:@"dealer"
                                             options:NSKeyValueObservingOptionNew context:NULL];
    [[GameModel getGameModel]  addObserver:self forKeyPath:@"player"
                                             options:NSKeyValueObservingOptionNew context:NULL];
    [[GameModel getGameModel]  addObserver:self forKeyPath:@"totalPlays"
                                             options:NSKeyValueObservingOptionNew context:NULL];
    
    [[GameModel getGameModel] initializeRound];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)HitCard:(id)sender {
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

-(void) placeHand:(Hand *)hand atYPos:(NSInteger) yPos;
{
    for (int i=0; i< [hand numOfCards] ; i++) {
        Card *card = [hand getCard:i];
        
        UIImage  *cardImage = [ UIImage imageNamed:[card filename]];
        
        UIImageView *imageView=[[UIImageView alloc] initWithImage:cardImage];
        CGRect arect = CGRectMake( (i*40)+20, yPos, 71, 96);
        imageView.frame = arect;
        
        [_EveryView addObject:imageView];
        
        [self.view addSubview:imageView];
    }
    
}

-(void) placeDealerHand:(Hand *)hand;
{
    [self placeHand:hand atYPos:80];
    _DealerLabel.text = [NSString stringWithFormat:@"Dealer (%ld)",(long)[hand getHandPoints]];
}

-(void) placePlayerHand:(Hand *)hand;
{
    [self placeHand:hand atYPos:290];
    _PlayerLabel.text = [NSString stringWithFormat:@"Player (%ld)",(long)[hand getHandPoints]];
    
}

- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context
{
    
    if ([keyPath isEqualToString:@"dealer"])
    {
        [self placeDealerHand: (Hand *)[object dealer]];
    } else
        if ([keyPath isEqualToString:@"player"])
        {
            [self placePlayerHand: (Hand *)[object player]];
        }
        else if ([keyPath isEqualToString:@"totalPlays"])
        {
            [self gameOver];
        }
    
}


@end
