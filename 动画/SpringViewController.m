//
//  SpringViewController.m
//  动画
//
//  Created by gaobo on 2016/12/25.
//  Copyright © 2016年 tianwan. All rights reserved.
//

#import "SpringViewController.h"

@interface SpringViewController ()

@property (weak, nonatomic) IBOutlet UILabel *view1;
@property (weak, nonatomic) IBOutlet UILabel *view2;


@end

@implementation SpringViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Spring";
}


- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [UIView animateWithDuration:2.0f delay:0.0f usingSpringWithDamping:0.2f initialSpringVelocity:20.0f options:UIViewAnimationOptionAllowUserInteraction animations:^{
        CGPoint point = CGPointMake(self.view1.center.x, self.view.bounds.size.height - self.view1.center.y);
        
        self.view1.center = point;
    } completion:^(BOOL finished) {
        
    }];
    
    [UIView animateWithDuration:2.0f delay:0.0f usingSpringWithDamping:0.8f initialSpringVelocity:100.0f options:UIViewAnimationOptionAllowUserInteraction animations:^{
        CGPoint point = CGPointMake(self.view2.center.x, self.view.bounds.size.height - self.view2.center.y);
        
        self.view2.center = point;
    } completion:^(BOOL finished) {
        
    }];
}

@end
