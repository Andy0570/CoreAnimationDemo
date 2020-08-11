//
//  PPDecayViewController.m
//  CoreAnimationDemo
//
//  Created by Qilin Hu on 2020/8/11.
//  Copyright © 2020 Tonintech. All rights reserved.
//

#import "PPDecayViewController.h"
#import <POP.h>

@interface PPDecayViewController ()

@property (weak, nonatomic) IBOutlet UISlider *decelSlider; // 衰减速度
@property (weak, nonatomic) IBOutlet UISlider *velocitySlider; // 速度

@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *tapGesture;

@end

@implementation PPDecayViewController

#pragma mark - View life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)tapGesturePerformed:(UITapGestureRecognizer *)sender
{
    NSLog(@"Sender: %@", sender);
    if (sender.state == UIGestureRecognizerStateEnded)
    {
        [self performAnimation];
    }
}

// !!!: 执行衰减动画
- (void)performAnimation {
    [self.tapGesture setEnabled:NO];
    [self.decelSlider setEnabled:NO];
    [self.velocitySlider setEnabled:NO];
    
    CALayer *layer = [(UILabel *)[self.view viewWithTag:10] layer];
    [layer pop_removeAllAnimations];
    
    POPDecayAnimation *animation = [POPDecayAnimation animationWithPropertyNamed:kPOPLayerPositionY];
        
    animation.fromValue = @(150);
    animation.velocity = @(self.velocitySlider.value);
    animation.deceleration = self.decelSlider.value;
    
    animation.completionBlock = ^(POPAnimation *anim, BOOL finished) {
        NSLog(@"Animation has completed.");
        [self.tapGesture setEnabled:YES];
        [self.decelSlider setEnabled:YES];
        [self.velocitySlider setEnabled:YES];
    };
    
    [layer pop_addAnimation:animation forKey:@"size"];
}

#pragma mark - Actions

- (IBAction)velocitySliderUpdated:(UISlider *)sender {
    NSLog(@"Velocity value changed. Value is now: %f", sender.value);
    UILabel *label = (UILabel *)[self.view viewWithTag:30];
    label.text = [NSString stringWithFormat:@"Velocity: %f", sender.value];
    [self resetLabel];
}

- (IBAction)decelSliderUpdated:(UISlider *)sender {
    NSLog(@"Deceleration value changed. Value is now: %f", sender.value);
    UILabel *label = (UILabel *)[self.view viewWithTag:20];
    label.text = [NSString stringWithFormat:@"Deceleration: %f", sender.value];
    [self resetLabel];
}

- (void)resetLabel {
    CALayer *layer = [(UILabel *)[self.view viewWithTag:10] layer];
    layer.frame = CGRectMake(20.0, 150.0, 280.0, 42.0);
}

@end
