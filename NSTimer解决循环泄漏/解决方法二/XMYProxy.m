//
//  XMYProxy.m
//  NSTimer解决循环泄漏
//
//  Created by 许明洋 on 2020/9/17.
//  Copyright © 2020 许明洋. All rights reserved.
//

#import "XMYProxy.h"

@implementation XMYProxy

+ (instancetype)proxyWithTarget:(id)target {
    XMYProxy *proxy = [[XMYProxy alloc] init];
    proxy.target = target;
    return proxy;
}

- (id)forwardingTargetForSelector:(SEL)aSelector {
    return self.target;
}

- (void)dealloc {
    NSLog(@"XMYProxy执行了dealloc方法");
}

@end
