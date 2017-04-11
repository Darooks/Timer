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
    double _ticks;
    BOOL timerIsInited;
    BOOL timerIsPaused;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.displayView.text = @"00:00:00.0";
    timerIsInited = false;
    timerIsPaused = false;
    
    _ticks = 0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSString *) FormatTime: (NSString *) timeText {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"HH:mm:ss.SSS"];
    
    return nil;
}

- (void) UpdateDisplayView {
    _ticks += 0.1;
    double seconds = fmod(_ticks, 60.0);
    double minutes = fmod(trunc(_ticks / 60.0), 60.0);
    double hours = trunc(_ticks / 3600.0);
    
    
    self.displayView.text = [NSString stringWithFormat:@"%02.0f:%02.0f:%04.1f", hours, minutes, seconds];
}

- (IBAction)StartTimer:(id)sender {
    if (!timerIsInited) {
        _timer = [NSTimer scheduledTimerWithTimeInterval:0.1
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
    timerIsInited = false;
}

- (IBAction)ResetTimer:(id)sender {
    [_timer invalidate];
    
    _ticks = 0.0;
    self.displayView.text = @"00:00:0.0";
    timerIsInited = false;
}


@end
