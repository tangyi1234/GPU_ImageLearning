//
//  TYGPUImageVideoCameraViewController.m
//  GPU_ImageLearning_Engineering
//
//  Created by 汤义 on 2018/7/11.
//  Copyright © 2018年 汤义. All rights reserved.
//

#import "TYGPUImageVideoCameraViewController.h"

@interface TYGPUImageVideoCameraViewController ()
@property (nonatomic, strong) GPUImageVideoCamera *videocamera;
@end

@implementation TYGPUImageVideoCameraViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initButView];
}

- (void)initButView{
    UIButton *but = [UIButton buttonWithType:UIButtonTypeCustom];
    but.frame = CGRectMake(10, 100, 150, 30);
    but.backgroundColor = [UIColor redColor];
    [but setTitle:@"视频" forState:UIControlStateNormal];
    [but addTarget:self action:@selector(selectorBut) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:but];
}

- (void)selectorBut {
    //第一个参数：相机捕获视屏或图片的质量.有一次啊选项
    /*AVCaptureSessionPresetPhoto
     AVCaptureSessionPresetHigh
     AVCaptureSessionPresetMedium
     AVCaptureSessionPresetLow
     AVCaptureSessionPreset320x240
     AVCaptureSessionPreset352x288
     AVCaptureSessionPreset640x480
     AVCaptureSessionPreset960x540
     AVCaptureSessionPreset1280x720
     AVCaptureSessionPreset1920x1080
     AVCaptureSessionPreset3840x2160
     AVCaptureSessionPresetiFrame960x540
     AVCaptureSessionPresetiFrame1280x720
     */
    //第二个参数相机的位置
    /*typedef NS_ENUM(NSInteger, AVCaptureDevicePosition) {
     AVCaptureDevicePositionUnspecified         = 0,
     AVCaptureDevicePositionBack                = 1,
     AVCaptureDevicePositionFront               = 2
     } NS_AVAILABLE(10_7, 4_0) __TVOS_PROHIBITED;
     */
    
    GPUImageVideoCamera *videocamera=[[GPUImageVideoCamera alloc] initWithSessionPreset:AVCaptureSessionPreset640x480 cameraPosition:AVCaptureDevicePositionBack];
//    videocamera.delegate = self;
    self.videocamera=videocamera;//这个相机一定要用一个强引用，防止销毁
    //设置下面这个后，倒转手机后，画面也会跟着倒过来
    videocamera.horizontallyMirrorFrontFacingCamera =NO;
    videocamera.horizontallyMirrorRearFacingCamera =NO;
    /*捕获画面的方向设置，
     typedef NS_ENUM(NSInteger, UIInterfaceOrientation) {
     UIInterfaceOrientationUnknown            = UIDeviceOrientationUnknown,
     UIInterfaceOrientationPortrait           = UIDeviceOrientationPortrait,
     UIInterfaceOrientationPortraitUpsideDown = UIDeviceOrientationPortraitUpsideDown,
     UIInterfaceOrientationLandscapeLeft      = UIDeviceOrientationLandscapeRight,
     UIInterfaceOrientationLandscapeRight     = UIDeviceOrientationLandscapeLeft
     } __TVOS_PROHIBITED;
     */
    videocamera.outputImageOrientation =UIInterfaceOrientationPortrait;
    
    //创建滤镜
    GPUImageSepiaFilter *filter = [[GPUImageSepiaFilter alloc] init];
    
    
    //相机添加滤镜对象
    
    [videocamera addTarget:filter];
    //创建滤镜显示的view
    GPUImageView *filterView=[[GPUImageView alloc] initWithFrame:CGRectMake(10,150, 300,300)];
    [self.view addSubview:filterView];//添加滤镜view到view上
    
    //如果要用控制器本身的view作滤镜显示view要把控制器的view强转成GPUIMageView，如果用的是storyBoard，storyboard中的相应地view类型名要改成GPUIMageview
    //    GPUImageView *filterView = (GPUImageView *)self.view;
    
    //滤镜对象添加要显示的view;
    [filter addTarget:filterView];
    //相机开始捕获图像画面
    [videocamera startCameraCapture];
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
