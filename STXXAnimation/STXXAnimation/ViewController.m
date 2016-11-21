//
//  ViewController.m
//  STXXAnimation
//
//  Created by 新新 on 2016/11/21.
//  Copyright © 2016年 司徒新新. All rights reserved.
//

#import "ViewController.h"
#import "MBProgressHUD+GifAnimation.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [MBProgressHUD showAnimotionToView:self.view image:@"dongtaitu" title:nil];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [MBProgressHUD hideHUDForView:self.view];
    });
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
