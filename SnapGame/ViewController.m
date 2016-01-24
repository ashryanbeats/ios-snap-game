//
//  ViewController.m
//  SnapGame
//
//  Created by Ash Ryan Arnwine on 1/23/16.
//  Copyright © 2016 Ash Ryan Beats. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self initializeGameVariables];
    
    self.snapButtonOutlet.enabled = NO;
    
    [self hideResults];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)startGame:(id)sender {
    
    if (scoreInt == 0) {
        timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(updateTimer) userInfo:nil repeats:YES];
        
        self.snapButtonOutlet.enabled = YES;
        self.startButtonOutlet.enabled = NO;
    }
    
    if (timerInt == 0) {
        
        [self initializeGameVariables];
        [self resetGameplayLabels];
        [self hideResults];
        
    }
    
}

- (void)initializeGameVariables {
    startTimerInt = 20;
    timerInt = startTimerInt;
    scoreInt = 0;
    pairInt = 0;
    missInt = 0;
    correctOutcomeInt = 0;
}

- (void)resetGameplayLabels {
    self.timeLabel.text = [NSString stringWithFormat:@"%i", timerInt];
    self.scoreLabel.text = [NSString stringWithFormat:@"%i", scoreInt];
    [self.startButtonOutlet setTitle:@"Start Game" forState:UIControlStateNormal];
}

- (void)hideResults {
    self.pairLabel.hidden = YES;
    self.missLabel.hidden = YES;
    self.correctOutcomeLabel.hidden = YES;
}


- (void)updateTimer {
    
    timerInt -= 1;
    
    self.timeLabel.text = [NSString stringWithFormat:@"%i", timerInt];
    
    int RandomOne = arc4random() % 6;
    UIImage *newImageOne;
    switch (RandomOne) {
        case 0:
            newImageOne = [UIImage imageNamed:@"Car1.jpg"];
            break;
        case 1:
            newImageOne = [UIImage imageNamed:@"Car2.jpg"];
            break;
        case 2:
            newImageOne = [UIImage imageNamed:@"Car3.jpg"];
            break;
        case 3:
            newImageOne = [UIImage imageNamed:@"Car4.jpg"];
            break;
        case 4:
            newImageOne = [UIImage imageNamed:@"Car5.jpg"];
            break;
        case 5:
            newImageOne = [UIImage imageNamed:@"Car6.jpg"];
            break;
            
        default:
            break;
    }
    
    int RandomTwo = arc4random() % 6;
    UIImage *newImageTwo;
    switch (RandomTwo) {
        case 0:
            newImageTwo = [UIImage imageNamed:@"Car1.jpg"];
            break;
        
        case 1:
            newImageTwo = [UIImage imageNamed:@"Car2.jpg"];
            break;
            
        case 2:
            newImageTwo = [UIImage imageNamed:@"Car3.jpg"];
            break;
            
        case 3:
            newImageTwo = [UIImage imageNamed:@"Car4.jpg"];
            break;
            
        case 4:
            newImageTwo = [UIImage imageNamed:@"Car5.jpg"];
            break;
            
        case 5:
            newImageTwo = [UIImage imageNamed:@"Car6.jpg"];
            break;
            
        default:
            break;
    }
    
    if ([newImageOne isEqual:newImageTwo]) {
        pairInt++;
    }
    
    [self transitionImages:newImageOne :newImageTwo];
    
    if (timerInt == 0) {
        
        [self endGame];
    }
    
}

- (void)transitionImages:(UIImage *)imageOne :(UIImage *)imageTwo {
    [UIView transitionWithView:self.imageView1
                      duration:0.1f
                       options:UIViewAnimationOptionTransitionFlipFromLeft
                    animations:^{
                        self.imageView1.image = imageOne;
                    }
                    completion:nil];
    
    [UIView transitionWithView:self.imageView2
                      duration:0.1f
                       options:UIViewAnimationOptionTransitionFlipFromLeft
                    animations:^{
                        self.imageView2.image = imageTwo;
                    }
                    completion:nil];
}

- (void)endGame {
    
    // Stop timer
    [timer invalidate];
    
    // Toggle buttons
    self.snapButtonOutlet.enabled = NO;
    self.startButtonOutlet.enabled = YES;
    
    // Calculate number of correct outcomes
    correctOutcomeInt = startTimerInt - missInt;
    
    // Set results strings
    self.pairLabel.text = [NSString stringWithFormat:@"There were %i pairs", pairInt];
    self.missLabel.text = [NSString stringWithFormat:@"You guessed incorrectly %i times", missInt];
    self.correctOutcomeLabel.text = [NSString stringWithFormat:@"Score: %i", correctOutcomeInt];
    
    // Toggle results labels visibility
    self.pairLabel.hidden = NO;
    self.missLabel.hidden = NO;
    self.correctOutcomeLabel.hidden = NO;
    
    // Set start button string
    [self.startButtonOutlet setTitle:@"Restart Game" forState:UIControlStateNormal];

}

- (IBAction)snapAction:(id)sender {
    
    if ([self.imageView1.image isEqual:self.imageView2.image]) {
        scoreInt++;
    }
    else {
        scoreInt--;
        missInt++;
    }
    
    self.scoreLabel.text = [NSString stringWithFormat:@"%i", scoreInt];
    
}
@end
