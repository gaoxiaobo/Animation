//
//  SpringAttachmentViewController.m
//  动画
//
//  Created by TianWan on 2017/1/17.
//  Copyright © 2017年 tianwan. All rights reserved.
//

#import "SpringAttachmentViewController.h"

@interface SpringAttachmentViewController ()
{
    UIDynamicAnimator *_animator;
    UIAttachmentBehavior *_attachment;
}
@property (weak, nonatomic) IBOutlet UIView *orange;

@end

@implementation SpringAttachmentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"弹性附加行为";
    _animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    
    UIGravityBehavior *gravity = [[UIGravityBehavior alloc] initWithItems:@[self.orange]];
    gravity.magnitude = 0.5;
    // 将重力感应添加到animator
    [_animator addBehavior:gravity];
    
    // 碰撞检测行为
    UICollisionBehavior *collision = [[UICollisionBehavior alloc] initWithItems:@[self.orange]];
    collision.translatesReferenceBoundsIntoBoundary = YES;
    [_animator addBehavior:collision];
    
    CGPoint anchor = CGPointMake(self.orange.center.x, self.orange.center.y - 145);
    UIOffset offset = UIOffsetMake(25, 25);
    _attachment = [[UIAttachmentBehavior alloc] initWithItem:self.orange offsetFromCenter:offset attachedToAnchor:anchor];
    _attachment.damping = 0.1;
    _attachment.frequency = 1.0;
    [_animator addBehavior:_attachment];
}


- (IBAction)pan:(UIPanGestureRecognizer *)sender
{
    if (sender.state == UIGestureRecognizerStateBegan) {
//        
//        [_animator removeBehavior:_attachment];
//        
//        CGPoint anchor = [sender locationInView:self.view];
//        UIOffset offset = UIOffsetMake(0, 0);
//        _attachment = [[UIAttachmentBehavior alloc] initWithItem:self.orange offsetFromCenter:offset attachedToAnchor:anchor];
//        _attachment.damping = 0.1;
//        _attachment.frequency = 2.0;
//        [_animator addBehavior:_attachment];
        
    }else if (sender.state == UIGestureRecognizerStateChanged) {
        
        CGPoint point = [sender locationInView:sender.view];
        _attachment.anchorPoint = point;
        
    }else if (sender.state == UIGestureRecognizerStateEnded) {
//        [_animator removeBehavior:_attachment];
    }

}


@end
