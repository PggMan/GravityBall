//
//  HYAnimationView.h
//  HYTestA
//
//  Created by 印度阿三 on 2017/7/12.
//  Copyright © 2017年 印度阿三. All rights reserved.
//

#import <UIKit/UIKit.h>
/***********     ************/
@interface HYAnimationView : UIView

/**
 小球数量
 */
@property (nonatomic) NSInteger pelletCount;

- (void)startAnimation;

- (void)setDirectionAngle:(CGVector)directionAngle andSlope:(double)slope;
@end




/************* 圆球 ***************/
@interface HYPelletView : UILabel

/**
 数字
 */
@property (nonatomic,copy) NSString *numText;

/**
 背景颜色
 */
@property (nonatomic,strong) UIColor *backColor;

/**需要重写这个属性才能实现圆形仿真 iOS9及以上 */
@property (nonatomic,assign) UIDynamicItemCollisionBoundsType collisionBoundsType;

@end
