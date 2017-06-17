//
//  GoogleLoadingViewController.m
//  动画
//
//  Created by TianWan on 2017/4/13.
//  Copyright © 2017年 tianwan. All rights reserved.
//

#import "GoogleLoadingViewController.h"
#import "DaiInboxView.h"
#import "DaiInboxHUD.h"
#import "DaiInboxViewController.h"
@interface GoogleLoadingViewController ()
{
    DaiInboxViewController *_inboxViewController;
}

@end

@implementation GoogleLoadingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    //客製化想要的顏色
    [DaiInboxHUD shared].colors = @[[UIColor colorWithRed:244/255.0 green:180/255.0 blue:0/255.0 alpha:1],
                                    [UIColor colorWithRed:15/255.0 green:157/255.0 blue:88/255.0 alpha:1],
                                    [UIColor colorWithRed:66/255.0 green:134/255.0 blue:244/255.0 alpha:1],
                                    [UIColor colorWithRed:219/255.0 green:68/255.0 blue:55/255.0 alpha:1]
                                    ];
    
    //想要的背景色
    [DaiInboxHUD shared].backgroundColor = [UIColor clearColor];
    
    //想要的遮膜色
    [DaiInboxHUD shared].maskColor = [UIColor clearColor];
    
    //想要的線條粗度
    [DaiInboxHUD shared].lineWidth = 2.0f;
    
    //打勾要顯示的顏色
    [DaiInboxHUD shared].checkmarkColor = [UIColor greenColor];
    
    //叉叉要顯示的顏色
    [DaiInboxHUD shared].crossColor = [UIColor redColor];
    
    //當然也都可以不設, 使用預設帶的值
    
    
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"loading" style:UIBarButtonItemStylePlain target:self action:@selector(loading)];
}

- (void)loading
{
//    UIFont *font = [UIFont preferredFontForTextStyle:UIFontTextStyleHeadline];
//    UIColor *textColor = [UIColor blackColor];
//    NSDictionary *attributes = @{ NSForegroundColorAttributeName : textColor, NSFontAttributeName : font, NSTextEffectAttributeName : NSTextEffectLetterpressStyle };
//    NSAttributedString *attributedString = [[NSAttributedString alloc] initWithString:@"Loading" attributes:attributes];
//    [DaiInboxHUD showThenHideAfterDelay:5];
    
//    [DaiInboxHUD inboxViewControllerByCopieD]
    
    DaiInboxViewController *inboxViewController = [DaiInboxViewController new];
    _inboxViewController = inboxViewController;
    inboxViewController.colors = [DaiInboxHUD shared].colors;
    inboxViewController.backgroundColor = [DaiInboxHUD shared].backgroundColor;
    inboxViewController.maskColor = [DaiInboxHUD shared].maskColor;
    inboxViewController.lineWidth = [DaiInboxHUD shared].lineWidth;
    inboxViewController.checkmarkColor = [DaiInboxHUD shared].checkmarkColor;
    inboxViewController.crossColor = [DaiInboxHUD shared].crossColor;
    inboxViewController.allowUserInteraction = [DaiInboxHUD shared].allowUserInteraction;
//    inboxViewController.message = message;
//    inboxViewController.type = type;
    
    [self addChildViewController:inboxViewController];
    [self.view addSubview:inboxViewController.view];
    inboxViewController.view.backgroundColor = [UIColor clearColor];
    CGFloat W = [UIScreen mainScreen].bounds.size.width;
    CGFloat H = [UIScreen mainScreen].bounds.size.height;
    inboxViewController.view.frame = CGRectMake(0, 0, W, H);
    
    [self performSelector:@selector(hide) withObject:nil afterDelay:5.0f];
}


- (void)hide
{
    [_inboxViewController hide:^{
        NSLog(@"hide!!!!");
    }];
}

@end
