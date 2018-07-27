//
//  TYQueue.m
//  GPU_ImageLearning_Engineering
//
//  Created by 汤义 on 2018/7/17.
//  Copyright © 2018年 汤义. All rights reserved.
//

#import "TYQueue.h"

@implementation TYQueue
- (instancetype)init{
    self = [super init];
    if (self) {
        //串行
        _responsiveQueue = dispatch_queue_create("myQueue", nil);
        //并发
//        _responsiveQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0);
    }
    return self;
}
+ (TYQueue *)singleton {
    static dispatch_once_t onceToken;
    static TYQueue *queue = nil;
    dispatch_once(&onceToken, ^{
        queue = [[[self class] alloc] init];
    });
    return queue;
}

+ (dispatch_queue_t)accessQueue{
    return [[TYQueue singleton] responsiveQueue];
}
@end
