//
//  CATransitionViewController.m
//  动画
//
//  Created by TianWan on 2017/1/12.
//  Copyright © 2017年 tianwan. All rights reserved.
//

#import "CATransitionViewController.h"

@interface CATransitionViewController ()
{
    NSTimer *_timer;
}
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic)NSMutableArray *imageList;
@property (strong, nonatomic)NSMutableArray *titleList;
@property (weak, nonatomic) IBOutlet UILabel *imageName;

@end

@implementation CATransitionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"CATransition & 转场动画";
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.view.backgroundColor = [UIColor blackColor];
    self.imageView.tag = 0;
    [self animation];
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(changeImage) userInfo:nil repeats:YES];
    
}

- (void)changeImage
{
    CATransition *tran = [[CATransition alloc] init];
    tran.duration = 0.5;
    tran.type = kCATransitionMoveIn;
    tran.subtype = kCATransitionFromRight;
    self.imageView.tag = (self.imageView.tag + 1) % self.imageList.count;
    self.imageView.image = self.imageList[self.imageView.tag];
    [self.imageView.layer addAnimation:tran forKey:nil];
    self.imageName.text = self.titleList[self.imageView.tag];
}

- (void)animation
{
    self.imageView.userInteractionEnabled = YES;
    UISwipeGestureRecognizer *left = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipe:)];
    [left setDirection:UISwipeGestureRecognizerDirectionLeft];
    [self.imageView addGestureRecognizer:left];
    
    UISwipeGestureRecognizer *right = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipe:)];
    [right setDirection:UISwipeGestureRecognizerDirectionRight];
    [self.imageView addGestureRecognizer:right];
    
    
    self.imageList = [NSMutableArray array];
    self.titleList = [NSMutableArray array];
    for (NSInteger i = 1; i < 10; i ++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"%ld.jpg",(long)i]];
        [self.imageList addObject:image];
        [self.titleList addObject:[NSString stringWithFormat:@"%ld.jpg",(long)i]];
    }
}

- (void)swipe:(UISwipeGestureRecognizer *)gesture
{
    CATransition *tran = [[CATransition alloc] init];
    tran.duration = 0.5;
    tran.type = kCATransitionFade;
    
    UIImageView *imageView = (UIImageView *)gesture.view;
    
    if (gesture.direction == UISwipeGestureRecognizerDirectionLeft) {
        tran.subtype = kCATransitionFromRight;
        imageView.tag = (imageView.tag + 1) % self.imageList.count;
    }else if (gesture.direction == UISwipeGestureRecognizerDirectionRight) {
        imageView.tag = (imageView.tag - 1 + self.imageList.count) % self.imageList.count;
        
        tran.subtype = kCATransitionFromLeft;
    }
    
    self.imageView.image = self.imageList[imageView.tag];
    [self.imageView.layer addAnimation:tran forKey:nil];
}

@end
