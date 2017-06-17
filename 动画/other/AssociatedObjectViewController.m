//
//  AssociatedObjectViewController.m
//  动画
//
//  Created by TianWan on 2017/4/13.
//  Copyright © 2017年 tianwan. All rights reserved.
//

#import "AssociatedObjectViewController.h"
#import <objc/runtime.h>

static char alertinfokey;

@interface AssociatedObjectViewController ()

@end

@implementation AssociatedObjectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"alert" style:UIBarButtonItemStylePlain target:self action:@selector(alert)];
}

- (void)alert
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"title" message:@"warn" delegate:self cancelButtonTitle:@"cancel" otherButtonTitles:@"ok", nil];
    objc_setAssociatedObject(alert, &alertinfokey, @"test value", OBJC_ASSOCIATION_RETAIN);
    [alert show];
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0) {
        NSLog(@"== : %@",objc_getAssociatedObject(alertView, &alertinfokey));
    }
}

@end
