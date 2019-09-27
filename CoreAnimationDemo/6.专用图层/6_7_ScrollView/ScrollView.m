//
//  ScrollView.m
//
//  Created by Nick Lockwood on 09/03/2013.
//  Copyright (c) 2013 Charcoal Design. All rights reserved.
//

#import "ScrollView.h"
#import <QuartzCore/QuartzCore.h>

@implementation ScrollView

+ (Class)layerClass
{
    // 💡 把 CAScrollLayer 作为 UIView 的宿主图层
    return [CAScrollLayer class];
}

- (void)setUp
{
    //enable clipping
    self.layer.masksToBounds = YES;
    
    //attach pan gesture recognizer
    // 💡 再添加平移手势触摸事件
    UIPanGestureRecognizer *recognizer = nil;
    recognizer = [[UIPanGestureRecognizer alloc]
                  initWithTarget:self action:@selector(pan:)];
    [self addGestureRecognizer:recognizer];
}

- (id)initWithFrame:(CGRect)frame
{
    //this is called when view is created in code
    if ((self = [super initWithFrame:frame]))
    {
        [self setUp];
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    //this is called when view is created from a nib
    [self setUp];
}

- (void)pan:(UIPanGestureRecognizer *)recognizer
{
    //get the offset by subtracting the pan gesture
    //translation from the current bounds origin
    CGPoint offset = self.bounds.origin;
    offset.x -= [recognizer translationInView:self].x;
    offset.y -= [recognizer translationInView:self].y;
    
    //scroll the layer
    [(CAScrollLayer *)self.layer scrollToPoint:offset];

    //reset the pan gesture translation
    [recognizer setTranslation:CGPointZero inView:self];
}

@end
