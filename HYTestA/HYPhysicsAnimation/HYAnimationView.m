//
//  HYAnimationView.m
//  HYTestA
//
//  Created by 印度阿三 on 2017/7/12.
//  Copyright © 2017年 印度阿三. All rights reserved.
//

#import "HYAnimationView.h"

@interface HYAnimationView ()<UIDynamicAnimatorDelegate>

@property (nonatomic,strong) UIDynamicAnimator *animater;
/**
 重力行为
 */
@property (nonatomic,strong)  UIGravityBehavior *garvityBehavior;
/**
 碰撞行为
 */
@property (nonatomic,strong)  UICollisionBehavior *collisionBehavior;
/**
 推力行为
 */
@property (nonatomic,strong) UIPushBehavior *pushBehavior;
/**
 仿真行为
 */
@property (nonatomic,strong)  UIDynamicItemBehavior *itemBehavior;


@property (nonatomic,strong) NSMutableArray <HYPelletView *>*views;

/**
 重力数据
 */
@property (nonatomic) CGVector direction;

@end

@implementation HYAnimationView


- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame ]) {
        _views = [NSMutableArray arrayWithCapacity:0];
    }
    
    
    return self;
}

- (void)setPelletCount:(NSInteger)pelletCount{
    _pelletCount = pelletCount;
    
    [self addDefalutSubViews];
    
}


- (void)addDefalutSubViews{
    
    
    for (int i = 0; i< self.pelletCount; i++) {
        
        HYPelletView *pellet =  [[HYPelletView alloc] init];
        pellet.center = CGPointMake(100+50*i ,0);
        pellet.backColor = [UIColor greenColor];
        pellet.collisionBoundsType = UIDynamicItemCollisionBoundsTypeEllipse;
        pellet.numText = [NSString stringWithFormat:@"%d",i+1];
        [self addSubview:pellet];
        [self.views addObject:pellet];
    }
    
   
    
}


- (void)startAnimation{
    
    [self.animater addBehavior:self.garvityBehavior];
    [self.animater addBehavior:self.collisionBehavior];
    [self.animater addBehavior:self.itemBehavior];
    
}


- (void)setDirectionAngle:(CGVector)directionAngle andSlope:(double)slope{
    self.direction = directionAngle;
    self.garvityBehavior.gravityDirection = self.direction;
}


#pragma mark - 懒加载
-(UIGravityBehavior *)garvityBehavior{
    if (!_garvityBehavior) {
        _garvityBehavior = [[UIGravityBehavior alloc] initWithItems:self.views];
    }
    return _garvityBehavior;
}

-(UICollisionBehavior *)collisionBehavior{
    if (!_collisionBehavior) {
        _collisionBehavior = [[UICollisionBehavior alloc] initWithItems:self.views];
        _collisionBehavior.collisionMode = UICollisionBehaviorModeEverything; //碰撞类型为元素和边界
        [_collisionBehavior setTranslatesReferenceBoundsIntoBoundary:YES];
    }
    return _collisionBehavior;
}

-(UIDynamicItemBehavior *)itemBehavior{
    if (!_itemBehavior) {
        _itemBehavior = [[UIDynamicItemBehavior alloc] initWithItems:self.views];
    }
    return _itemBehavior;
}


-(UIPushBehavior *)pushBehavior{
    if (!_pushBehavior) {
        _pushBehavior = [[UIPushBehavior alloc] initWithItems:self.views
                                                         mode:UIPushBehaviorModeInstantaneous];
    }
    return _pushBehavior;
}


- (UIDynamicAnimator *)animater{
    if (!_animater) {
        _animater = [[UIDynamicAnimator alloc] initWithReferenceView:self];
        _animater.delegate = self;
    }
    return _animater;
}

#pragma -mark 代理
- (void)dynamicAnimatorDidPause:(UIDynamicAnimator *)animator{
    
    //self.garvityBehavior.gravityDirection = self.direction;
    
}

@end

/************* 圆球 ***************/
@interface HYPelletView ()

@end

@implementation HYPelletView;
@synthesize  collisionBoundsType;

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        [self setFrame:CGRectMake(0, 0, 40, 40)];
        self.layer.cornerRadius = 20;
        self.layer.borderColor = [UIColor grayColor].CGColor;
        self.layer.borderWidth = 2;
        self.textAlignment = NSTextAlignmentCenter;
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    self.layer.cornerRadius = self.frame.size.width *0.5;
    self.layer.masksToBounds= YES;
}


- (void)setNumText:(NSString *)numText{

    _numText = numText;
    self.text = numText;
}

- (void)setBackColor:(UIColor *)backColor{
    _backColor = backColor;
    self.backgroundColor = backColor;

}


@end


