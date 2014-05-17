//
//  ViewController.h
//  BlackjackGame
//
//  Created by Shaver, Brandon L on 5/5/14.
//  Copyright (c) 2014 Shaver, Brandon L. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController{
    NSMutableArray *EveryView;
}

@property (weak, nonatomic) IBOutlet UILabel *DealerLabel;
@property (weak, nonatomic) IBOutlet UILabel *PlayerLabel;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *HitButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *StandButton;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *DoubleButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *SplitButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *NewDealButton;

@property NSMutableArray *EveryView;


- (IBAction)HitCard:(id)sender;
- (IBAction)StandHand:(id)sender;
- (IBAction)DoubleHand:(id)sender;
- (IBAction)SplitHand:(id)sender;
- (IBAction)NewDeal:(id)sender;
 


@end
