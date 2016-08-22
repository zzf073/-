//
//  ImageViewModel.m
//  CoreImage效果测试
//
//  Created by 王建 on 16/8/22.
//  Copyright © 2016年 zmit. All rights reserved.
//

#import "ImageViewModel.h"


@implementation ImageViewModel

#pragma mark 滤镜处理事件
- (void)fliterEvent:(NSString *)filterName originImage:(UIImage *)originImage imageBlock:(void(^)(UIImage *image))imageBlock
{
    if ([filterName isEqualToString:@"OriginImage"]) {
        imageBlock(originImage);
        
    }else{
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
           
                //将UIImage转换成CIImage
                CIImage *ciImage = [[CIImage alloc] initWithImage:originImage];
                
                //创建滤镜
                CIFilter *filter = [CIFilter filterWithName:filterName keysAndValues:kCIInputImageKey, ciImage, nil];
                
                //已有的值不改变，其他的设为默认值
                [filter setDefaults];
                
                //获取绘制上下文
                CIContext *context = [CIContext contextWithOptions:nil];
                
                //渲染并输出CIImage
                CIImage *outputImage = [filter outputImage];
                
                //创建CGImage句柄
                CGImageRef cgImage = [context createCGImage:outputImage fromRect:[outputImage extent]];
                
                //获取图片
                UIImage *image = [UIImage imageWithCGImage:cgImage];
                
                //释放CGImage句柄
                CGImageRelease(cgImage);
                 dispatch_async(dispatch_get_main_queue(), ^{
                imageBlock(image);
            });
        });
       
    }
    
}


@end
