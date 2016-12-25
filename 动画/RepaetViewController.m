//
//  RepaetViewController.m
//  动画
//
//  Created by gaobo on 2016/12/25.
//  Copyright © 2016年 tianwan. All rights reserved.
//

#import "RepaetViewController.h"

@interface RepaetViewController ()

@property (weak, nonatomic) IBOutlet UIView *orange;
@property (weak, nonatomic) IBOutlet UIView *pink;
@property (weak, nonatomic) IBOutlet UIView *green;


@end

@implementation RepaetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"repeat, ease  and autoreverse";
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    // 动画
//    [UIView animateWithDuration:1.0f animations:^{
//        CGPoint point = CGPointMake(self.view.bounds.size.width - self.orange.center.x, self.orange.center.y);
//
//       self.orange.center = point;
//    }];
    
    [UIView animateWithDuration:3.0f delay:0.0f options:UIViewAnimationOptionRepeat | UIViewAnimationOptionCurveLinear animations:^{
        CGPoint point = CGPointMake(self.view.bounds.size.width - self.orange.center.x, self.orange.center.y);
        
        self.orange.center = point;
    } completion:^(BOOL finished) {
        
    }];
    
    [UIView animateWithDuration:3.0f delay:0.0f options:UIViewAnimationOptionRepeat | UIViewAnimationOptionCurveEaseInOut animations:^{
        CGPoint point = CGPointMake(self.view.bounds.size.width - self.pink.center.x, self.pink.center.y);
        
        self.pink.center = point;
    } completion:^(BOOL finished) {
        
    }];
    
    [UIView animateWithDuration:3.0f delay:0.0f options:UIViewAnimationOptionRepeat | UIViewAnimationOptionAutoreverse animations:^{
        CGPoint point = CGPointMake(self.view.bounds.size.width - self.green.center.x, self.green.center.y);
        
        self.green.center = point;
    } completion:^(BOOL finished) {
        
    }];
}

@end
