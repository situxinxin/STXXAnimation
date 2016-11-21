//
//  MBProgressHUD+GifAnimation.h
//  STXXAnimation
//
//  Created by 新新 on 2016/11/21.
//  Copyright © 2016年 司徒新新. All rights reserved.
//

#import "MBProgressHUD.h"

@interface MBProgressHUD (GifAnimation)

/**
 *  HUD显示在指定view上
 *
 *  @param image   显示的图片
 *  @param title   显示的文字
 *  @param view   指定的view
 */
+ (void)showAnimationImages:(NSString *)image title:(NSString *)title toView:(UIView *)view;

/**将动画显示在指定view上*/
+ (void)showAnimotionToView:(UIView *)view image:(NSString *)image title:(NSString *)title;

/**HUD从指定的view上移除*/
+ (void)hideHUDForView:(UIView *)view;

/**将动画显示在窗口上*/
+ (void)showAnimotionToWidownImage:(NSString *)image title:(NSString *)title;

/**HUD从window上移除*/
+ (void)hideHUD;

@end
