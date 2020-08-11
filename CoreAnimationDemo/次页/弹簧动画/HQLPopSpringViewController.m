//
//  HQLPopSpringViewController.m
//  CoreAnimationDemo
//
//  Created by Qilin Hu on 2020/8/11.
//  Copyright © 2020 Tonintech. All rights reserved.
//

#import "HQLPopSpringViewController.h"

// Framework
#import <POP.h>

@interface HQLPopSpringViewController ()

@property (weak, nonatomic) IBOutlet UIView *layerView;

@end

@implementation HQLPopSpringViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    // 添加弹簧动画
    POPSpringAnimation *animation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerBounds];
    animation.toValue = [NSValue valueWithCGRect:CGRectMake(107, 348, 400, 400)];
    [self.layerView.layer pop_addAnimation:animation forKey:@"size"];
}



@end
