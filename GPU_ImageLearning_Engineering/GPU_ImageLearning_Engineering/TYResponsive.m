//
//  TYResponsive.m
//  GPU_ImageLearning_Engineering
//
//  Created by 汤义 on 2018/7/17.
//  Copyright © 2018年 汤义. All rights reserved.
//

#import "TYResponsive.h"
#import "TYQueue.h"
void implementResponse(void (^block) (void)){
    dispatch_queue_t responsiveQueue = [TYQueue accessQueue];
    dispatch_async(responsiveQueue, block);
}

@implementation TYResponsive

@end
