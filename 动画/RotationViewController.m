//
//  RotationViewController.m
//  动画
//
//  Created by gaobo on 2016/12/26.
//  Copyright © 2016年 tianwan. All rights reserved.
//

#import "RotationViewController.h"

@interface RotationViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *cat;
@property (weak, nonatomic) IBOutlet UIImageView *cat2;
@property (weak, nonatomic) IBOutlet UIImageView *cat3;

@end

@implementation RotationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"rotation" style:UIBarButtonItemStylePlain target:self action:@selector(change)];
    
//    self.cat.layer.transform = CATransform3DMakeRotation(10.5, 2.0, 9.0, 2.0);
//    self.cat.layer.transform = CATransform3DMakeScale(0.1, 0.1, 1.0);
    
//    self.cat.layer.affineTransform = CGAffineTransformMakeScale(0.2, 0.2);
}

- (void)change
{
    [UIView animateWithDuration:5 delay:0.0f options:UIViewAnimationOptionRepeat | UIViewAnimationOptionAutoreverse animations:^{
//        self.cat.layer.transform = CATransform3DMakeRotation(0, 0, 0, 0);
//        self.cat.layer.transform = CATransform3DMakeScale(1.0, 1.0, 1);
        
        self.cat.layer.transform = CATransform3DMakeRotation(10.5, 2.0, 9.0, 2.0);
//        self.cat.layer.affineTransform = CGAffineTransformMakeScale(1, 1);
    } completion:^(BOOL finished) {
        
    }];
    
    [UIView animateWithDuration:5 delay:0.0f options:UIViewAnimationOptionRepeat | UIViewAnimationOptionAutoreverse animations:^{
        self.cat2.layer.transform = CATransform3DMakeRotation(M_PI, 1, 1, 0);
    } completion:^(BOOL finished) {
        
    }];
    
    [UIView animateWithDuration:5 delay:0.0f options:UIViewAnimationOptionRepeat | UIViewAnimationOptionAutoreverse animations:^{
        self.cat3.layer.transform = CATransform3DMakeRotation(M_PI, -1, 1, 0);
    } completion:^(BOOL finished) {
        
    }];
}

@end
