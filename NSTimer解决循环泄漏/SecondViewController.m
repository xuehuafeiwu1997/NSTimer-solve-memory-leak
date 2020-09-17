//
//  SecondViewController.m
//  NSTimer解决循环泄漏
//
//  Created by 许明洋 on 2020/9/17.
//  Copyright © 2020 许明洋. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@property (nonatomic, strong) NSTimer *timer;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"第二个控制器";
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.timer = [NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(timerRun) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSDefaultRunLoopMode];
}

- (void)timerRun {
    NSLog(@"运行了定时方法");
}

- (void)dealloc {
    [self.timer invalidate];
    NSLog(@"SecondViewController执行了dealloc");
}

@end
