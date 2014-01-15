//
//  ViewController.m
//  UIViewTransformsCheckpoint
//
//  Created by Jarrod Glissmann on 12/10/13.
//  Copyright (c) 2013 Jarrod Glissmann. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.speed = 2.0;
    self.rotationAngle = 0.0;
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)rotateTheArrow{
    self.arrow.transform = CGAffineTransformMakeRotation(self.rotationAngle);
    
    self.rotationAngle +=self.speed;
    
    if (random() % 5 == 1) {
        self.speed -= .1;
    }
    
    if (self.speed <= 0) {
        [self.arrowSpin invalidate];
        self.arrowSpin = nil;
        self.speed = 2;
        CGFloat angle =[(NSNumber*)[self.arrow valueForKeyPath:@"layer.transform.rotation.z"] floatValue];
        NSLog(@"%f",angle);
        if (angle >= -1.4 && angle <= -0.5) {
            if (!mainSong) {
                NSURL * songLocation = [[NSBundle mainBundle] URLForResource:@"Quit wasting my time" withExtension:@"mp3"];
                mainSong = [[AVAudioPlayer alloc] initWithContentsOfURL:songLocation error:nil];
            }
            [mainSong play];
        } else if (angle >= -0.49 && angle <= 0.71){
            if (!mainSong2) {
                NSURL * songLocation = [[NSBundle mainBundle] URLForResource:@"Youre an inspiration for birth control" withExtension:@"mp3"];
                mainSong2 = [[AVAudioPlayer alloc] initWithContentsOfURL:songLocation error:nil];
            }
            [mainSong2 play];
        } else if (angle >= 0.7 && angle <= 1.5){
            if (!mainSong3) {
                NSURL * songLocation = [[NSBundle mainBundle] URLForResource:@"Dont get your panties all in a bunch" withExtension:@"mp3"];
                mainSong3 = [[AVAudioPlayer alloc] initWithContentsOfURL:songLocation error:nil];
            }
            [mainSong3 play];
        } else if (angle >= 1.51 && angle <= 2.6){
            if (!mainSong4) {
                NSURL * songLocation = [[NSBundle mainBundle] URLForResource:@"My names Duke Nukem" withExtension:@"mp3"];
                mainSong4 = [[AVAudioPlayer alloc] initWithContentsOfURL:songLocation error:nil];
            }
            [mainSong4 play];
        } else if (angle >= 2.61 || angle <= -2.64){
            if (!mainSong5) {
                NSURL * songLocation = [[NSBundle mainBundle] URLForResource:@"Ive got balls of steel" withExtension:@"mp3"];
                mainSong5 = [[AVAudioPlayer alloc] initWithContentsOfURL:songLocation error:nil];
            }
            [mainSong5 play];
        } else if (angle >= -2.63 && angle <= -1.41){
            if (!mainSong6) {
                NSURL * songLocation = [[NSBundle mainBundle] URLForResource:@"chewBubblegum" withExtension:@"mp3"];
                mainSong6 = [[AVAudioPlayer alloc] initWithContentsOfURL:songLocation error:nil];
            }
            [mainSong6 play];
        }
    }

}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch * touch = [touches anyObject];
    CGPoint location = [touch locationInView:nil];
    self.start = location;
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch * touch = [touches anyObject];
    CGPoint location = [touch locationInView:nil];
    
    float distance = sqrtf(powf((location.x - self.start.x), 2) +
                           powf((location.y - self.start.y), 2));
    self.speed = fabsf(distance)/ 95;
    
    [self SpinTheArrow:nil];
}

- (IBAction)SpinTheArrow:(UIButton *)sender {
    
    if (!self.arrowSpin) {
        self.arrowSpin = [NSTimer scheduledTimerWithTimeInterval:.05 target:self selector:@selector(rotateTheArrow) userInfo:nil repeats:YES];
    } else {
        [self.arrowSpin invalidate];
        self.arrowSpin = nil;

    }
}
@end
