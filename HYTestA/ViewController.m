//
//  ViewController.m
//  HYTestA
//
//  Created by 印度阿三 on 2017/7/12.
//  Copyright © 2017年 印度阿三. All rights reserved.
//

#import "ViewController.h"
#import "HYAnimationView.h"
#import "HYGyroTool.h"
@interface ViewController ()

@property (nonatomic,weak) HYAnimationView *subView;

@property (nonatomic,strong) HYGyroTool *gyroTool;
@end
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.view addSubview:({
        HYAnimationView *subView = [[HYAnimationView alloc] init];
        subView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.width);
        subView.pelletCount = 5;
        subView.backgroundColor = [UIColor grayColor];
        _subView = subView;
        
        subView;
    })];
    
   
    
}



- (IBAction)clickBtn {
    
    [self.subView startAnimation];
    
    [self.gyroTool startUpdateAccelerometerResult:^(CGVector SCreenAngle, double SCreenSlope) {
        // 传值
        [self.subView setDirectionAngle:SCreenAngle andSlope:SCreenSlope];
        
    }];
    
}

-(HYGyroTool *)gyroTool{
    if (!_gyroTool) {
        _gyroTool = [[HYGyroTool alloc] init];
    }
    return _gyroTool;
}


/***************************************************************************/
- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    
    
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    //    UILabel *label = [[UILabel alloc] init];
    //    label.textAlignment = NSTextAlignmentCenter;
    //    label.backgroundColor = [UIColor whiteColor];
    //    label.font = [UIFont systemFontOfSize:20];
    //    label.numberOfLines =0;
    //    label.text = @"天青色等烟雨\n而我在等你\n炊烟袅袅升起\n隔江千万里,天青色等烟雨而我在等你炊烟袅袅升起隔江千万里等你炊烟袅袅升起隔江千万里,等你炊烟袅袅升起隔江千万里等你炊烟袅袅升起隔江千万里";
    //    [self.view addSubview:label];
    //    CGSize labelSize = [label sizeThatFits:CGSizeMake([UIScreen mainScreen].bounds.size.width, MAXFLOAT)];
    //
    //
    //    NSLog(@"frame = %@", NSStringFromCGRect(label.frame));
    //    //[label sizeToFit];
    //    label.frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.width, labelSize.height);
    //
    //    NSLog(@"frame = %@", NSStringFromCGRect(label.frame));
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
