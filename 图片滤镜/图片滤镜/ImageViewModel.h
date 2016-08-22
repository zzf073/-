//
//  ImageViewModel.h
//  CoreImage效果测试
//
//  Created by 王建 on 16/8/22.
//  Copyright © 2016年 zmit. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "ImageModel.h"
@interface ImageViewModel : NSObject
#pragma mark 滤镜处理事件
- (void)fliterEvent:(NSString *)filterName originImage:(UIImage *)originImage imageBlock:(void(^)(UIImage *image))imageBlock;

@end
