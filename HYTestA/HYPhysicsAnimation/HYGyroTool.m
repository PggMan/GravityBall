//
//  HYGyroTool.m
//  HYTestA
//
//  Created by 印度阿三 on 2017/7/19.
//  Copyright © 2017年 印度阿三. All rights reserved.
//

#import "HYGyroTool.h"
#import <CoreMotion/CoreMotion.h>
@interface HYGyroTool ()

/**
 回调间隔
 */
@property (nonatomic) NSTimeInterval updateInterval;;
@property (nonatomic,strong) CMMotionManager *mManager;
@end


@implementation HYGyroTool




- (CMMotionManager *)mManager
{
    if (!_mManager) {
        _updateInterval = 0.2;
        _mManager = [[CMMotionManager alloc] init];
        
    }
    return _mManager;
}


- (void)startUpdateAccelerometerResult:(void (^)(CGVector SCreenAngle, double SCreenSlope))result
{
    if ([self.mManager isAccelerometerAvailable] == YES) {
        //回调会一直调用,建议获取到就调用下面的停止方法，需要再重新开始，当然如果需求是实时不间断的话可以等离开页面之后再stop
        [self.mManager setAccelerometerUpdateInterval:self.updateInterval];
        [self.mManager startAccelerometerUpdatesToQueue:[NSOperationQueue currentQueue] withHandler:^(CMAccelerometerData *accelerometerData, NSError *error)
         {
             double x = round(accelerometerData.acceleration.x *10)/10;
             double y = round(accelerometerData.acceleration.y*10)/10;
             double z = accelerometerData.acceleration.z;
             
             NSLog(@"x轴方向:%f-- y轴方向:%f -- z轴方向:%f",x,y,z);
             
             CGVector SCreenAngle = CGVectorMake(x, -y);
             
             double SCreenSlope = (1.0 - fabs(z));
             
            !result?:result(SCreenAngle ,SCreenSlope);
         }];
    }
    
    
    
    
}

- (void)stopUpdate
{
    if ([self.mManager isAccelerometerActive] == YES)
    {
        [self.mManager stopAccelerometerUpdates];
    }
}

- (void)dealloc
{
    _mManager = nil;
}
@end
