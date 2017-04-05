//
//  ViewController.h
//  TimerMobile
//
//  Created by Karol Jurczenia on 30.03.2017.
//  Copyright © 2017 Karol Jurczenia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *displayView;

- (IBAction)StartTimer:(id)sender;
- (IBAction)PauseTimer:(id)sender;
- (IBAction)ResetTimer:(id)sender;

@end

