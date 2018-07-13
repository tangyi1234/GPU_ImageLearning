//
//  TYGPUImageViewViewController.m
//  GPU_ImageLearning_Engineering
//
//  Created by 汤义 on 2018/7/11.
//  Copyright © 2018年 汤义. All rights reserved.
//

#import "TYGPUImageViewViewController.h"

@interface TYGPUImageViewViewController ()<UIWebViewDelegate>
@property (nonatomic, strong) UIWebView *webView;
@end

@implementation TYGPUImageViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor redColor];
    [self initButView];
}

- (void)initButView{
    UIButton *but = [UIButton buttonWithType:UIButtonTypeCustom];
    but.frame = CGRectMake(10, 64, 100, 30);
    but.backgroundColor = [UIColor redColor];
    [but setTitle:@"查看图片" forState:UIControlStateNormal];
    [but addTarget:self action:@selector(selectorBut) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:but];
}

- (void)selectorBut{
    UIImage *inputImage = [UIImage imageNamed:@"11"];
    //这一块就开始将图片进行装换和放到缓存当中去了
    GPUImagePicture *stillImageSource = [[GPUImagePicture alloc] initWithImage:inputImage];
    GPUImageSepiaFilter *stillImageFilter = [[GPUImageSepiaFilter alloc] init];
    //将滤镜渲染添加到可变数组中去了。
    [stillImageSource addTarget:stillImageFilter];
    [stillImageFilter useNextFrameForImageCapture];//告诉滤镜以后用它，节省内存
    [stillImageSource processImage];//滤镜渲染
    
    UIImage *currentFilteredVideoFrame = [stillImageFilter imageFromCurrentFramebuffer];//从当前滤镜缓冲区获取滤镜图片
    UIImageView *imagev=[[UIImageView alloc] initWithImage:currentFilteredVideoFrame];
    imagev.frame=CGRectMake(0, 100, W, H - 100);
    [self.view addSubview:imagev];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
