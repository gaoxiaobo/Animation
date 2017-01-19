//
//  AttachmentViewController.m
//  动画
//
//  Created by TianWan on 2017/1/17.
//  Copyright © 2017年 tianwan. All rights reserved.
//

#import "AttachmentViewController.h"

@interface AttachmentViewController ()
{
    UIDynamicAnimator *_animator;
    UIAttachmentBehavior *_attachment;
}
@property (weak, nonatomic) IBOutlet UIView *orange;

@end

@implementation AttachmentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Attachment 刚性附加行为";
     _animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
}


- (IBAction)pan:(UIPanGestureRecognizer *)sender
{
    if (sender.state == UIGestureRecognizerStateBegan) {
        
        CGPoint anchor = CGPointMake(self.orange.center.x, self.orange.center.y - 100);
        UIOffset offset = UIOffsetMake(25, 25);
        _attachment = [[UIAttachmentBehavior alloc] initWithItem:self.orange offsetFromCenter:offset attachedToAnchor:anchor];
        
        [_animator addBehavior:_attachment];
        
    }else if (sender.state == UIGestureRecognizerStateChanged) {
        
        CGPoint point = [sender locationInView:sender.view];
        _attachment.anchorPoint = point;
        
    }else if (sender.state == UIGestureRecognizerStateEnded) {
        [_animator removeBehavior:_attachment];
    }
}

@end
