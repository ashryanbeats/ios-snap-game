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
    
    timerInt = 20;
    scoreInt = 0;
    
    self.snapButtonOutlet.enabled = NO;
    
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
        timerInt = 20;
        scoreInt = 0;
        
        self.timeLabel.text = [NSString stringWithFormat:@"%i", timerInt];
        self.scoreLabel.text = [NSString stringWithFormat:@"%i", scoreInt];
        
        [self.startButtonOutlet setTitle:@"Start Game" forState:UIControlStateNormal];
    }
    
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
    
    [self transitionImage:newImageOne :newImageTwo];
    
    if (timerInt == 0) {
        [timer invalidate];
        
        self.snapButtonOutlet.enabled = NO;
        self.startButtonOutlet.enabled = YES;
        
        [self.startButtonOutlet setTitle:@"Restart Game" forState:UIControlStateNormal];
    }
    
}

- (void)transitionImage:(UIImage *)imageOne :(UIImage *)imageTwo {
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

- (IBAction)snapAction:(id)sender {
    
    if ([self.imageView1.image isEqual:self.imageView2.image]) {
        scoreInt += 1;
    }
    else {
        scoreInt -= 1;
    }
    
    self.scoreLabel.text = [NSString stringWithFormat:@"%i", scoreInt];
    
}
@end
