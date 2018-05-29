//
//  HYGyroTool.h
//  HYTestA
//
//  Created by 印度阿三 on 2017/7/19.
//  Copyright © 2017年 印度阿三. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface HYGyroTool : NSObject
- (void)startUpdateAccelerometerResult:(void (^)(CGVector SCreenAngle, double SCreenSlope))result;

@end
