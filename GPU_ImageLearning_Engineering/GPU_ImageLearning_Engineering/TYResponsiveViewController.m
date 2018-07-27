//
//  TYResponsiveViewController.m
//  GPU_ImageLearning_Engineering
//
//  Created by 汤义 on 2018/7/17.
//  Copyright © 2018年 汤义. All rights reserved.
//

#import "TYResponsiveViewController.h"
#import "TYResponsive.h"
@interface TYResponsiveViewController ()
@property (nonatomic, weak) UIImageView *imageView1;
@property (nonatomic, weak) UIImageView *imageView2;
@end

@implementation TYResponsiveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initImageView];
    [self loadingImage];
}

- (void)initImageView{
    UIImageView *imageView1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 64, W, 300)];
    [self.view addSubview:_imageView1 = imageView1];
    
    UIImageView *imageView2 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 374, W, 300)];
    [self.view addSubview:_imageView2 = imageView2];
}

- (void)loadingImage{
    NSString *fileURL1 = @"http://10.10.61.218:8080/name/0.png";
    NSString *fileURL2 = @"http://10.10.61.218:8080/name/11.png";
    implementResponse(^{
        [NSThread sleepForTimeInterval:2];
        for (int i = 0; i < 8; i++) {
            NSLog(@"这是第:%@个线程",[NSThread currentThread]);
        }
        NSData * data = [NSData dataWithContentsOfURL:[NSURL URLWithString:fileURL1]];
        dispatch_async(dispatch_get_main_queue(), ^{
            _imageView1.image = [UIImage imageWithData:data];
        });
    });
    
    implementResponse(^{
        NSData * data = [NSData dataWithContentsOfURL:[NSURL URLWithString:fileURL2]];
        dispatch_async(dispatch_get_main_queue(), ^{
            _imageView2.image = [UIImage imageWithData:data];
        });
    });
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
