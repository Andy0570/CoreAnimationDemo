//
//  PPPictureConstraintViewController.m
//  CoreAnimationDemo
//
//  Created by Qilin Hu on 2020/8/11.
//  Copyright © 2020 Tonintech. All rights reserved.
//

#import "PPPictureConstraintViewController.h"
#import <POP.h>

@interface PPPictureConstraintViewController ()

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *widthConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *heightConstraint;

@property (nonatomic, assign) BOOL isInFullscreen;

@end

@implementation PPPictureConstraintViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    _isInFullscreen = NO;
    
    // MARK: 导航栏右侧 -
    UIBarButtonItem *fullscreenButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"fullscreen"] style:UIBarButtonItemStylePlain target:self action:@selector(fullscreenButtonWasPressed:)];
    self.navigationItem.rightBarButtonItem = fullscreenButton;
}

#pragma mark - Actions

- (IBAction)fullscreenButtonWasPressed:(UIButton *)sender {
    [self performFullScreenAnimation];
    
    _isInFullscreen = !_isInFullscreen;
}

- (void)performFullScreenAnimation {
    
    [self.widthConstraint pop_removeAllAnimations];
    [self.heightConstraint pop_removeAllAnimations];
    
    POPSpringAnimation *widthAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayoutConstraintConstant];
    widthAnimation.springBounciness = 8;
    
    POPSpringAnimation *heightAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayoutConstraintConstant];
    heightAnimation.springBounciness = 8;
    
    if (_isInFullscreen) {
        widthAnimation.toValue = @(320);
        heightAnimation.toValue = @(208);
    } else {
        widthAnimation.toValue = @(182);
        heightAnimation.toValue = @(118);
    }
            
    [self.widthConstraint pop_addAnimation:widthAnimation forKey:@"widthConstraint"];
    [self.heightConstraint pop_addAnimation:heightAnimation forKey:@"heightConstraint"];
}

@end
