//
//  PPSpringButtonViewController.m
//  CoreAnimationDemo
//
//  Created by Qilin Hu on 2020/8/11.
//  Copyright © 2020 Tonintech. All rights reserved.
//

#import "PPSpringButtonViewController.h"

// Framework
#import <POP.h>

@interface PPSpringButtonViewController ()

@property (nonatomic, assign, getter=isBottonToggle) BOOL bottonToggle;

@end

@implementation PPSpringButtonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)bigBounceButtonWasPressed:(UIButton *)sender {
    _bottonToggle = !_bottonToggle;
    
    CALayer *layer = sender.layer;
    
    // 首先，移除所有已经存在的动画
    [layer pop_removeAllAnimations];
    
    POPSpringAnimation *animation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerSize];
    POPSpringAnimation *rotation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerRotation];
    
    if (_bottonToggle) {
        animation.toValue = [NSValue valueWithCGSize:CGSizeMake(44, 44)];
        rotation.toValue = @(M_PI_4);
        sender.tintColor = [UIColor colorWithRed:0.0 green:122.0/255.0 blue:1.0 alpha:1.0];
    } else {
        animation.toValue = [NSValue valueWithCGSize:CGSizeMake(34, 34)];
        rotation.toValue = @(0);
        sender.tintColor = [UIColor redColor];
    }
    
    animation.springBounciness = 20;
    animation.springSpeed = 16;
    
    animation.completionBlock = ^(POPAnimation *anim, BOOL finished) {
        NSLog(@"动画完成后执行这里！");
    };
    
    [layer pop_addAnimation:animation forKey:@"size"];
    [layer pop_addAnimation:rotation forKey:@"rotation"];
}

@end
