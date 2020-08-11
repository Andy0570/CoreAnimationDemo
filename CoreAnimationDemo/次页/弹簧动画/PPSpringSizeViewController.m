//
//  PPSpringSizeViewController.m
//  CoreAnimationDemo
//
//  Created by Qilin Hu on 2020/8/11.
//  Copyright © 2020 Tonintech. All rights reserved.
//

#import "PPSpringSizeViewController.h"
#import <pop/POP.h>

@interface PPSpringSizeViewController ()

@property (weak, nonatomic) IBOutlet UILabel *label;
@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *tapGesture;
@property (weak, nonatomic) IBOutlet UISlider *springSpeedSlider;
@property (weak, nonatomic) IBOutlet UISlider *springBouncinessSlider;

@end

@implementation PPSpringSizeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

#pragma mark - UITapGestureRecognizer

- (IBAction)tapGesturePerformed:(UITapGestureRecognizer *)sender {
    if (sender.state == UIGestureRecognizerStateEnded) {
        [self performAnimation];
    }
}

// !!!: 执行弹簧动画
- (void)performAnimation {
    self.tapGesture.enabled = NO;
    
    // Step 1.首先，移除所有已存在的动画
    CALayer *layer = self.label.layer;
    [layer pop_removeAllAnimations];
    
    // Step 2.添加弹簧动画
    POPSpringAnimation *animation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPositionY];
    animation.fromValue = @(100);
    animation.toValue = @(300);
    
    /**
     弹簧的振荡系数，数值越大，弹簧的运动范围越大，从而产生更多的振荡和弹跳。
     定义为 [0,20] 范围内的数值。默认值为4。
     */
    animation.springBounciness = self.springBouncinessSlider.value;
    animation.springSpeed = self.springSpeedSlider.value;
    
    animation.completionBlock = ^(POPAnimation *anim, BOOL finished) {
        NSLog(@"动画完成后执行这里！");
        self.tapGesture.enabled = YES;
    };
    
    [layer pop_addAnimation:animation forKey:@"size"];
}

#pragma mark - Actions

- (IBAction)springSpeedSliderUpdated:(UISlider *)sender
{
    UILabel *label = (UILabel *)[self.view viewWithTag:20];
    label.text = [NSString stringWithFormat:@"Spring Speed: %f", sender.value];
}

- (IBAction)springBouncinessSliderUpdated:(UISlider *)sender
{
    UILabel *label = (UILabel *)[self.view viewWithTag:30];
    label.text = [NSString stringWithFormat:@"Spring Bounciness: %f", sender.value];
}

@end
