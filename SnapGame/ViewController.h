//
//  ViewController.h
//  SnapGame
//
//  Created by Ash Ryan Arnwine on 1/23/16.
//  Copyright © 2016 Ash Ryan Beats. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {
    
    NSTimer *timer;
    NSTimer *imageUpdate;
    
    int timerInt;
    int scoreInt;
    int pairInt;
    
}

@property (weak, nonatomic) IBOutlet UIImageView *imageView1;
@property (weak, nonatomic) IBOutlet UIImageView *imageView2;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UIButton *startButtonOutlet;
@property (weak, nonatomic) IBOutlet UIButton *snapButtonOutlet;
@property (weak, nonatomic) IBOutlet UILabel *pairLabel;

- (IBAction)startGame:(id)sender;
- (IBAction)snapAction:(id)sender;


@end

