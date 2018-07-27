//
//  TYQueue.h
//  GPU_ImageLearning_Engineering
//
//  Created by 汤义 on 2018/7/17.
//  Copyright © 2018年 汤义. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TYQueue : NSObject
@property (nonatomic, strong) dispatch_queue_t responsiveQueue;
+ (TYQueue *)singleton;
+ (dispatch_queue_t)accessQueue;
@end
