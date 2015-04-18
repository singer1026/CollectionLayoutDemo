//
//  ShopCell.m
//  瀑布流
//
//  Created by Singer on 15/4/12.
//  Copyright (c) 2015年 Singer. All rights reserved.
//

#import "ShopCell.h"

@interface ShopCell ()<UIGestureRecognizerDelegate>

@end

@implementation ShopCell


- (void)awakeFromNib {
    UILongPressGestureRecognizer *longPressGesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(onLongPress:)];
    longPressGesture.minimumPressDuration = 0.0;
    longPressGesture.delegate = self;
    longPressGesture.cancelsTouchesInView = NO;
    [self addGestureRecognizer:longPressGesture];
}

- (void)onLongPress:(UILongPressGestureRecognizer *)longPressGestureRecognizer {
    if (longPressGestureRecognizer.state == UIGestureRecognizerStateBegan) {
        [UIView animateWithDuration:0.2 delay:0.0 usingSpringWithDamping:0.6 initialSpringVelocity:0.8 options:UIViewAnimationOptionCurveEaseOut animations:^{
            self.transform = CGAffineTransformMakeScale(0.9, 0.9);
            
        } completion:nil];
        
    } else {
        [UIView animateWithDuration:0.2 delay:0.0 usingSpringWithDamping:0.6 initialSpringVelocity:0.8 options:UIViewAnimationOptionCurveEaseOut animations:^{
            self.transform = CGAffineTransformIdentity;
            
        } completion:nil];
    }
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return YES;
}
@end
