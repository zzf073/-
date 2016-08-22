//
//  ViewController.m
//  图片滤镜
//
//  Created by 王建 on 16/8/15.
//  Copyright © 2016年 千牛众泰. All rights reserved.
//


#import "ViewController.h"
#import "ImageViewModel.h"


#define ScreenWidth [self.view bounds].size.width
#define ScreenHeight [self.view bounds].size.height

@interface ViewController () <UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)ImageModel *imageModel;
@property (nonatomic,strong)ImageViewModel *imageViewModel;
@property (nonatomic,strong)UIImageView *imageView;
@property (nonatomic,strong)UIImage *originImage;
@property (nonatomic,strong)UITableView *tableView;



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.originImage = [[UIImage alloc] init];
    self.originImage = [UIImage imageNamed:@"111.jpg"];
    
    //imageView
    self.imageView = [[UIImageView alloc] initWithImage:self.originImage];
    self.imageView.frame = self.view.frame;
    self.imageView.center = self.view.center;
    [self.view addSubview:self.imageView];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    static int i = 0;
    i++;
    
    if (i % 2 == 1) {
        [self.view addSubview:self.tableView];
    }else{
        [self.tableView removeFromSuperview];
    }
    
}
- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, ScreenHeight/2, ScreenWidth, ScreenHeight/2) style:UITableViewStyleGrouped];
        _tableView.dataSource = self;
        _tableView.delegate = self;
    }
    return _tableView;
}
- (ImageModel *)imageModel
{
    if (!_imageModel) {
        _imageModel = [[ImageModel alloc]init];
    }
    return _imageModel;
}
- (ImageViewModel *)imageViewModel
{
    if (!_imageViewModel) {
        _imageViewModel = [[ImageViewModel alloc]init];
    }
    return _imageViewModel;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCll"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCll"];
        
        [self.imageViewModel fliterEvent:self.imageModel.dataSource[indexPath.row] originImage:_originImage imageBlock:^(UIImage *image) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [cell.imageView setImage:image];
                [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
            });
        }];
        cell.textLabel.text = self.imageModel.dataSource[indexPath.row];
    }
    return cell;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.imageModel dataSource].count;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([tableView cellForRowAtIndexPath:indexPath].imageView.image) {
        _imageView.image = [tableView cellForRowAtIndexPath:indexPath].imageView.image;
    }
    
}@end
