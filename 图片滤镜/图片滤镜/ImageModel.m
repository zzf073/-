//
//  ImageModel.m
//  CoreImage效果测试
//
//  Created by 王建 on 16/8/22.
//  Copyright © 2016年 zmit. All rights reserved.
//

#import "ImageModel.h"

@interface ImageModel ()
@property (nonatomic,strong)NSArray *dataArr;


@end
@implementation ImageModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

//
- (NSArray *)dataSource
{
    return self.dataArr;
}
- (NSArray *)dataArr
{
    if (!_dataArr) {
        _dataArr = [[NSMutableArray alloc] initWithObjects:
                    @"OriginImage",
                    @"CIPhotoEffectMono",
                    @"CIPhotoEffectChrome",
                    @"CIPhotoEffectFade",
                    @"CIPhotoEffectInstant",
                    @"CIPhotoEffectNoir",
                    @"CIPhotoEffectProcess",
                    @"CIPhotoEffectTonal",
                    @"CIPhotoEffectTransfer",
                    @"CISRGBToneCurveToLinear",
                    @"CIVignetteEffect",
                    nil];
    }
    return _dataArr;
}


@end
