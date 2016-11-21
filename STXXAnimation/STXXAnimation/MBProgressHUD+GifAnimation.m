//
//  MBProgressHUD+GifAnimation.m
//  STXXAnimation
//
//  Created by 新新 on 2016/11/21.
//  Copyright © 2016年 司徒新新. All rights reserved.
//

#import "MBProgressHUD+GifAnimation.h"
#import <ImageIO/ImageIO.h>
@implementation MBProgressHUD (GifAnimation)

+ (void)showAnimationImages:(NSString *)image title:(NSString *)title toView:(UIView *)view
{
    if (view == nil){
        view = [[UIApplication sharedApplication].windows lastObject];
    }
    NSURL *fileUrl = [[NSBundle mainBundle] URLForResource:image withExtension:@"gif"];//加载GIF图片
    CGImageSourceRef gifSource = CGImageSourceCreateWithURL((CFURLRef)fileUrl, NULL);//将GIF图片转换成对应的图片源
    size_t frameCout=CGImageSourceGetCount(gifSource);//获取其中图片源个数，即由多少帧图片组成
    NSMutableArray* frames=[[NSMutableArray alloc] init];//定义数组存储拆分出来的图片
    for (size_t i=0; i < frameCout; i++){
         CGImageRef imageRef=CGImageSourceCreateImageAtIndex(gifSource, i, NULL);//从GIF图片中取出源图片
         UIImage* imageName=[UIImage imageWithCGImage:imageRef];//将图片源转换成UIimageView能使用的图片源
         [frames addObject:imageName];//将图片加入数组中
         CGImageRelease(imageRef);
    }
         
     UIImageView* imageview=[[UIImageView alloc] initWithFrame:CGRectMake(20, 64, 400, 380)];
     imageview.animationImages=frames;//将图片数组加入UIImageView动画数组中
     imageview.animationDuration=3;//每次动画时长
     [imageview startAnimating];//开启动画，此处没有调用播放次数接口，UIImageView默认播放次数为无限次，故这里不做处理
         
    //创建HUD
    MBProgressHUD *HUD = [MBProgressHUD showHUDAddedTo:view animated:YES];
    //设置蒙版
    HUD.dimBackground = YES;
    //自定view
    HUD.customView = imageview;
    //设置显示的文字
    HUD.labelText = title;
    //设置显示文字的颜色
    HUD.labelColor = [UIColor blackColor];
    //设置中间显示区域的透明度为完全透明
    HUD.opacity = 0.0;
    //设置显示的模式
    HUD.mode = MBProgressHUDModeCustomView;
    //设置显示的动画
    HUD.animationType = MBProgressHUDAnimationZoomIn;
    //显示
    [HUD show:YES];
    
    
}

+ (void)hideHUDForView:(UIView *)view
{
    if (view == nil){
        view = [[UIApplication sharedApplication].windows lastObject];
    }
    [self hideHUDForView:view animated:YES];
}

+ (void)hideHUD
{
    [self hideHUDForView:nil];
}

+ (void)showAnimotionToView:(UIView *)view image:(NSString *)image title:(NSString *)title
{
    //    AnimationImgsArr
    [self showAnimationImages:image title:title toView:view];
}

+ (void)showAnimotionToWidownImage:(NSString *)image title:(NSString *)title
{
    [self showAnimotionToView:nil image:image title:title];
}

@end
