//
//  ViewController.m
//  GPU_ImageLearning_Engineering
//
//  Created by 汤义 on 2018/7/11.
//  Copyright © 2018年 汤义. All rights reserved.
//

#import "ViewController.h"
#import "TYGPUImageVideoCameraViewController.h"
#import "TYGPUImageViewViewController.h"

@interface ViewController ()<GPUImageMovieDelegate,GPUImageMovieWriterDelegate,GPUImageVideoCameraDelegate,UITableViewDelegate,UITableViewDataSource>
@property(nonatomic, strong) GPUImageVideoCamera *videocamera;//摄像
@property(nonatomic, strong) GPUImageStillCamera *stillCamera;//拍照

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *nameArr;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    [self initButView];
    _nameArr = [NSArray arrayWithObjects:@"视频",@"图片", nil];
    [self initTableView];
}

- (void)initTableView{
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, W, H) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _nameArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%@",_nameArr[indexPath.row]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        TYGPUImageVideoCameraViewController *vc = [[TYGPUImageVideoCameraViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }else if(indexPath.row == 1){
        TYGPUImageViewViewController *vc = [[TYGPUImageViewViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
