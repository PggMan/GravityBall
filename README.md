# GravityBall
实现仿真重力效果

1 - HYGyroTool 
   * 负责获取重力坐标 x/y/z轴
   * It is responsible for obtaining the gravity coordinate x/y/z axis.
           
2 - HYAnimationView 
   * 动画展示View   
   * It is responsible for showing the animation effect
                
### 代码 
```objc
// 1
- (void)viewDidLoad {
    [super viewDidLoad];
    // Create 动画展示View
    [self.view addSubview:({
        HYAnimationView *subView = [[HYAnimationView alloc] init];
        subView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.width);
        subView.pelletCount = 5;
        subView.backgroundColor = [UIColor grayColor];
        _subView = subView;
        
        subView;
    })];
}
// 2
- (IBAction)clickBtn {
    // run(启动) 
    [self.subView startAnimation];
    // 实时监听 Real-time monitoring
    [self.gyroTool startUpdateAccelerometerResult:^(CGVector SCreenAngle, double SCreenSlope) {
        // setValue 传值 
        [self.subView setDirectionAngle:SCreenAngle andSlope:SCreenSlope];
        
    }];
    
}
```
