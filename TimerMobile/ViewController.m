//
//  ViewController.m
//  TimerMobile
//
//  Created by Karol Jurczenia on 30.03.2017.
//  Copyright © 2017 Karol Jurczenia. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () {
    NSTimer *_timer;
    int seconds;
    BOOL timerIsInited;
    BOOL timerIsPaused;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.displayView.text = @"00:00:00";
    timerIsInited = false;
    timerIsPaused = false;
    
    seconds = 0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) UpdateDisplayView {
    ++seconds;
    int secondsToDisplay = seconds % 60;
    int minutesToDisplay = seconds / 60;
    int hoursToDisplay = minutesToDisplay / 60;
    minutesToDisplay %= 60;
    
    self.displayView.text = [NSString stringWithFormat:@"%d:%d:%d", hoursToDisplay, minutesToDisplay, secondsToDisplay];
}

- (IBAction)StartTimer:(id)sender {
    if (!timerIsInited) {
        _timer = [NSTimer scheduledTimerWithTimeInterval:1.0
                                                  target:self
                                                selector:@selector(UpdateDisplayView)
                                                userInfo:nil
                                                 repeats:YES];
        timerIsInited = true;
    }
}

- (IBAction)PauseTimer:(id)sender {
    [_timer invalidate];
    timerIsPaused = true;
}

- (IBAction)ResetTimer:(id)sender {
    if (timerIsPaused == false) {
        [_timer invalidate];
    } else {
        timerIsPaused = false;
    }
    
    seconds = 0;
    self.displayView.text = @"00:00:00";
    timerIsInited = false;
}


@end
