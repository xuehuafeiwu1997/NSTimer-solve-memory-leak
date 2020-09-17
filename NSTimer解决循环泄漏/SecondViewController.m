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
    
    /**
     只有repeats为YES时重复触发定时器时才会出现内存泄漏的问题
     */
    self.timer = [NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(timerRun) userInfo:nil repeats:NO];
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSDefaultRunLoopMode];
    /**
     下面的这种带block的写法，当repeat为YES时，如果不使用weakSelf时，也是存在内存泄漏，但是当使用的是weakSelf时，内存泄漏就不存在了。
     */
//    __weak typeof(self) weakSelf = self;
//    self.timer = [NSTimer timerWithTimeInterval:1.0 repeats:YES block:^(NSTimer * _Nonnull timer) {
//        [weakSelf timerRun];
//    }];
    
}

- (void)timerRun {
    NSLog(@"运行了定时方法");
}

- (void)dealloc {
    [self.timer invalidate];
    NSLog(@"SecondViewController执行了dealloc");
}

@end
