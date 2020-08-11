//
//  PPCustomSegue.m
//  CoreAnimationDemo
//
//  Created by Qilin Hu on 2020/8/11.
//  Copyright © 2020 Tonintech. All rights reserved.
//

#import "PPCustomSegue.h"
#import <POP.h>

@implementation PPCustomSegue

- (void)perform {
    UIViewController *sourceViewController = (UIViewController *)self.sourceViewController;
    UIViewController *destinationViewController = (UIViewController *)self.destinationViewController;
    
    CALayer *layer = destinationViewController.view.layer;
    [layer pop_removeAllAnimations];
    
    NSLog(@"Layer frame X: %f", layer.frame.origin.x);
    NSLog(@"Layer frame width: %f", layer.frame.size.width);
    
    POPSpringAnimation *xAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPositionX];
    POPSpringAnimation *sizeAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerSize];
    
    xAnimation.fromValue = @(320);
    xAnimation.springBounciness = 16;
    xAnimation.springSpeed = 10;
    
    // 大约是正常尺寸的 20%
    sizeAnimation.fromValue = [NSValue valueWithCGSize:CGSizeMake(64, 116)];
    
    xAnimation.completionBlock = ^(POPAnimation *anim, BOOL finished) {
        NSLog(@"Animation has completed.");
        NSLog(@"Layer frame X: %f", layer.frame.origin.x);
    };
    
    [layer pop_addAnimation:xAnimation forKey:@"position"];
    [layer pop_addAnimation:sizeAnimation forKey:@"size"];
    
    [sourceViewController.navigationController pushViewController:destinationViewController animated:YES];
}

@end
