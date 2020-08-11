//
//  PPPictureViewController.m
//  CoreAnimationDemo
//
//  Created by Qilin Hu on 2020/8/11.
//  Copyright © 2020 Tonintech. All rights reserved.
//

#import "PPPictureViewController.h"
#import <POP.h>

@interface PPPictureViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (nonatomic, assign) BOOL isInFullscreen;

@end

@implementation PPPictureViewController

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
}

- (void)performFullScreenAnimation {
    CGRect baseRect = CGRectMake(69, self.view.center.y - 118 / 2, 182, 118);
    CGRect fullRect = CGRectMake(0, self.view.center.y - 208 / 2, [UIScreen mainScreen].bounds.size.width, 208);
    
    [self.imageView.layer pop_removeAllAnimations];
    
    POPSpringAnimation *animation = [POPSpringAnimation animationWithPropertyNamed:kPOPViewFrame];
    animation.springBounciness = 8;
    
    if (!_isInFullscreen) {
        animation.toValue = [NSValue valueWithCGRect:fullRect];
    } else {
        animation.toValue = [NSValue valueWithCGRect:baseRect];
    }
    
    __weak __typeof(self)weakSelf = self;
    animation.completionBlock = ^(POPAnimation *anim, BOOL finished) {
        __strong __typeof(weakSelf)strongSelf = weakSelf;
        strongSelf.isInFullscreen = !strongSelf.isInFullscreen;
    };
    
    [self.imageView.layer pop_addAnimation:animation forKey:@"fullscreen"];
}

@end
