//
//  ViewController.h
//  UIViewTransformsCheckpoint
//
//  Created by Jarrod Glissmann on 12/10/13.
//  Copyright (c) 2013 Jarrod Glissmann. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface ViewController : UIViewController
{
    AVAudioPlayer * mainSong;
    AVAudioPlayer * mainSong2;
    AVAudioPlayer * mainSong3;
    AVAudioPlayer * mainSong4;
    AVAudioPlayer * mainSong5;
    AVAudioPlayer * mainSong6;
}


@property (weak, nonatomic) IBOutlet UIImageView *arrow;
- (IBAction)SpinTheArrow:(UIButton *)sender;
@property CGPoint start;
@property float rotationAngle;
@property float speed;
@property (strong, nonatomic) NSTimer * arrowSpin;


@end
